// Copyright © 2025 Saleem Abdulrasool <compnerd@compnerd.org>
// SPDX-License-Identifier: BSD-3-Clause

import WinSDK

package struct WindowsError: Error {
  package enum ErrorCode {
    case win32(DWORD)
    case nt(NTSTATUS)
  }

  package let code: ErrorCode

  package init(_ dwCode: DWORD = GetLastError()) {
    self.code = .win32(dwCode)
  }

  package init(_ status: NTSTATUS) {
    self.code = .nt(status)
  }
}

extension WindowsError: CustomStringConvertible {
  package var description: String {
    let dwFlags = FORMAT_MESSAGE_ALLOCATE_BUFFER
                | FORMAT_MESSAGE_FROM_SYSTEM
                | FORMAT_MESSAGE_IGNORE_INSERTS

    var buffer: UnsafeMutablePointer<WCHAR>?
    let dwResult: DWORD

    switch code {
    case let .win32(dwCode):
      dwResult = withUnsafeMutablePointer(to: &buffer) {
        FormatMessageW(dwFlags, nil, dwCode,
                       MAKELANGID(LANG_NEUTRAL, SUBLANG_DEFAULT),
                       UnsafeMutableRawPointer($0)
                          .assumingMemoryBound(to: WCHAR.self),
                       0, nil)
      }

      guard dwResult > 0, buffer != nil else {
        return "Win32 Error \(dwCode)"
      }

    case let .nt(status):
      dwResult = withUnsafeMutablePointer(to: &buffer) {
        FormatMessageW(dwFlags | FORMAT_MESSAGE_FROM_HMODULE, hNTDLL,
                       DWORD(status), MAKELANGID(LANG_NEUTRAL, SUBLANG_DEFAULT),
                       UnsafeMutableRawPointer($0)
                          .assumingMemoryBound(to: WCHAR.self),
                       0, nil)
      }

      guard dwResult > 0, buffer != nil else {
        return "NTSTATUS 0x\(String(status, radix: 16))"
      }
    }

    guard let buffer else { preconditionFailure() }

    defer { _ = LocalFree(buffer) }
    return String(decodingCString: buffer, as: UTF16.self)
  }
}
