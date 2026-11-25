@echo off
setlocal EnableExtensions DisableDelayedExpansion
pushd "%~dp0" || exit /b 1
if not exist build mkdir build
:: Remove stale executables so a failed partial build cannot look complete.
for %%F in (scanner usb_guard tempclean activator pwrecover portable_manager security_center ai_assistant github_hub api_manager agent_studio provider_hub provider_runtime team_studio team_runner workflow_studio workflow_runner run_history memory_center session_center backup_center settings_center permissions_center copy_manager scanner_gui usb_guard_gui tempclean_gui activator_gui pwrecover_gui security_center_gui system_monitor_gui ITVIP.exe ITVIPNativeVerify.exe ITVIPBootstrap.exe) do if exist "build\%%F.exe" del /q "build\%%F.exe"
call :manifest user asInvoker || goto failed
call :manifest admin requireAdministrator || goto failed
set "COMPILER=%~1"
if "%COMPILER%"=="" set "COMPILER=msvc"
if /i "%COMPILER%"=="msvc" goto msvc
if /i "%COMPILER%"=="mingw" goto mingw
echo Usage: build.bat [msvc^|mingw]
goto failed
:msvc
where cl.exe >nul 2>&1 || (echo Open a Visual Studio 2022 Developer Command Prompt first.& goto failed)
where rc.exe >nul 2>&1 || (echo Windows Resource Compiler rc.exe was not found.& goto failed)
rc /nologo /fo "build\itvip_icon.res" "assets\itvip_icon.rc" || goto failed
for %%S in (scanner usb_guard tempclean activator pwrecover portable_manager security_center copy_manager) do call :build_msvc %%S || goto failed
call :build_ai_msvc || goto failed
call :build_github_msvc || goto failed
call :build_api_msvc || goto failed
call :build_agent_msvc || goto failed
call :build_provider_msvc || goto failed
call :build_runtime_msvc || goto failed
call :build_team_msvc || goto failed
call :build_team_runner_msvc || goto failed
call :build_workflow_msvc || goto failed
call :build_workflow_runner_msvc || goto failed
call :build_history_msvc || goto failed
call :build_memory_msvc || goto failed
call :build_session_msvc || goto failed
call :build_backup_msvc || goto failed
call :build_settings_msvc || goto failed
call :build_permissions_msvc || goto failed
call :build_gui_msvc || goto failed
for %%G in (scanner_gui usb_guard_gui tempclean_gui activator_gui pwrecover_gui security_center_gui) do call :build_tool_gui_msvc %%G || goto failed
call :build_system_monitor_msvc || goto failed
call :build_native_verifier_msvc || goto failed
call :build_bootstrapper_msvc || goto failed
goto success
:mingw
if not defined CXX set "CXX=g++"
if not defined WINDRES set "WINDRES=windres"
where "%CXX%" >nul 2>&1 || goto failed
where "%WINDRES%" >nul 2>&1 || goto failed
for %%R in (user admin) do "%WINDRES%" --input="build\%%R.rc" --include-dir="build" --output="build\%%R.res.o" --output-format=coff || goto failed
for %%S in (scanner usb_guard tempclean activator pwrecover portable_manager security_center copy_manager) do call :build_mingw %%S || goto failed
call :build_ai_mingw || goto failed
call :build_github_mingw || goto failed
call :build_api_mingw || goto failed
call :build_agent_mingw || goto failed
call :build_provider_mingw || goto failed
call :build_runtime_mingw || goto failed
call :build_team_mingw || goto failed
call :build_team_runner_mingw || goto failed
call :build_workflow_mingw || goto failed
call :build_workflow_runner_mingw || goto failed
call :build_history_mingw || goto failed
call :build_memory_mingw || goto failed
call :build_session_mingw || goto failed
call :build_backup_mingw || goto failed
call :build_settings_mingw || goto failed
call :build_permissions_mingw || goto failed
call :build_gui_mingw || goto failed
for %%G in (scanner_gui usb_guard_gui tempclean_gui activator_gui pwrecover_gui security_center_gui) do call :build_tool_gui_mingw %%G || goto failed
call :build_system_monitor_mingw || goto failed
call :build_native_verifier_mingw || goto failed
call :build_bootstrapper_mingw || goto failed
goto success
:build_ai_msvc
cl /nologo /std:c++17 /MT /O2 /EHsc /W4 /utf-8 /DUNICODE /D_UNICODE /D_WIN32_WINNT=0x0A00 "src\modules\ai_assistant.cpp" /Fo:"build\ai_assistant.obj" /Fe:"build\ai_assistant.exe" /link "build\itvip_icon.res" /SUBSYSTEM:WINDOWS /MANIFEST:EMBED /MANIFESTUAC:NO /MANIFESTINPUT:"build\user.manifest" winhttp.lib advapi32.lib comctl32.lib winmm.lib
exit /b %errorlevel%
:build_ai_mingw
"%CXX%" -std=c++17 -O2 -Wall -Wextra -Wpedantic -static -static-libgcc -static-libstdc++ -municode -mwindows -DUNICODE -D_UNICODE -D_WIN32_WINNT=0x0A00 -o "build\ai_assistant.exe" "src\modules\ai_assistant.cpp" "build\user.res.o" -lwinhttp -ladvapi32 -lcomctl32 -lwinmm
exit /b %errorlevel%
:build_github_msvc
cl /nologo /std:c++17 /MT /O2 /EHsc /W4 /utf-8 /DUNICODE /D_UNICODE /D_WIN32_WINNT=0x0A00 "src\modules\github_hub.cpp" /Fo:"build\github_hub.obj" /Fe:"build\github_hub.exe" /link "build\itvip_icon.res" /SUBSYSTEM:WINDOWS /MANIFEST:EMBED /MANIFESTUAC:NO /MANIFESTINPUT:"build\user.manifest" winhttp.lib advapi32.lib comctl32.lib winmm.lib
exit /b %errorlevel%
:build_github_mingw
"%CXX%" -std=c++17 -O2 -Wall -Wextra -Wpedantic -static -static-libgcc -static-libstdc++ -municode -mwindows -DUNICODE -D_UNICODE -D_WIN32_WINNT=0x0A00 -o "build\github_hub.exe" "src\modules\github_hub.cpp" "build\user.res.o" -lwinhttp -ladvapi32 -lcomctl32 -lwinmm
exit /b %errorlevel%
:build_api_msvc
cl /nologo /std:c++17 /MT /O2 /EHsc /W4 /utf-8 /DUNICODE /D_UNICODE /D_WIN32_WINNT=0x0A00 "src\modules\api_manager.cpp" /Fo:"build\api_manager.obj" /Fe:"build\api_manager.exe" /link "build\itvip_icon.res" /SUBSYSTEM:WINDOWS /MANIFEST:EMBED /MANIFESTUAC:NO /MANIFESTINPUT:"build\user.manifest" winhttp.lib advapi32.lib comctl32.lib winmm.lib
exit /b %errorlevel%
:build_api_mingw
"%CXX%" -std=c++17 -O2 -Wall -Wextra -Wpedantic -static -static-libgcc -static-libstdc++ -municode -mwindows -DUNICODE -D_UNICODE -D_WIN32_WINNT=0x0A00 -o "build\api_manager.exe" "src\modules\api_manager.cpp" "build\user.res.o" -lwinhttp -ladvapi32 -lcomctl32 -lwinmm
exit /b %errorlevel%

