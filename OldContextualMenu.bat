@echo off
:menu
cls
echo --------- MENU ---------
echo Select the preferred type of context menu.
echo 1. Old contextual menu (Windows 10)
echo 2. New contextual menu (Windows 11)
echo 3. Salir
echo -------------------------
set /p option=Select an option: 

if "%option%"=="1" (
  reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve
  taskkill -IM explorer.exe -f
  explorer.exe
  echo "The old context menu (Windows 10) has been applied."
  pause
  goto menu
) else if "%option%"=="2" (
  reg delete "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve
  taskkill -IM explorer.exe -f
  explorer.exe
  echo "The new context menu (Windows 11) has been applied."
  pause
  goto menu 
) else if "%option%"=="3" (
  echo Exit...
  exit
) else (
  echo Opción no válida. Por favor, selecciona una opción válida.
  pause
  goto menu
)



