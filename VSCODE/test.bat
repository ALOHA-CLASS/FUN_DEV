@echo off

REM ?��? ?�간
set "wait_time=5"

REM ?��??�간 5�?
echo TIME: %wait_time% s

REM 5초간 1초씩 반복 출력
for /l %%i in (%wait_time%,-1,1) do (
    echo Remaining time: %%i seconds
    timeout /t 1 >nul
)
exit