:build_agent_msvc
cl /nologo /std:c++17 /MT /O2 /EHsc /W4 /utf-8 /DUNICODE /D_UNICODE /D_WIN32_WINNT=0x0A00 "src\modules\agent_studio.cpp" /Fo:"build\agent_studio.obj" /Fe:"build\agent_studio.exe" /link "build\itvip_icon.res" /SUBSYSTEM:WINDOWS /MANIFEST:EMBED /MANIFESTUAC:NO /MANIFESTINPUT:"build\user.manifest" comctl32.lib winmm.lib
exit /b %errorlevel%
:build_agent_mingw
"%CXX%" -std=c++17 -O2 -Wall -Wextra -Wpedantic -static -static-libgcc -static-libstdc++ -municode -mwindows -DUNICODE -D_UNICODE -D_WIN32_WINNT=0x0A00 -o "build\agent_studio.exe" "src\modules\agent_studio.cpp" "build\user.res.o" -lcomctl32 -lwinmm
exit /b %errorlevel%
:build_provider_msvc
cl /nologo /std:c++17 /MT /O2 /EHsc /W4 /utf-8 /DUNICODE /D_UNICODE /D_WIN32_WINNT=0x0A00 "src\modules\provider_hub.cpp" /Fo:"build\provider_hub.obj" /Fe:"build\provider_hub.exe" /link "build\itvip_icon.res" /SUBSYSTEM:WINDOWS /MANIFEST:EMBED /MANIFESTUAC:NO /MANIFESTINPUT:"build\user.manifest" comctl32.lib shell32.lib winmm.lib
exit /b %errorlevel%
:build_provider_mingw
"%CXX%" -std=c++17 -O2 -Wall -Wextra -Wpedantic -static -static-libgcc -static-libstdc++ -municode -mwindows -DUNICODE -D_UNICODE -D_WIN32_WINNT=0x0A00 -o "build\provider_hub.exe" "src\modules\provider_hub.cpp" "build\user.res.o" -lcomctl32 -lshell32 -lwinmm
exit /b %errorlevel%

