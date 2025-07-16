# DebugTrace

**DebugTrace** is a modern tool for tracing Windows process loader activity and capturing debug output, inspired by the `gflags /run` functionality and building on concepts from [LoaderLog](https://github.com/TimMisiak/LoaderLog). DebugTrace extends these ideas by supporting all Windows global flags and providing debug output capture.

## Overview

DebugTrace allows you to capture the kernel debug stream from a process directly, without the need to attach a tool like [DebugView](https://learn.microsoft.com/en-us/sysinternals/downloads/debugview) or a full debugger. This makes it easy to observe loader activity, heap operations, and other debug output emitted by Windows applications, all from the command line.

**DebugTrace** provides:

- A simple command-line interface to launch any process with custom global flags.
- Fine-grained control over all documented (and some undocumented) Windows global flags.
- Real-time capture and display of all debug output, including loader snaps, heap diagnostics, and more.
- Avoids preserving modified global flags in the Windows registry — flags are set only for the launched process.
- A codebase written in Swift, designed for maintainability and extensibility.

## Key Features

- **All Global Flags Supported:** Enable or disable any combination of Windows global flags for the target process, not just loader snaps.
- **Comprehensive Debug Output:** Captures all debug strings, loader events, exceptions, and more, providing a complete trace of process activity.
- **Modern, Clean Codebase:** Written in Swift, with a focus on clarity, safety, and extensibility.

## Why Use DebugTrace?

- **Diagnose DLL load failures, heap corruption, and other subtle bugs** without attaching a full debugger.
- **Automate diagnostic runs** in CI/CD pipelines or on production systems where a debugger is not available.
- **Gain insight into process startup and runtime behavior** with minimal setup.

## Usage

```pwsh
dbgtrc [+flag1,-flag2,...] -- <command> [args...]
```

- Flags are specified as a comma-separated list, with `+` to enable and `-` to disable.
- Use `--` to separate DebugTrace options from the command to run.

### Example

To run `dbgtrc.exe` with loader snaps and the application verifier enabled:

```pwsh
dbgtrc +sls,+vrf -- dbgtrc.exe
```

### Supported Flags

For a comprehensive list of supported global flags, see the [Microsoft Learn documentation on Global Flags](https://learn.microsoft.com/en-us/windows-hardware/drivers/debugger/gflags-flag-table).

## How It Works

DebugTrace launches the target process in a suspended state, modifies its global flags in the PEB (Process Environment Block), and then resumes execution under a debugger loop. All debug events and output are captured and displayed in real time.

## Inspiration and Credits

DebugTrace is inspired by the `gflags /run` feature and by [LoaderLog](https://github.com/TimMisiak/LoaderLog) by Tim Misiak.

## License

BSD 3-Clause License. See [LICENSE](LICENSE) for details.
