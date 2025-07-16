// Copyright © 2025 Saleem Abdulrasool <compnerd@compnerd.org>
// SPDX-License-Identifier: BSD-3-Clause

import Foundation
import WindowsCore

private func ReadProcessStringA(
  _ hProcess: HANDLE!, _ lpString: LPSTR!, _ nLength: WORD
) throws -> String? {
  var NumberOfBytesRead: SIZE_T = 0
  return try withUnsafeTemporaryAllocation(of: CChar.self, capacity: Int(nLength)) {
    guard
      ReadProcessMemory(hProcess, lpString, $0.baseAddress, SIZE_T($0.count), &NumberOfBytesRead)
    else {
      throw WindowsError()
    }
    return String(data: Data(bytes: $0.baseAddress!, count: $0.count), encoding: .ascii)
  }
}

private func ReadProcessStringW(
  _ hProcess: HANDLE!, _ lpString: LPSTR!, _ nLength: WORD
) throws -> String? {
  var NumberOfBytesRead: SIZE_T = 0
  return try withUnsafeTemporaryAllocation(of: WCHAR.self, capacity: Int(nLength)) {
    guard
      ReadProcessMemory(hProcess, lpString, $0.baseAddress, SIZE_T($0.count), &NumberOfBytesRead)
    else {
      throw WindowsError()
    }
    return String(data: Data(bytes: $0.baseAddress!, count: $0.count), encoding: .utf16)
  }
}

private struct ValidationError: Error, CustomStringConvertible {
  public let description: String

  init(_ message: String) {
    self.description = message
  }
}

extension GlobalFlags {
  fileprivate static var spellings: [Substring: GlobalFlags] {
    [
      "soe": .FLG_STOP_ON_EXCEPTION,
      "sls": .FLG_SHOW_LDR_SNAPS,
      "dic": .FLG_DEBUG_INITIAL_COMMAND,
      "shg": .FLG_STOP_ON_HUNG_GUI,
      "htc": .FLG_HEAP_ENABLE_TAIL_CHECK,
      "hfc": .FLG_HEAP_ENABLE_FREE_CHECK,
      "hpc": .FLG_HEAP_VALIDATE_PARAMETERS,
      "hvc": .FLG_HEAP_VALIDATE_ALL,
      "vrf": .FLG_APPLICATION_VERIFIER,
      "ptg": .FLG_POOL_ENABLE_TAGGING,
      "htg": .FLG_HEAP_ENABLE_TAGGING,
      "ust": .FLG_USER_STACK_TRACE_DB,
      "kst": .FLG_KERNEL_STACK_TRACE_DB,
      "otl": .FLG_MAINTAIN_OBJECT_TYPELIST,
      "htd": .FLG_HEAP_ENABLE_TAG_BY_DLL,
      "dse": .FLG_DISABLE_STACK_EXTENSION,
      "d32": .FLG_ENABLE_CSRDEBUG,
      "ksl": .FLG_ENABLE_KDEBUG_SYMBOL_LOAD,
      "dps": .FLG_DISABLE_PAGE_KERNEL_STACK,
      "scb": .FLG_ENABLE_SYSTEM_CRIT_BREAKS,
      "dhc": .FLG_HEAP_DISABLE_COALESCING,
      "ece": .FLG_ENABLE_CLOSE_EXCEPTIONS,
      "eel": .FLG_ENABLE_EXCEPTION_LOGGING,
      "eot": .FLG_ENABLE_HANDLE_TYPE_TAGGING,
      "hpa": .FLG_HEAP_PAGE_ALLOCS,
      "dwl": .FLG_DEBUG_INITIAL_COMMAND_EX,
      "ddp": .FLG_DISABLE_DBGPRINT,
      "cse": .FLG_CRITSEC_EVENT_CREATION,
      "sue": .FLG_STOP_ON_UNHANDLED_EXCEPTION,
      "bhd": .FLG_ENABLE_HANDLE_EXCEPTIONS,
      "dpd": .FLG_DISABLE_PROTDLLS,
    ]
  }
}

private enum OptionParser {
  private enum GlobalFlagsOption {
    case include(GlobalFlags)
    case exclude(GlobalFlags)
  }

  private static func split(arguments: [String]) -> (options: [String], command: [String]) {
    if let index = arguments.firstIndex(of: "--") {
      return (Array(arguments[..<index]), Array(arguments[(index + 1)...]))
    }

    let index =
      arguments.firstIndex { argument in
        !(argument.hasPrefix("+") || argument.hasPrefix("-"))
      } ?? arguments.count
    return (Array(arguments[..<index]), Array(arguments[index...]))
  }

  private static func parse(flag: String) throws -> GlobalFlagsOption {
    switch (flag.prefix(1), flag.dropFirst()) {
    case let ("+", flag):
      guard let option = GlobalFlags.spellings[flag] else {
        throw ValidationError(
          "Unknown flag: '\(flag)'. Valid flags are: \(GlobalFlags.spellings.keys)")
      }
      return .include(option)
    case let ("-", flag):
      guard let option = GlobalFlags.spellings[flag] else {
        throw ValidationError(
          "Unknown flag: '\(flag)'. Valid flags are: \(GlobalFlags.spellings.keys)")
      }
      return .exclude(option)
    default:
      throw ValidationError("Invalid flag: '\(flag)'. Use +<flag> or -<flag>")
    }
  }

