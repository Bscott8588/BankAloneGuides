@echo off
setlocal

set "ROOT=%~dp0"
set "SED_TEMPLATE=%ROOT%BankAloneGuides-Installer.sed"
set "SED_OUT=%TEMP%\BankAloneGuides-Installer.gen.sed"
set "TARGET=%ROOT%BankAloneGuides-Setup.exe"

if not exist "%SED_TEMPLATE%" (
  echo [BAG] Missing SED template: %SED_TEMPLATE%
  pause
  exit /b 1
)

if not exist "%ROOT%Install-BankAloneGuides.ps1" (
  echo [BAG] Missing Install-BankAloneGuides.ps1 in %ROOT%
  pause
  exit /b 1
)

powershell -NoProfile -ExecutionPolicy Bypass -Command ^
  "$root = '%ROOT%';" ^
  "$target = '%TARGET%';" ^
  "$sed = Get-Content -Raw '%SED_TEMPLATE%';" ^
  "$sed = $sed.Replace('__SOURCE_PATH__', $root).Replace('__TARGET_NAME__', $target);" ^
  "[System.IO.File]::WriteAllText('%SED_OUT%', $sed, [System.Text.Encoding]::ASCII);"

if not exist "%SED_OUT%" (
  echo [BAG] Failed to generate SED file.
  pause
  exit /b 1
)

echo [BAG] Building EXE with IExpress...
iexpress /N /Q "%SED_OUT%"

if exist "%SED_OUT%" del "%SED_OUT%"

if exist "%TARGET%" (
  echo [BAG] Build complete: %TARGET%
) else (
  echo [BAG] Build failed. Check IExpress output.
)

pause
