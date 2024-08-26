@echo off

REM Remove installed WebExperience package for all users
PowerShell -Command "Get-AppxPackage -AllUsers | Where-Object {$_.Name -like '*WebExperience*'} | Remove-AppxPackage -AllUsers -ErrorAction SilentlyContinue"

REM Define registry settings

REM Set registry keys to disable News and Interests
reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\NewsAndInterests" /v AllowNewsAndInterests /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Dsh" /v AllowNewsAndInterests /t REG_DWORD /d 0 /f

taskkill /f /im explorer.exe
start explorer.exe

exit