:build_runtime_msvc
cl /nologo /std:c++17 /MT /O2 /EHsc /W4 /utf-8 /DUNICODE /D_UNICODE /D_WIN32_WINNT=0x0A00 "src\modules\provider_runtime.cpp" /Fo:"build\provider_runtime.obj" /Fe:"build\provider_runtime.exe" /link "build\itvip_icon.res" /SUBSYSTEM:WINDOWS /MANIFEST:EMBED /MANIFESTUAC:NO /MANIFESTINPUT:"build\user.manifest" winhttp.lib advapi32.lib comctl32.lib winmm.lib
exit /b %errorlevel%
:build_runtime_mingw
"%CXX%" -std=c++17 -O2 -Wall -Wextra -Wpedantic -static -static-libgcc -static-libstdc++ -municode -mwindows -DUNICODE -D_UNICODE -D_WIN32_WINNT=0x0A00 -o "build\provider_runtime.exe" "src\modules\provider_runtime.cpp" "build\user.res.o" -lwinhttp -ladvapi32 -lcomctl32 -lwinmm
exit /b %errorlevel%

:build_team_msvc
cl /nologo /std:c++17 /MT /O2 /EHsc /W4 /utf-8 /DUNICODE /D_UNICODE /D_WIN32_WINNT=0x0A00 "src\modules\team_studio.cpp" /Fo:"build\team_studio.obj" /Fe:"build\team_studio.exe" /link "build\itvip_icon.res" /SUBSYSTEM:WINDOWS /MANIFEST:EMBED /MANIFESTUAC:NO /MANIFESTINPUT:"build\user.manifest" comctl32.lib winmm.lib
exit /b %errorlevel%
:build_team_mingw
"%CXX%" -std=c++17 -O2 -Wall -Wextra -Wpedantic -static -static-libgcc -static-libstdc++ -municode -mwindows -DUNICODE -D_UNICODE -D_WIN32_WINNT=0x0A00 -o "build\team_studio.exe" "src\modules\team_studio.cpp" "build\user.res.o" -lcomctl32 -lwinmm
exit /b %errorlevel%


