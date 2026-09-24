; Original n8n Windows installer - FULL frontend + backend
; Built on GitHub Actions (windows-2022) with Inno Setup 6

#define MyAppName "n8n"
#define MyAppVersion "1.0.0"
#define MyPublisher "n8n-io"
#define MyURL "https://n8n.io"

[Setup]
AppId={{3A1F2B1C-4D5E-4F6A-8B7C-9D0E1F2A3B4C}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyPublisher}
AppPublisherURL={#MyURL}
AppSupportURL={#MyURL}
DefaultDirName={autopf}\n8n
DefaultGroupName=n8n
OutputDir=Output
OutputBaseFilename=n8n-Setup-{#MyAppVersion}
Compression=lzma2/fast
SolidCompression=no
LZMAUseSeparateProcess=yes
WizardStyle=modern
PrivilegesRequired=lowest
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible
UninstallDisplaySize=2500000

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
; Node.js portable runtime (pruned to node.exe + DLLs, no npm)
Source: "..\bundle\node\*"; DestDir: "{app}\node"; Flags: ignoreversion recursesubdirs createallsubdirs
; Original n8n app - FULL backend + frontend (npm install output, includes n8n-editor-ui dist)
Source: "..\bundle\app\*"; DestDir: "{app}\app"; Flags: ignoreversion recursesubdirs createallsubdirs
; Launcher
Source: "..\scripts\start-n8n.bat"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{group}\n8n (Start Server)"; Filename: "{app}\start-n8n.bat"
Name: "{group}\n8n Data Folder"; Filename: "{userappdata}\n8n"
Name: "{commondesktop}\n8n"; Filename: "{app}\start-n8n.bat"; Tasks: desktopicon

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Run]
Filename: "{app}\start-n8n.bat"; Description: "Launch n8n now"; Flags: postinstall nowait skipifsilent shellexec
