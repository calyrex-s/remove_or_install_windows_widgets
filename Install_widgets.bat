@echo off

REM Install the application using winget with acceptance of license agreements
PowerShell -Command "winget install --id 9MSSGKG348SP --accept-package-agreements --accept-source-agreements"

REM Create the registry settings file dynamically
echo Windows Registry Editor Version 5.00 > settings.reg
echo. >> settings.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\default\NewsAndInterests\AllowNewsAndInterests] >> settings.reg
echo "value"=dword:00000001 >> settings.reg
echo. >> settings.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Dsh] >> settings.reg
echo "AllowNewsAndInterests"=- >> settings.reg

REM Apply the registry settings
regedit /s settings.reg

REM Clean up
del settings.reg

echo Script execution complete.

taskkill /f /im explorer.exe
start explorer.exe

exit