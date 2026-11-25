@echo off
setlocal

set "TARGET=%~1"
if "%TARGET%"=="" set "TARGET=%~dp0Go-Source.code-workspace"

where code >nul 2>&1
if errorlevel 1 (
    if exist "%LOCALAPPDATA%\Programs\Microsoft VS Code\Code.exe" (
        start "" "%LOCALAPPDATA%\Programs\Microsoft VS Code\Code.exe" "%TARGET%"
        exit /b 0
    )

    echo VS Code was not found on PATH or in the standard user installation folder.
    exit /b 1
)

start "" code "%TARGET%"
exit /b 0