:build_team_runner_msvc
cl /nologo /std:c++17 /MT /O2 /EHsc /W4 /utf-8 /DUNICODE /D_UNICODE /D_WIN32_WINNT=0x0A00 "src\modules\team_runner.cpp" /Fo:"build\team_runner.obj" /Fe:"build\team_runner.exe" /link "build\itvip_icon.res" /SUBSYSTEM:WINDOWS /MANIFEST:EMBED /MANIFESTUAC:NO /MANIFESTINPUT:"build\user.manifest" winhttp.lib advapi32.lib comctl32.lib winmm.lib
exit /b %errorlevel%
:build_team_runner_mingw
"%CXX%" -std=c++17 -O2 -Wall -Wextra -Wpedantic -static -static-libgcc -static-libstdc++ -municode -mwindows -DUNICODE -D_UNICODE -D_WIN32_WINNT=0x0A00 -o "build\team_runner.exe" "src\modules\team_runner.cpp" "build\user.res.o" -lwinhttp -ladvapi32 -lcomctl32 -lwinmm
exit /b %errorlevel%

:build_workflow_msvc
cl /nologo /std:c++17 /MT /O2 /EHsc /W4 /utf-8 /DUNICODE /D_UNICODE /D_WIN32_WINNT=0x0A00 "src\modules\workflow_studio.cpp" /Fo:"build\workflow_studio.obj" /Fe:"build\workflow_studio.exe" /link "build\itvip_icon.res" /SUBSYSTEM:WINDOWS /MANIFEST:EMBED /MANIFESTUAC:NO /MANIFESTINPUT:"build\user.manifest" comctl32.lib winmm.lib
exit /b %errorlevel%
:build_workflow_mingw
"%CXX%" -std=c++17 -O2 -Wall -Wextra -Wpedantic -static -static-libgcc -static-libstdc++ -municode -mwindows -DUNICODE -D_UNICODE -D_WIN32_WINNT=0x0A00 -o "build\workflow_studio.exe" "src\modules\workflow_studio.cpp" "build\user.res.o" -lcomctl32 -lwinmm
exit /b %errorlevel%

:build_workflow_runner_msvc
cl /nologo /std:c++17 /MT /O2 /EHsc /W4 /utf-8 /DUNICODE /D_UNICODE /D_WIN32_WINNT=0x0A00 "src\modules\workflow_runner.cpp" /Fo:"build\workflow_runner.obj" /Fe:"build\workflow_runner.exe" /link "build\itvip_icon.res" /SUBSYSTEM:WINDOWS /MANIFEST:EMBED /MANIFESTUAC:NO /MANIFESTINPUT:"build\user.manifest" winhttp.lib advapi32.lib comctl32.lib winmm.lib
exit /b %errorlevel%
:build_workflow_runner_mingw
"%CXX%" -std=c++17 -O2 -Wall -Wextra -Wpedantic -static -static-libgcc -static-libstdc++ -municode -mwindows -DUNICODE -D_UNICODE -D_WIN32_WINNT=0x0A00 -o "build\workflow_runner.exe" "src\modules\workflow_runner.cpp" "build\user.res.o" -lwinhttp -ladvapi32 -lcomctl32 -lwinmm
exit /b %errorlevel%

:build_history_msvc
cl /nologo /std:c++17 /MT /O2 /EHsc /W4 /utf-8 /DUNICODE /D_UNICODE /D_WIN32_WINNT=0x0A00 "src\modules\run_history.cpp" /Fo:"build\run_history.obj" /Fe:"build\run_history.exe" /link "build\itvip_icon.res" /SUBSYSTEM:WINDOWS /MANIFEST:EMBED /MANIFESTUAC:NO /MANIFESTINPUT:"build\user.manifest" comdlg32.lib comctl32.lib winmm.lib
exit /b %errorlevel%
:build_history_mingw
"%CXX%" -std=c++17 -O2 -Wall -Wextra -Wpedantic -static -static-libgcc -static-libstdc++ -municode -mwindows -DUNICODE -D_UNICODE -D_WIN32_WINNT=0x0A00 -o "build\run_history.exe" "src\modules\run_history.cpp" "build\user.res.o" -lcomdlg32 -lcomctl32 -lwinmm
exit /b %errorlevel%

