[Version]
Class=IEXPRESS
SEDVersion=3

[Options]
PackagePurpose=InstallApp
ShowInstallProgramWindow=0
HideExtractAnimation=1
UseLongFileName=1
InsideCompressed=1
CAB_FixedSize=0
CAB_ResvCodeSigning=0
RebootMode=N
InstallPrompt=
DisplayLicense=
FinishMessage=Bank Alone Guides install complete.
TargetName=__TARGET_NAME__
FriendlyName=Bank Alone Guides Installer
AppLaunched=cmd /c powershell -ExecutionPolicy Bypass -File Install-BankAloneGuides.ps1
PostInstallCmd=<None>
AdminQuietInstCmd=
UserQuietInstCmd=
SourceFiles=SourceFiles0

[SourceFiles]
SourceFiles0=__SOURCE_PATH__

[SourceFiles0]
FILE0=Install-BankAloneGuides.ps1
