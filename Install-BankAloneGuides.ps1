param(
  [string]$AddonPath = "C:\Program Files (x86)\World of Warcraft\_anniversary_\Interface\AddOns",
  [string]$ZipUrl = "https://github.com/Bscott8588/BankAloneGuides/raw/cursor/bank-alone-guides-addon-0ab8/BankAloneGuides.zip",
  [switch]$Force
)

$ErrorActionPreference = "Stop"

function Write-Status {
  param([string]$Message)
  Write-Host "[BAG] $Message"
}

Write-Status "Target AddOns path: $AddonPath"

if (-not (Test-Path $AddonPath)) {
  Write-Status "Creating AddOns path..."
  New-Item -ItemType Directory -Force -Path $AddonPath | Out-Null
}

$tempZip = Join-Path $env:TEMP "BankAloneGuides.zip"
Write-Status "Downloading latest package..."
Invoke-WebRequest -Uri $ZipUrl -OutFile $tempZip -UseBasicParsing

$dest = Join-Path $AddonPath "BankAloneGuides"
if (Test-Path $dest) {
  if ($Force) {
    Write-Status "Removing existing addon folder..."
    Remove-Item -Recurse -Force $dest
  } else {
    $backup = Join-Path $AddonPath ("BankAloneGuides_backup_" + (Get-Date -Format "yyyyMMdd_HHmmss"))
    Write-Status "Existing addon found. Backing up to: $backup"
    Move-Item -Path $dest -Destination $backup
  }
}

Write-Status "Extracting..."
Expand-Archive -Path $tempZip -DestinationPath $AddonPath -Force

if (Test-Path $tempZip) {
  Remove-Item -Force $tempZip
}

Write-Status "Install complete."
Write-Status "Folder: $dest"
Write-Status "Restart WoW if it is running."