  private static func parse(expression: String) throws -> [GlobalFlagsOption] {
    try expression
      .components(separatedBy: ",")
      .compactMap { component in
        let trimmed = component.trimmingCharacters(in: .whitespaces)
        return trimmed.isEmpty ? nil : trimmed
      }
      .map(parse(flag:))
  }

  private static func parse(options flags: [String]) throws -> [GlobalFlagsOption] {
    return try flags.flatMap(parse(expression:))
  }

  public static func parse(_ arguments: [String]) throws -> (flags: GlobalFlags, command: [String])
  {
    let (options, command) = split(arguments: arguments)
    let flags = try parse(options: options)
      .reduce(into: GlobalFlags()) { result, operation in
        switch operation {
        case let .include(flag):
          result.insert(flag)
        case let .exclude(flag):
          result.remove(flag)
        }
      }
    return (flags, command)
  }
}

private func trace(_ command: [String], flags: GlobalFlags) throws {
  guard let NtQueryInformationProcess = pfnNtQueryInformationProcess else { return }

  var si = STARTUPINFOW()
  si.cb = DWORD(MemoryLayout.size(ofValue: si))

  var pi = PROCESS_INFORMATION()

  var commandline = Array(command.joined(separator: " ").utf16)
  try commandline.withUnsafeMutableBufferPointer {
    guard
      CreateProcessW(
        nil, $0.baseAddress, nil, nil, false, DEBUG_ONLY_THIS_PROCESS, nil, nil, &si, &pi)
    else {
      throw WindowsError()
    }
  }

  var ReturnLength: DWORD = 0
  var pbi = PROCESS_BASIC_INFORMATION()
  let status = NtQueryInformationProcess(
    pi.hProcess, ProcessBasicInformation, &pbi, ULONG(MemoryLayout.size(ofValue: pbi)),
    &ReturnLength)
  guard SUCCEEDED(status) else {
    throw WindowsError(status)
  }

  let pPEB = UnsafeMutableRawPointer(pbi.PebBaseAddress)

  var NtGlobalFlag: ULONG = 0

  var NumberOfBytesRead: SIZE_T = 0
  // Global Flags are stored in PEB->NtGlobalFlag, which is offset 0xbc.
  guard
    ReadProcessMemory(
      pi.hProcess, pPEB?.advanced(by: 0xbc), &NtGlobalFlag,
      SIZE_T(MemoryLayout.size(ofValue: NtGlobalFlag)), &NumberOfBytesRead)
  else {
    throw WindowsError()
  }

  NtGlobalFlag = GlobalFlags(rawValue: NtGlobalFlag).union(flags).rawValue

  var NumberOfBytesWritten: SIZE_T = 0
  guard
    WriteProcessMemory(
      pi.hProcess, pPEB?.advanced(by: 0xbc), &NtGlobalFlag,
      SIZE_T(MemoryLayout.size(ofValue: NtGlobalFlag)), &NumberOfBytesWritten)
  else {
    throw WindowsError()
  }

  _ = CloseHandle(pi.hThread)

  var event = DEBUG_EVENT()
  repeat {
    guard WaitForDebugEventEx(&event, INFINITE) else {
      throw WindowsError()
    }

    switch event.dwDebugEventCode {
    case CREATE_PROCESS_DEBUG_EVENT:
      print("[Process Created]")
    case EXIT_PROCESS_DEBUG_EVENT:
      print("[Process Terminated]")
    case CREATE_THREAD_DEBUG_EVENT:
      print("[Thread Created]")
    case EXIT_THREAD_DEBUG_EVENT:
      print("[Thread Terminated]")
    case LOAD_DLL_DEBUG_EVENT:
      print("[DLL Loaded]")
    case UNLOAD_DLL_DEBUG_EVENT:
      print("[DLL Unloaded]")
    case EXCEPTION_DEBUG_EVENT:
      print("[Exception]")
    case RIP_EVENT:
      print("[RIP Event] Code: \(event.u.RipInfo.dwError)")
    case OUTPUT_DEBUG_STRING_EVENT:
      let message =
        if event.u.DebugString.fUnicode == 0 {
          try ReadProcessStringA(
            pi.hProcess, event.u.DebugString.lpDebugStringData,
            event.u.DebugString.nDebugStringLength)
        } else {
          try ReadProcessStringW(
            pi.hProcess, event.u.DebugString.lpDebugStringData,
            event.u.DebugString.nDebugStringLength)
        }
      if let message {
        print(message.trimmingCharacters(in: CharacterSet(charactersIn: "\0").union(.newlines)))
      }
    default:
      break
    }

    if event.dwDebugEventCode == EXIT_PROCESS_DEBUG_EVENT { break }

    guard ContinueDebugEvent(event.dwProcessId, event.dwThreadId, DBG_EXCEPTION_NOT_HANDLED) else {
      throw WindowsError()
    }
  } while true

  _ = CloseHandle(pi.hProcess)
}

@main
private struct DebugTrace {
  public static func main() throws {
    let arguments = Array(CommandLine.arguments.dropFirst())

    let result: (flags: GlobalFlags, command: [String])
    do {
      result = try OptionParser.parse(arguments)
    } catch {
      print("Error parsing arguments: \(error)")
      return
    }

    guard !result.command.isEmpty else {
      print("No command provided to trace.")
      return
    }

    try trace(result.command, flags: result.flags)
  }
}