:build_memory_msvc
cl /nologo /std:c++17 /MT /O2 /EHsc /W4 /utf-8 /DUNICODE /D_UNICODE /D_WIN32_WINNT=0x0A00 "src\modules\memory_center.cpp" /Fo:"build\memory_center.obj" /Fe:"build\memory_center.exe" /link "build\itvip_icon.res" /SUBSYSTEM:WINDOWS /MANIFEST:EMBED /MANIFESTUAC:NO /MANIFESTINPUT:"build\user.manifest" comdlg32.lib comctl32.lib winmm.lib
exit /b %errorlevel%
:build_memory_mingw
"%CXX%" -std=c++17 -O2 -Wall -Wextra -Wpedantic -static -static-libgcc -static-libstdc++ -municode -mwindows -DUNICODE -D_UNICODE -D_WIN32_WINNT=0x0A00 -o "build\memory_center.exe" "src\modules\memory_center.cpp" "build\user.res.o" -lcomdlg32 -lcomctl32 -lwinmm
exit /b %errorlevel%

:build_session_msvc
cl /nologo /std:c++17 /MT /O2 /EHsc /W4 /utf-8 /DUNICODE /D_UNICODE /D_WIN32_WINNT=0x0A00 "src\modules\session_center.cpp" /Fo:"build\session_center.obj" /Fe:"build\session_center.exe" /link "build\itvip_icon.res" /SUBSYSTEM:WINDOWS /MANIFEST:EMBED /MANIFESTUAC:NO /MANIFESTINPUT:"build\user.manifest" comdlg32.lib comctl32.lib winmm.lib
exit /b %errorlevel%
:build_session_mingw
"%CXX%" -std=c++17 -O2 -Wall -Wextra -Wpedantic -static -static-libgcc -static-libstdc++ -municode -mwindows -DUNICODE -D_UNICODE -D_WIN32_WINNT=0x0A00 -o "build\session_center.exe" "src\modules\session_center.cpp" "build\user.res.o" -lcomdlg32 -lcomctl32 -lwinmm
exit /b %errorlevel%
:build_backup_msvc
cl /nologo /std:c++17 /MT /O2 /EHsc /W4 /utf-8 /DUNICODE /D_UNICODE /D_WIN32_WINNT=0x0A00 "src\modules\backup_center.cpp" /Fo:"build\backup_center.obj" /Fe:"build\backup_center.exe" /link "build\itvip_icon.res" /SUBSYSTEM:WINDOWS /MANIFEST:EMBED /MANIFESTUAC:NO /MANIFESTINPUT:"build\user.manifest" bcrypt.lib shell32.lib ole32.lib comctl32.lib winmm.lib
exit /b %errorlevel%
:build_backup_mingw
"%CXX%" -std=c++17 -O2 -Wall -Wextra -Wpedantic -static -static-libgcc -static-libstdc++ -municode -mwindows -DUNICODE -D_UNICODE -D_WIN32_WINNT=0x0A00 -o "build\backup_center.exe" "src\modules\backup_center.cpp" "build\user.res.o" -lbcrypt -lshell32 -lole32 -lcomctl32 -lwinmm
exit /b %errorlevel%


:build_settings_msvc
cl /nologo /std:c++17 /MT /O2 /EHsc /W4 /utf-8 /DUNICODE /D_UNICODE /D_WIN32_WINNT=0x0A00 "src\modules\settings_center.cpp" /Fo:"build\settings_center.obj" /Fe:"build\settings_center.exe" /link "build\itvip_icon.res" /SUBSYSTEM:WINDOWS /MANIFEST:EMBED /MANIFESTUAC:NO /MANIFESTINPUT:"build\user.manifest" shell32.lib comctl32.lib winmm.lib
exit /b %errorlevel%
:build_settings_mingw
"%CXX%" -std=c++17 -O2 -Wall -Wextra -Wpedantic -static -static-libgcc -static-libstdc++ -municode -mwindows -DUNICODE -D_UNICODE -D_WIN32_WINNT=0x0A00 -o "build\settings_center.exe" "src\modules\settings_center.cpp" "build\user.res.o" -lshell32 -lcomctl32 -lwinmm
exit /b %errorlevel%


