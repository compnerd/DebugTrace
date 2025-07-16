// Copyright © 2025 Saleem Abdulrasool <compnerd@compnerd.org>
// SPDX-License-Identifier: BSD-3-Clause

@_exported import WinSDK

@_transparent
package var ABOVE_NORMAL_PRIORITY_CLASS: DWORD {
  DWORD(WinSDK.ABOVE_NORMAL_PRIORITY_CLASS)
}

@_transparent
package var BACKGROUND_BLUE: WORD {
  WORD(WinSDK.BACKGROUND_BLUE)
}

@_transparent
package var BELOW_NORMAL_PRIORITY_CLASS: DWORD {
  DWORD(WinSDK.BELOW_NORMAL_PRIORITY_CLASS)
}

@_transparent
package var CONSOLE_TEXTMODE_BUFFER: DWORD {
  DWORD(WinSDK.CONSOLE_TEXTMODE_BUFFER)
}

@_transparent
package var CREATE_PROCESS_DEBUG_EVENT: DWORD {
  DWORD(WinSDK.CREATE_PROCESS_DEBUG_EVENT)
}

@_transparent
package var CREATE_THREAD_DEBUG_EVENT: DWORD {
  DWORD(WinSDK.CREATE_THREAD_DEBUG_EVENT)
}

@_transparent
package var DEBUG_ONLY_THIS_PROCESS: DWORD {
  DWORD(WinSDK.DEBUG_ONLY_THIS_PROCESS)
}

@_transparent
package var DISABLE_NEWLINE_AUTO_RETURN: DWORD {
  DWORD(WinSDK.DISABLE_NEWLINE_AUTO_RETURN)
}

@_transparent
package var ENABLE_PROCESSED_INPUT: DWORD {
  DWORD(WinSDK.ENABLE_PROCESSED_INPUT)
}

@_transparent
package var ENABLE_PROCESSED_OUTPUT: DWORD {
  DWORD(WinSDK.ENABLE_PROCESSED_OUTPUT)
}

@_transparent
package var ENABLE_VIRTUAL_TERMINAL_PROCESSING: DWORD {
  DWORD(WinSDK.ENABLE_VIRTUAL_TERMINAL_PROCESSING)
}

@_transparent
package var ENABLE_WRAP_AT_EOL_OUTPUT: DWORD {
  DWORD(WinSDK.ENABLE_WRAP_AT_EOL_OUTPUT)
}

@_transparent
package var ERROR_INVALID_FUNCTION: DWORD {
  DWORD(WinSDK.ERROR_INVALID_FUNCTION)
}

@_transparent
package var ERROR_SUCCESS: DWORD {
  DWORD(WinSDK.ERROR_SUCCESS)
}

@_transparent
package var EXCEPTION_DEBUG_EVENT: DWORD {
  DWORD(WinSDK.EXCEPTION_DEBUG_EVENT)
}

@_transparent
package var EXIT_PROCESS_DEBUG_EVENT: DWORD {
  DWORD(WinSDK.EXIT_PROCESS_DEBUG_EVENT)
}

@_transparent
package var EXIT_THREAD_DEBUG_EVENT: DWORD {
  DWORD(WinSDK.EXIT_THREAD_DEBUG_EVENT)
}

@_transparent
package var FILE_SHARE_DELETE: DWORD {
  DWORD(WinSDK.FILE_SHARE_DELETE)
}

@_transparent
package var FILE_SHARE_READ: DWORD {
  DWORD(WinSDK.FILE_SHARE_READ)
}

@_transparent
package var FILE_SHARE_WRITE: DWORD {
  DWORD(WinSDK.FILE_SHARE_WRITE)
}

@_transparent
package var FOREGROUND_INTENSITY: WORD {
  WORD(WinSDK.FOREGROUND_INTENSITY)
}

@_transparent
package var FORMAT_MESSAGE_ALLOCATE_BUFFER: DWORD {
  DWORD(WinSDK.FORMAT_MESSAGE_ALLOCATE_BUFFER)
}

@_transparent
package var FORMAT_MESSAGE_FROM_HMODULE: DWORD {
  DWORD(WinSDK.FORMAT_MESSAGE_FROM_HMODULE)
}

@_transparent
package var FORMAT_MESSAGE_FROM_SYSTEM: DWORD {
  DWORD(WinSDK.FORMAT_MESSAGE_FROM_SYSTEM)
}

@_transparent
package var FORMAT_MESSAGE_IGNORE_INSERTS: DWORD {
  DWORD(WinSDK.FORMAT_MESSAGE_IGNORE_INSERTS)
}

@_transparent
package var FROM_LEFT_1ST_BUTTON_PRESSED: DWORD {
  DWORD(WinSDK.FROM_LEFT_1ST_BUTTON_PRESSED)
}

@_transparent
package var FROM_LEFT_2ND_BUTTON_PRESSED: DWORD {
  DWORD(WinSDK.FROM_LEFT_2ND_BUTTON_PRESSED)
}

@_transparent
package var GENERIC_READ: DWORD {
  DWORD(WinSDK.GENERIC_READ)
}

@_transparent
package var GENERIC_WRITE: DWORD {
  DWORD(WinSDK.GENERIC_WRITE)
}

@_transparent
package var HIGH_PRIORITY_CLASS: DWORD {
  DWORD(WinSDK.HIGH_PRIORITY_CLASS)
}

