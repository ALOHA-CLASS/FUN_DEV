@ECHO OFF
echo exit 8080 port...
echo alohaclass.kr
SET killport=8080
for /f "tokens=5" %%p in ('netstat -aon ^| find /i "listening" ^| find "%killport%"') do taskkill /F /PID %%p


timeout /t 5 /nobreak >nul