:build_permissions_msvc
cl /nologo /std:c++17 /MT /O2 /EHsc /W4 /utf-8 /DUNICODE /D_UNICODE /D_WIN32_WINNT=0x0A00 "src\modules\permissions_center.cpp" /Fo:"build\permissions_center.obj" /Fe:"build\permissions_center.exe" /link "build\itvip_icon.res" /SUBSYSTEM:WINDOWS /MANIFEST:EMBED /MANIFESTUAC:NO /MANIFESTINPUT:"build\user.manifest" comctl32.lib shell32.lib ole32.lib comdlg32.lib winmm.lib
exit /b %errorlevel%
:build_permissions_mingw
"%CXX%" -std=c++17 -O2 -Wall -Wextra -Wpedantic -static -static-libgcc -static-libstdc++ -municode -mwindows -DUNICODE -D_UNICODE -D_WIN32_WINNT=0x0A00 -o "build\permissions_center.exe" "src\modules\permissions_center.cpp" "build\user.res.o" -lcomctl32 -lshell32 -lole32 -lcomdlg32 -lwinmm
exit /b %errorlevel%

:: Native CNG verifier validates RSA signatures and the signed SHA-256 inventory before PowerShell policy checks.
:build_native_verifier_msvc
cl /nologo /std:c++17 /MT /O2 /EHsc /W4 /utf-8 /DUNICODE /D_UNICODE /D_WIN32_WINNT=0x0A00 "src\app\license_native_verifier.cpp" /Fo:"build\license_native_verifier.obj" /Fe:"build\ITVIPNativeVerify.exe" /link "build\itvip_icon.res" /SUBSYSTEM:CONSOLE bcrypt.lib crypt32.lib advapi32.lib comctl32.lib winmm.lib
exit /b %errorlevel%
:build_native_verifier_mingw
"%CXX%" -std=c++17 -O2 -Wall -Wextra -Wpedantic -pthread -static -static-libgcc -static-libstdc++ -municode -DUNICODE -D_UNICODE -D_WIN32_WINNT=0x0A00 -o "build\ITVIPNativeVerify.exe" "src\app\license_native_verifier.cpp" -lbcrypt -lcrypt32 -ladvapi32 -Wl,--subsystem,console -lwinmm
exit /b %errorlevel%

:: Native launcher orchestrates the signed PowerShell verifier and starts the dashboard only on exit code 0.
:build_bootstrapper_msvc
cl /nologo /std:c++17 /MT /O2 /EHsc /W4 /utf-8 /DUNICODE /D_UNICODE /D_WIN32_WINNT=0x0A00 "src\app\license_bootstrapper.cpp" /Fo:"build\license_bootstrapper.obj" /Fe:"build\ITVIPBootstrap.exe" /link "build\itvip_icon.res" /SUBSYSTEM:WINDOWS /MANIFEST:EMBED /MANIFESTUAC:NO /MANIFESTINPUT:"build\user.manifest" shell32.lib comctl32.lib winmm.lib
exit /b %errorlevel%
:build_bootstrapper_mingw
"%CXX%" -std=c++17 -O2 -Wall -Wextra -Wpedantic -static -static-libgcc -static-libstdc++ -municode -mwindows -DUNICODE -D_UNICODE -D_WIN32_WINNT=0x0A00 -o "build\ITVIPBootstrap.exe" "src\app\license_bootstrapper.cpp" "build\user.res.o" -lshell32 -lcomctl32 -lwinmm
exit /b %errorlevel%

