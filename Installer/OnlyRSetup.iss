; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define Dependency_NoExampleSetup
#include "CodeDependencies.iss"

#define MyAppName "OnlyR"
#define MyAppPublisher "Antony Corbett"
#define MyAppURL "https://soundboxsoftware.com"
#define MyAppExeName "OnlyR.exe"

#define MyAppVersion GetFileVersion('..\OnlyR\bin\Release\net5.0-windows\publish\OnlyR.exe');

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{880BFB38-BF5D-4B07-8DA9-5951437B16FA}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={commonpf}\OnlyR
DefaultGroupName={#MyAppName}
OutputDir="Output"
OutputBaseFilename=OnlyRSetup
SetupIconFile=..\OnlyR\iconmic.ico
Compression=lzma
SolidCompression=yes
AppContact=antony@corbetts.org.uk
DisableWelcomePage=false
SetupLogging=True
RestartApplications=False
CloseApplications=False
AppMutex=OnlyRAudioRecording

PrivilegesRequired=admin

[InstallDelete]
; files from pre-net-5 edition
Type: files; Name: "{app}\CommonServiceLocator.dll"
Type: files; Name: "{app}\GalaSoft.MvvmLight.dll"
Type: files; Name: "{app}\GalaSoft.MvvmLight.Extras.dll"
Type: files; Name: "{app}\GalaSoft.MvvmLight.Platform.dll"
Type: files; Name: "{app}\Microsoft.Win32.Primitives.dll"
Type: files; Name: "{app}\Microsoft.WindowsAPICodePack.dll"
Type: files; Name: "{app}\Microsoft.WindowsAPICodePack.Shell.dll"
Type: files; Name: "{app}\Microsoft.WindowsAPICodePack.ShellExtensions.dll"
Type: files; Name: "{app}\netstandard.dll"
Type: files; Name: "{app}\OnlyR.exe.config"
Type: files; Name: "{app}\Serilog.Sinks.RollingFile.dll"
Type: files; Name: "{app}\System*.dll"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"

[Files]
Source: "..\OnlyR\bin\Release\net5.0-windows\publish\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Excludes: "*.pdb"

// https://go.microsoft.com/fwlink/?linkid=2135256
Source: "netcorecheck.exe"; Flags: dontcopy noencryption

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[ThirdParty]
UseRelativePaths=True

[Code]
procedure InitializeWizard;
begin
  Dependency_InitializeWizard;
end;

function PrepareToInstall(var NeedsRestart: Boolean): String;
begin
  Result := Dependency_PrepareToInstall(NeedsRestart);
end;

function NeedRestart: Boolean;
begin
  Result := Dependency_NeedRestart;
end;

function UpdateReadyMemo(const Space, NewLine, MemoUserInfoInfo, MemoDirInfo, MemoTypeInfo, MemoComponentsInfo, MemoGroupInfo, MemoTasksInfo: String): String;
begin
  Result := Dependency_UpdateReadyMemo(Space, NewLine, MemoUserInfoInfo, MemoDirInfo, MemoTypeInfo, MemoComponentsInfo, MemoGroupInfo, MemoTasksInfo);
end;

function InitializeSetup: Boolean;
begin
  // add dependencies (.NET 5 x86 desktop runtime)  
  Dependency_ForceX86 := true;  
  Dependency_AddDotNet50Desktop;    
  
  Result := True;  
end;


