@echo off
setlocal EnableExtensions DisableDelayedExpansion
pushd "%~dp0" || exit /b 1

echo ============================================================
echo IT VIP - Windows 10 Build and Packaging
echo Builds separate x64 and x86 releases using Visual Studio.
echo ============================================================

set "VSWHERE=%ProgramFiles(x86)%\Microsoft Visual Studio\Installer\vswhere.exe"
if not exist "%VSWHERE%" (
  echo ERROR: Visual Studio Installer / vswhere.exe was not found.
  echo Install Visual Studio 2022 Build Tools with the "Desktop development with C++" workload.
  echo Then run this file again from the extracted IT VIP project folder.
  popd
  pause
  exit /b 10
)

set "VSROOT="
for /f "usebackq tokens=*" %%I in (`"%VSWHERE%" -latest -products * -requires Microsoft.VisualStudio.Component.VC.Tools.x86.x64 -property installationPath`) do set "VSROOT=%%I"
if not defined VSROOT (
  echo ERROR: No Visual C++ toolchain installation was detected.
  echo Modify Visual Studio 2022 Build Tools and select "Desktop development with C++".
  popd
  pause
  exit /b 11
)
set "VSDEVCMD=%VSROOT%\Common7\Tools\VsDevCmd.bat"
if not exist "%VSDEVCMD%" (
  echo ERROR: VsDevCmd.bat is missing: %VSDEVCMD%
  popd
  pause
  exit /b 12
)

 echo.
echo [1/2] Building x64...
call "%VSDEVCMD%" -no_logo -arch=x64 -host_arch=x64
if errorlevel 1 goto failed
call build.bat msvc
if errorlevel 1 goto failed
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "tools\verify_windows_build.ps1" -ExpectedArchitecture x64 -Compiler dumpbin
if errorlevel 1 goto failed
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "tools\Package-WindowsBuild.ps1" -Architecture x64
if errorlevel 1 goto failed

 echo.
echo [2/2] Building x86...
call "%VSDEVCMD%" -no_logo -arch=x86 -host_arch=x64
if errorlevel 1 goto failed
call build.bat msvc
if errorlevel 1 goto failed
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "tools\verify_windows_build.ps1" -ExpectedArchitecture x86 -Compiler dumpbin
if errorlevel 1 goto failed
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "tools\Package-WindowsBuild.ps1" -Architecture x86
if errorlevel 1 goto failed

echo.
echo SUCCESS: Both architectures built and packaged.
echo Output folder: %CD%\dist
 echo x64: dist\IT-VIP-Windows-x64.zip
 echo x86: dist\IT-VIP-Windows-x86.zip
popd
pause
exit /b 0

:failed
echo.
echo ERROR: Build, verification, or packaging failed. Read the diagnostics above.
echo No release package is marked as successful unless all checks pass.
popd
pause
exit /b 1
