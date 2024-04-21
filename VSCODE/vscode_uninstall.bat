@echo off

echo ==========================================
echo ========== Uninstall for VSCode ==========
echo ==========================================

REM Checking for the Code.exe process
tasklist /fi "imagename eq Code.exe" | find ":" > nul

REM Verifying if Code.exe is running
if %errorlevel% neq 0 (
    echo The Code.exe process is not running.
    REM Forcefully terminating the Code.exe process
    taskkill /im Code.exe /f >nul
    timeout /t 1 /nobreak >nul
    echo Code.exe terminated... 
) else (
    echo The Code.exe process has been terminated.
    timeout /t 1 /nobreak >nul
)
REM AppData\Roaming\Code ??��
echo delete - %USERPROFILE%\AppData\Roaming\Code
rd /s /q "%USERPROFILE%\AppData\Roaming\Code"

REM \.vscode ??��
echo delete... %USERPROFILE%\.vscode
rd /s /q "%USERPROFILE%\.vscode"


timeout /t 1 /nobreak >nul
"%USERPROFILE%\AppData\Local\Programs\Microsoft VS Code\unins000.exe"
echo VSCODE deleted...
timeout /t 1 /nobreak >nul

rd /s /q "%USERPROFILE%\AppData\Local\Programs\Microsoft VS Code"
echo "%USERPROFILE%\AppData\Local\Programs\Microsoft VS Code" deleted...

REM ?��? ?�간 5�??�정
set "wait_time=5"

REM ?��? ?�간 
echo TIME: %wait_time% s

REM 5초간 1초마???��? ?�간 출력
for /l %%i in (%wait_time%,-1,1) do (
    echo Remaining time: %%i seconds
    timeout /t 1 >nul
)
exit
