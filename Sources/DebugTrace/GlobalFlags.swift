// Copyright © 2025 Saleem Abdulrasool <compnerd@compnerd.org>
// SPDX-License-Identifier: BSD-3-Clause

import WindowsCore

internal struct GlobalFlags: OptionSet {
  let rawValue: ULONG

  public init(rawValue: ULONG) {
    self.rawValue = rawValue
  }
}

extension GlobalFlags {
  // Stop on Exception
  public static var FLG_STOP_ON_EXCEPTION: GlobalFlags {
    GlobalFlags(rawValue: 0x1)
  }

  // Show Loader Snaps
  public static var FLG_SHOW_LDR_SNAPS: GlobalFlags {
    GlobalFlags(rawValue: 0x2)
  }

  // Debug Initial Command
  public static var FLG_DEBUG_INITIAL_COMMAND: GlobalFlags {
    GlobalFlags(rawValue: 0x4)
  }

  // Stop on hung GUI
  public static var FLG_STOP_ON_HUNG_GUI: GlobalFlags {
    GlobalFlags(rawValue: 0x8)
  }

  // Enable heap tail checking
  public static var FLG_HEAP_ENABLE_TAIL_CHECK: GlobalFlags {
    GlobalFlags(rawValue: 0x10)
  }

  // Enable heap free checking
  public static var FLG_HEAP_ENABLE_FREE_CHECK: GlobalFlags {
    GlobalFlags(rawValue: 0x20)
  }

  // Enable heap parameter checking
  public static var FLG_HEAP_VALIDATE_PARAMETERS: GlobalFlags {
    GlobalFlags(rawValue: 0x40)
  }

  // Enable heap validation on call
  public static var FLG_HEAP_VALIDATE_ALL: GlobalFlags {
    GlobalFlags(rawValue: 0x80)
  }

  // Enable Application Verifier
  public static var FLG_APPLICATION_VERIFIER: GlobalFlags {
    GlobalFlags(rawValue: 0x100)
  }

  // Enable silent process exit monitoring
  public static var FLG_MONITOR_SILENT_PROCESS_EXIT: GlobalFlags {
    GlobalFlags(rawValue: 0x200)
  }

  // Enable pool tagging (Windows 2000/XP only)
  public static var FLG_POOL_ENABLE_TAGGING: GlobalFlags {
    GlobalFlags(rawValue: 0x400)
  }

  // Enable heap tagging
  public static var FLG_HEAP_ENABLE_TAGGING: GlobalFlags {
    GlobalFlags(rawValue: 0x800)
  }

  // Create user mode stack trace database
  public static var FLG_USER_STACK_TRACE_DB: GlobalFlags {
    GlobalFlags(rawValue: 0x1000)
  }

  // Create kernel mode stack trace database
  public static var FLG_KERNEL_STACK_TRACE_DB: GlobalFlags {
    GlobalFlags(rawValue: 0x2000)
  }

  // Maintain a list of objects for each type
  public static var FLG_MAINTAIN_OBJECT_TYPELIST: GlobalFlags {
    GlobalFlags(rawValue: 0x4000)
  }

  // Enable heap tagging by DLL
  public static var FLG_HEAP_ENABLE_TAG_BY_DLL: GlobalFlags {
    GlobalFlags(rawValue: 0x8000)
  }

  // Disable stack extension
  public static var FLG_DISABLE_STACK_EXTENSION: GlobalFlags {
    GlobalFlags(rawValue: 0x10000)
  }

  // Enable debugging of Win32 subsystem
  public static var FLG_ENABLE_CSRDEBUG: GlobalFlags {
    GlobalFlags(rawValue: 0x20000)
  }

  // Enable loading of kernel debugger symbols
  public static var FLG_ENABLE_KDEBUG_SYMBOL_LOAD: GlobalFlags {
    GlobalFlags(rawValue: 0x40000)
  }

  // Disable paging of kernel stacks
  public static var FLG_DISABLE_PAGE_KERNEL_STACK: GlobalFlags {
    GlobalFlags(rawValue: 0x80000)
  }

  // Enable system critical breaks
  public static var FLG_ENABLE_SYSTEM_CRIT_BREAKS: GlobalFlags {
    GlobalFlags(rawValue: 0x100000)
  }

  // Disable heap coalesce on free
  public static var FLG_HEAP_DISABLE_COALESCING: GlobalFlags {
    GlobalFlags(rawValue: 0x200000)
  }

  // Enable close exception
  public static var FLG_ENABLE_CLOSE_EXCEPTIONS: GlobalFlags {
    GlobalFlags(rawValue: 0x400000)
  }

  // Enable exception logging
  public static var FLG_ENABLE_EXCEPTION_LOGGING: GlobalFlags {
    GlobalFlags(rawValue: 0x800000)
  }

  // Enable object handle type tagging
  public static var FLG_ENABLE_HANDLE_TYPE_TAGGING: GlobalFlags {
    GlobalFlags(rawValue: 0x1000000)
  }

  // Enable page heap
  public static var FLG_HEAP_PAGE_ALLOCS: GlobalFlags {
    GlobalFlags(rawValue: 0x2000000)
  }

  // Debug WinLogon
  public static var FLG_DEBUG_INITIAL_COMMAND_EX: GlobalFlags {
    GlobalFlags(rawValue: 0x4000000)
  }

  // Buffer DbgPrint output
  public static var FLG_DISABLE_DBGPRINT: GlobalFlags {
    GlobalFlags(rawValue: 0x8000000)
  }

  // Early critical section event creation
  public static var FLG_CRITSEC_EVENT_CREATION: GlobalFlags {
    GlobalFlags(rawValue: 0x10000000)
  }

  // Stop on unhandled user-mode exception
  public static var FLG_STOP_ON_UNHANDLED_EXCEPTION: GlobalFlags {
    GlobalFlags(rawValue: 0x20000000)
  }

  // Enable bad handles detection
  public static var FLG_ENABLE_HANDLE_EXCEPTIONS: GlobalFlags {
    GlobalFlags(rawValue: 0x40000000)
  }

  // Disable protected DLL verification
  public static var FLG_DISABLE_PROTDLLS: GlobalFlags {
    GlobalFlags(rawValue: 0x80000000)
  }

  // Load image using large pages if possible

  // Object Reference Tracing (Windows Vista and later)

  // Special Pool
}