@_transparent
package var IDLE_PRIORITY_CLASS: DWORD {
  DWORD(WinSDK.IDLE_PRIORITY_CLASS)
}

@_transparent
package var KEY_EVENT: WORD {
  WORD(WinSDK.KEY_EVENT)
}

@_transparent
package var LANG_NEUTRAL: WORD {
  WORD(WinSDK.LANG_NEUTRAL)
}

@_transparent
package var LEFT_ALT_PRESSED: DWORD {
  DWORD(WinSDK.LEFT_ALT_PRESSED)
}

@_transparent
package var LEFT_CTRL_PRESSED: DWORD {
  DWORD(WinSDK.LEFT_CTRL_PRESSED)
}

@_transparent
package var LOAD_DLL_DEBUG_EVENT: DWORD {
  DWORD(WinSDK.LOAD_DLL_DEBUG_EVENT)
}

@_transparent
package var MOUSE_EVENT: WORD {
  WORD(WinSDK.MOUSE_EVENT)
}

@_transparent
package var MOUSE_HWHEELED: DWORD {
  DWORD(WinSDK.MOUSE_HWHEELED)
}

@_transparent
package var MOUSE_MOVED: DWORD {
  DWORD(WinSDK.MOUSE_MOVED)
}

@_transparent
package var MOUSE_WHEELED: DWORD {
  DWORD(WinSDK.MOUSE_WHEELED)
}

@_transparent
package var NORMAL_PRIORITY_CLASS: DWORD {
  DWORD(WinSDK.NORMAL_PRIORITY_CLASS)
}

@_transparent
package var OUTPUT_DEBUG_STRING_EVENT: DWORD {
  DWORD(WinSDK.OUTPUT_DEBUG_STRING_EVENT)
}

@_transparent
package var PROCESS_QUERY_INFORMATION: DWORD {
  DWORD(WinSDK.PROCESS_QUERY_INFORMATION)
}

@_transparent
package var PROCESS_QUERY_LIMITED_INFORMATION: DWORD {
  DWORD(WinSDK.PROCESS_QUERY_LIMITED_INFORMATION)
}

@_transparent
package var PROCESS_VM_READ: DWORD {
  DWORD(WinSDK.PROCESS_VM_READ)
}

@_transparent
package var REALTIME_PRIORITY_CLASS: DWORD {
  DWORD(WinSDK.REALTIME_PRIORITY_CLASS)
}

@_transparent
package var RIGHTMOST_BUTTON_PRESSED: DWORD {
  DWORD(WinSDK.RIGHTMOST_BUTTON_PRESSED)
}

@_transparent
package var RIGHT_ALT_PRESSED: DWORD {
  DWORD(WinSDK.RIGHT_ALT_PRESSED)
}

@_transparent
package var RIGHT_CTRL_PRESSED: DWORD {
  DWORD(WinSDK.RIGHT_CTRL_PRESSED)
}

@_transparent
package var RIP_EVENT: DWORD {
  DWORD(WinSDK.RIP_EVENT)
}

@_transparent
package var SHIFT_PRESSED: DWORD {
  DWORD(WinSDK.SHIFT_PRESSED)
}

@_transparent
package var STANDARD_RIGHTS_READ: DWORD {
  DWORD(WinSDK.STANDARD_RIGHTS_READ)
}

@_transparent
package var SUBLANG_DEFAULT: WORD {
  WORD(WinSDK.SUBLANG_DEFAULT)
}

@_transparent
package var TH32CS_SNAPHEAPLIST: DWORD {
  DWORD(WinSDK.TH32CS_SNAPHEAPLIST)
}

@_transparent
package var TH32CS_SNAPPROCESS: DWORD {
  DWORD(WinSDK.TH32CS_SNAPPROCESS)
}

@_transparent
package var TH32CS_SNAPTHREAD: DWORD {
  DWORD(WinSDK.TH32CS_SNAPTHREAD)
}

@_transparent
package var TH32CS_SNAPMODULE: DWORD {
  DWORD(WinSDK.TH32CS_SNAPMODULE)
}

@_transparent
package var TH32CS_SNAPALL: DWORD {
  TH32CS_SNAPHEAPLIST | TH32CS_SNAPPROCESS | TH32CS_SNAPTHREAD | TH32CS_SNAPMODULE
}

@_transparent
package var TOKEN_QUERY: DWORD {
  DWORD(WinSDK.TOKEN_QUERY)
}

@_transparent
package var TOKEN_READ: DWORD {
  DWORD(STANDARD_RIGHTS_READ | TOKEN_QUERY)
}

@_transparent
package var UNLOAD_DLL_DEBUG_EVENT: DWORD {
  DWORD(WinSDK.UNLOAD_DLL_DEBUG_EVENT)
}

@_transparent
package var WINDOW_BUFFER_SIZE_EVENT: WORD {
  WORD(WinSDK.WINDOW_BUFFER_SIZE_EVENT)
}

@_transparent
package func HIWORD(_ value: DWORD) -> WORD {
  return WORD((value >> 16) & 0xffff)
}

@_transparent
package func MAKELANGID(_ primary: WORD, _ sub: WORD) -> DWORD {
  return DWORD((sub << 10) | primary)
}

@_transparent
package func SUCCEEDED(_ status: NTSTATUS) -> Bool {
  return status >= 0
}
