@echo off
setlocal
set N8N_PORT=5678
set N8N_HOST=0.0.0.0
set N8N_USER_FOLDER=%APPDATA%\n8n
if not exist "%N8N_USER_FOLDER%" mkdir "%N8N_USER_FOLDER%"

echo Starting n8n (full frontend + backend) on http://localhost:%N8N_PORT% ...
echo Data folder: %N8N_USER_FOLDER%
start "" /min cmd /c "timeout /t 8 /nobreak >nul & start http://localhost:%N8N_PORT%"

"%~dp0\node\node.exe" "%~dp0\app\node_modules\n8n\bin\n8n" start
pause