:build_gui_msvc
cl /nologo /std:c++17 /MT /O2 /EHsc /W4 /utf-8 /DUNICODE /D_UNICODE /D_WIN32_WINNT=0x0A00 "src\app\main.cpp" /Fo:"build\main.obj" /Fe:"build\ITVIP.exe" /link "build\itvip_icon.res" /SUBSYSTEM:WINDOWS /MANIFEST:EMBED /MANIFESTUAC:NO /MANIFESTINPUT:"build\user.manifest" comctl32.lib shell32.lib comdlg32.lib gdiplus.lib winmm.lib
exit /b %errorlevel%
:build_gui_mingw
"%CXX%" -std=c++17 -O2 -Wall -Wextra -Wpedantic -static -static-libgcc -static-libstdc++ -municode -mwindows -DUNICODE -D_UNICODE -D_WIN32_WINNT=0x0A00 -o "build\ITVIP.exe" "src\app\main.cpp" "build\user.res.o" -lcomctl32 -lshell32 -lcomdlg32 -lgdiplus -lwinmm
exit /b %errorlevel%

:build_system_monitor_msvc
cl /nologo /std:c++17 /MT /O2 /EHsc /W4 /utf-8 /DUNICODE /D_UNICODE /D_WIN32_WINNT=0x0A00 "src\modules\system_monitor_gui.cpp" /Fo:"build\system_monitor_gui.obj" /Fe:"build\system_monitor_gui.exe" /link "build\itvip_icon.res" /SUBSYSTEM:WINDOWS /MANIFEST:EMBED /MANIFESTUAC:NO /MANIFESTINPUT:"build\user.manifest" comctl32.lib iphlpapi.lib winmm.lib
exit /b %errorlevel%
:build_system_monitor_mingw
"%CXX%" -std=c++17 -O2 -Wall -Wextra -Wpedantic -static -static-libgcc -static-libstdc++ -municode -mwindows -DUNICODE -D_UNICODE -D_WIN32_WINNT=0x0A00 -o "build\system_monitor_gui.exe" "src\modules\system_monitor_gui.cpp" "build\user.res.o" -lcomctl32 -liphlpapi -lwinmm
exit /b %errorlevel%

:build_tool_gui_msvc
set "KIND=1"
if /i "%~1"=="usb_guard_gui" set "KIND=2"
if /i "%~1"=="tempclean_gui" set "KIND=3"
if /i "%~1"=="activator_gui" set "KIND=4"
if /i "%~1"=="pwrecover_gui" set "KIND=5"
if /i "%~1"=="security_center_gui" set "KIND=6"
cl /nologo /std:c++17 /MT /O2 /EHsc /W4 /utf-8 /DUNICODE /D_UNICODE /D_WIN32_WINNT=0x0A00 /DITVIP_TOOL_KIND=%KIND% "src\app\branded_tool_gui.cpp" /Fo:"build\%~1.obj" /Fe:"build\%~1.exe" /link "build\itvip_icon.res" /SUBSYSTEM:WINDOWS /MANIFEST:EMBED /MANIFESTUAC:NO /MANIFESTINPUT:"build\user.manifest" comctl32.lib shell32.lib ole32.lib winmm.lib
exit /b %errorlevel%
:build_tool_gui_mingw
set "KIND=1"
if /i "%~1"=="usb_guard_gui" set "KIND=2"
if /i "%~1"=="tempclean_gui" set "KIND=3"
if /i "%~1"=="activator_gui" set "KIND=4"
if /i "%~1"=="pwrecover_gui" set "KIND=5"
if /i "%~1"=="security_center_gui" set "KIND=6"
"%CXX%" -std=c++17 -O2 -Wall -Wextra -Wpedantic -pthread -static -static-libgcc -static-libstdc++ -municode -mwindows -DUNICODE -D_UNICODE -D_WIN32_WINNT=0x0A00 -DITVIP_TOOL_KIND=%KIND% -o "build\%~1.exe" "src\app\branded_tool_gui.cpp" "build\user.res.o" -lcomctl32 -lshell32 -lole32 -lwinmm
exit /b %errorlevel%

