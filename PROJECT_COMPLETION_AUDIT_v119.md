# IT VIP Project Completion Audit — v119

Date: 2026-11-25
Baseline: `IT_VIP_v0.83.34-dev_COMPLETE_v118.zip`
Candidate: `IT_VIP_v0.83.35-dev_COMPLETE_v119.zip`

## Purpose

v119 addresses the user's immediate Windows 10 handoff problem: the source ZIP is not itself an executable installer. It adds a guided local build and runtime packaging path so the user's Windows computer can produce real x64 and x86 application bundles.

## Added

- `BUILD_WINDOWS_10.bat`: detects a Visual Studio C++ installation through `vswhere`, builds the full MSVC suite separately for x64 and x86, invokes PE architecture verification, and packages each architecture before switching toolchains.
- `tools/Package-WindowsBuild.ps1`: refuses incomplete builds, requires the 34 declared executables, preserves the runtime directory layout expected by the dashboard (`build/`, `assets/`, `config/`, `deployment/`), creates a runnable ZIP, verifies required archive entries, and writes SHA-256.
- `docs/BUILD_ON_WINDOWS_10_AR.md`: Arabic user instructions and qualification boundaries.
- `tests/test_windows_release_packaging_v119.py`: source-contract tests for the Windows handoff.

## Critical packaging detail

`src/app/main.cpp` resolves the project root as the parent of the executable's containing directory and launches companion modules from `<root>\build`. Therefore v119 deliberately places all executables in the package's `build` directory and keeps assets/config/deployment at the package root. The launcher starts `build\ITVIP.exe`.

## Verification

The source package can be checked on this Linux host for Python tests, source contracts, native portable tests, ZIP integrity, and checksum. The actual MSVC build, PE inspection, package creation, GUI launch, and Windows 10 behavior must be run by the user on Windows 10 or by Windows CI. They are not claimed as already completed.

## Remaining release gates

1. Run `BUILD_WINDOWS_10.bat` on Windows 10 with Visual Studio 2022 C++ tools.
2. Resolve any compiler/linker diagnostics and confirm both architecture bundles are produced.
3. Launch each bundle and test dashboard navigation, Arabic/English, assets/audio, all module launches, and settings persistence.
4. Qualify backup/restore on real NTFS/exFAT/FAT32 media and test failure recovery.
5. Complete Authenticode signing and installer qualification before public production distribution.
6. Boot Manager remains read-only preflight/inventory; it is not a bootable media builder.

## Release status

v119 is a cumulative source + Windows build/packaging handoff. It is not itself a prebuilt EXE or signed installer. The generated runtime ZIPs become available only after the Windows build script succeeds on the user's machine.
