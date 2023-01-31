@echo off
:: Essa parte descobre onde est� a �rea de trabalho:
for /f "delims=" %%a in ('powershell -command "[Environment]::GetFolderPath('Desktop')"') do set "Desktop=%%a"

:: Se n�o existir area de trabalho encerrar o bat
if not exist "%Desktop%" exit

:: muda para pasta "�rea de trabalho" (desktop) 
pushd "%Desktop%"

:: usa o comando rd em todas as pastas e comando del em todos os arquivos menos .lnk...
for /f "delims=" %%a in ('dir /b ^|find /v /i ".lnk"') do if exist "%%a\" (rd /q /s "%%a") else (del /q "%%a")
popd
exit