:build_msvc
set "MANIFEST=admin"
if /i "%~1"=="scanner" set "MANIFEST=user"
if /i "%~1"=="portable_manager" set "MANIFEST=user"
if /i "%~1"=="copy_manager" set "MANIFEST=user"
set "SUBSYSTEM=CONSOLE"
if /i "%~1"=="portable_manager" set "SUBSYSTEM=WINDOWS"
if /i "%~1"=="copy_manager" set "SUBSYSTEM=WINDOWS"
cl /nologo /std:c++17 /MT /O2 /EHsc /W4 /utf-8 /DUNICODE /D_UNICODE /D_WIN32_WINNT=0x0A00 "src\modules\%~1.cpp" /Fo:"build\%~1.obj" /Fe:"build\%~1.exe" /link "build\itvip_icon.res" /SUBSYSTEM:%SUBSYSTEM% /MANIFEST:EMBED /MANIFESTUAC:NO /MANIFESTINPUT:"build\%MANIFEST%.manifest" bcrypt.lib netapi32.lib shell32.lib advapi32.lib ole32.lib uuid.lib comctl32.lib winmm.lib
exit /b %errorlevel%
:build_mingw
set "MANIFEST=admin"
if /i "%~1"=="scanner" set "MANIFEST=user"
if /i "%~1"=="portable_manager" set "MANIFEST=user"
if /i "%~1"=="copy_manager" set "MANIFEST=user"
set "MINGW_SUBSYSTEM=console"
if /i "%~1"=="portable_manager" set "MINGW_SUBSYSTEM=windows"
if /i "%~1"=="copy_manager" set "MINGW_SUBSYSTEM=windows"
"%CXX%" -std=c++17 -O2 -Wall -Wextra -Wpedantic -pthread -static -static-libgcc -static-libstdc++ -municode -DUNICODE -D_UNICODE -D_WIN32_WINNT=0x0A00 -o "build\%~1.exe" "src\modules\%~1.cpp" "build\%MANIFEST%.res.o" -lbcrypt -lnetapi32 -lshell32 -ladvapi32 -lole32 -luuid -lcomctl32 -Wl,--subsystem,%MINGW_SUBSYSTEM% -lwinmm
exit /b %errorlevel%
:manifest
>(echo ^<?xml version="1.0" encoding="UTF-8"?^> & echo ^<assembly xmlns="urn:schemas-microsoft-com:asm.v1" manifestVersion="1.0"^> & echo ^<assemblyIdentity version="1.0.0.0" processorArchitecture="*" name="ITVIP" type="win32" /^> & echo ^<trustInfo xmlns="urn:schemas-microsoft-com:asm.v3"^>^<security^>^<requestedPrivileges^>^<requestedExecutionLevel level="%~2" uiAccess="false" /^>^</requestedPrivileges^>^</security^>^</trustInfo^> & echo ^<compatibility xmlns="urn:schemas-microsoft-com:compatibility.v1"^>^<application^>^<supportedOS Id="{8e0f7a12-bfb3-4fe8-b9a5-48fd50a15a9a}" /^>^</application^>^</compatibility^> & echo ^</assembly^>) > "build\%~1.manifest"
if errorlevel 1 exit /b 1
>"build\%~1.rc" echo 1 24 "%~1.manifest"
>>"build\%~1.rc" echo 2 ICON "assets\itvip.ico"
exit /b %errorlevel%
:success
echo IT VIP GUI, Owner Permissions Console, AI Assistant, GitHub Hub, Universal API Manager, Agent Studio, Team Studio, Team Runner, Workflow Studio, Workflow Runner, Run History, Memory Center, Session Center, Backup Center, Settings Center, Provider Hub, Provider Runtime, and native modules compiled. See build folder.
echo Independent Boot Manager remains planned. Portable Apps Manager source is included.
popd
exit /b 0
:failed
echo Build failed. Check the compiler diagnostics above.
popd
exit /b 1
