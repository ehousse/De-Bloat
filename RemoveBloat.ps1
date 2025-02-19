<#
.SYNOPSIS
.Removes bloat from a fresh Windows build
.DESCRIPTION
.Removes AppX Packages
.Disables Cortana
.Removes McAfee
.Removes HP Bloat
.Removes Dell Bloat
.Removes Lenovo Bloat
.Windows 10 and Windows 11 Compatible
.Removes any unwanted installed applications
.Removes unwanted services and tasks
.Removes Edge Surf Game

.INPUTS
.OUTPUTS
C:\ProgramData\Debloat\Debloat.log
.NOTES
  Version:        5.1.3
  Author:         Andrew Taylor
  Twitter:        @AndrewTaylor_2
  WWW:            andrewstaylor.com
  Creation Date:  08/03/2022
  Purpose/Change: Initial script development
  Change: 12/08/2022 - Added additional HP applications
  Change 23/09/2022 - Added Clipchamp (new in W11 22H2)
  Change 28/10/2022 - Fixed issue with Dell apps
  Change 23/11/2022 - Added Teams Machine wide to exceptions
  Change 27/11/2022 - Added Dell apps
  Change 07/12/2022 - Whitelisted Dell Audio and Firmware
  Change 19/12/2022 - Added Windows 11 start menu support
  Change 20/12/2022 - Removed Gaming Menu from Settings
  Change 18/01/2023 - Fixed Scheduled task error and cleared up $null posistioning
  Change 22/01/2023 - Re-enabled Telemetry for Endpoint Analytics
  Change 30/01/2023 - Added Microsoft Family to removal list
  Change 31/01/2023 - Fixed Dell loop
  Change 08/02/2023 - Fixed HP apps (thanks to http://gerryhampsoncm.blogspot.com/2023/02/remove-pre-installed-hp-software-during.html?m=1)
  Change 08/02/2023 - Removed reg keys for Teams Chat
  Change 14/02/2023 - Added HP Sure Apps
  Change 07/03/2023 - Enabled Location tracking (with commenting to disable)
  Change 08/03/2023 - Teams chat fix
  Change 10/03/2023 - Dell array fix
  Change 19/04/2023 - Added loop through all users for HKCU keys for post-OOBE deployments
  Change 29/04/2023 - Removes News Feed
  Change 26/05/2023 - Added Set-ACL
  Change 26/05/2023 - Added multi-language support for Set-ACL commands
  Change 30/05/2023 - Logic to check if gamepresencewriter exists before running Set-ACL to stop errors on re-run
  Change 25/07/2023 - Added Lenovo apps (Thanks to Simon Lilly and Philip Jorgensen)
  Change 31/07/2023 - Added LenovoAssist
  Change 21/09/2023 - Remove Windows backup for Win10
  Change 28/09/2023 - Enabled Diagnostic Tracking for Endpoint Analytics
  Change 02/10/2023 - Lenovo Fix
  Change 06/10/2023 - Teams chat fix
  Change 09/10/2023 - Dell Command Update change
  Change 11/10/2023 - Grab all uninstall strings and use native uninstaller instead of uninstall-package
  Change 14/10/2023 - Updated HP Audio package name
  Change 31/10/2023 - Added PowerAutomateDesktop and update Microsoft.Todos
  Change 01/11/2023 - Added fix for Windows backup removing Shell Components
  Change 06/11/2023 - Removes Windows CoPilot
  Change 07/11/2023 - HKU fix
  Change 13/11/2023 - Added CoPilot removal to .Default Users
  Change 14/11/2023 - Added logic to stop errors on HP machines without HP docs installed
  Change 14/11/2023 - Added logic to stop errors on Lenovo machines without some installers
  Change 15/11/2023 - Code Signed for additional security
  Change 02/12/2023 - Added extra logic before app uninstall to check if a user has logged in
  Change 04/01/2024 - Added Dropbox and DevHome to AppX removal
  Change 05/01/2024 - Added MSTSC to whitelist
  Change 25/01/2024 - Added logic for LenovoNow/LenovoWelcome
  Change 25/01/2024 - Updated Dell app list (thanks Hrvoje in comments)
  Change 29/01/2024 - Changed /I to /X in Dell command
  Change 30/01/2024 - Fix Lenovo Vantage version
  Change 31/01/2024 - McAfee fix and Dell changes
  Change 01/02/2024 - Dell fix
  Change 01/02/2024 - Added logic around appxremoval to stop failures in logging
  Change 05/02/2024 - Added whitelist parameters
  Change 16/02/2024 - Added wildcard to dropbox
  Change 23/02/2024 - Added Lenovo SmartMeetings
  Change 06/03/2024 - Added Lenovo View and Vantage
  Change 08/03/2024 - Added Lenovo Smart Noise Cancellation
  Change 13/03/2024 - Added updated McAfee
  Change 20/03/2024 - Dell app fixes
  Change 02/04/2024 - Stopped it removing Intune Management Extension!
  Change 03/04/2024 - Switched Win32 removal from whitelist to blacklist
  Change 10/04/2024 - Office uninstall string fix
  Change 11/04/2024 - Added Office support for multi-language
  Change 17/04/2024 - HP Apps update
  Change 19/04/2024 - HP Fix
  Change 24/04/2024 - Switched provisionedpackage and appxpackage arround
  Change 02/05/2024 - Fixed notlike to notin
  Change 03/05/2024 - Change $uninstallprograms
  Change 19/05/2024 - Disabled feeds on Win11
  Change 21/05/2024 - Added QuickAssist to removal after security issues
  Change 25/05/2024 - Whitelist array fix
  Change 29/05/2025 - Uninstall fix
  Change 31/05/2024 - Re-write for manufacturer bloat
  Change 03/06/2024 - Added function for removing Win32 apps
  Change 03/06/2024 - Added registry key to block "Tell me about this picture" icon
  Change 06/06/2024 - Added keys to block Windows Recall
  Change 07/06/2024 - New fixes for HP and McAfee (thanks to Keith Hay)
  Change 24/06/2024 - Added Microsoft.SecHealthUI to whitelist
  Change 26/06/2024 - Fix when run outside of ESP
  Change 04/07/2024 - Dell fix for "|"
  Change 08/07/2024 - Made whitelist more standard across platforms and removed bloat list to use only whitelisting
  Change 08/07/2024 - Added start.bin
  Change 12/07/2024 - Added logic around start.bin
  Change 15/07/2024 - Removed Lenovo bookmarks
  Change 18/07/2024 - Updated detection for removing Office Home
  Change 23/07/2024 - Lenovo camera fix for E14
  Change 25/07/2024 - Added MS Teams to whitelist
  Change 07/08/2024 - Lenovo fix
  Change 14/08/2024 - Whitelisted any language packs
  Change 19/08/2024 - Added version to log for troubleshooting
  Change 19/08/2024 - Added blacklist and whitelist for further protection
  Change 22/08/2024 - Added Poly Lens for HP
  Change 02/09/2024 - Added all possible languages to Office Home removal
  Change 03/09/2024 - OOBE Logic update for Win32 app removal
  Change 04/09/2024 - Lenovo updates
  Change 17/09/2024 - Added HP Wolf Security
  Change 18/09/2024 - Removed ODT for office removal to speed up script
  Change 24/09/2024 - Fixed uninstall for HP Wolf Security
  Change 25/09/2024 - Removed locales as Teams is now combined
  Change 08/10/2024 - ODT Fix
  Change 04/11/2024 - Block games in search bar
  Change 03/12/2024 - Fix for HP AppxPackage Removal
  Change 10/12/2024 - Added registry keys to not display screens during OOBE when using Device prep (thanks Rudy)
  Change 07/01/2025 - Added spotlight removal keys
  Change 10/01/2025 - Added Lenovo Now
  Change 21/01/2025 - Edge Surf game fix
N/A
#>

############################################################################################################
#                                         Initial Setup                                                    #
#                                                                                                          #
############################################################################################################
param (
    [string[]]$customwhitelist
)

##Elevate if needed

If (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]'Administrator')) {
    write-output "You didn't run this script as an Administrator. This script will self elevate to run as an Administrator and continue."
    Start-Sleep 1
    write-output "                                               3"
    Start-Sleep 1
    write-output "                                               2"
    Start-Sleep 1
    write-output "                                               1"
    Start-Sleep 1
    Start-Process powershell.exe -ArgumentList ("-NoProfile -ExecutionPolicy RemoteSigned -File `"{0}`" -WhitelistApps {1}" -f $PSCommandPath, ($WhitelistApps -join ',')) -Verb RunAs
    Exit
}

#no errors throughout
$ErrorActionPreference = 'silentlycontinue'


#Create Folder
$DebloatFolder = "C:\ProgramData\Debloat"
If (Test-Path $DebloatFolder) {
    Write-Output "$DebloatFolder exists. Skipping."
}
Else {
    Write-Output "The folder '$DebloatFolder' doesn't exist. This folder will be used for storing logs created after the script runs. Creating now."
    Start-Sleep 1
    New-Item -Path "$DebloatFolder" -ItemType Directory
    Write-Output "The folder $DebloatFolder was successfully created."
}

Start-Transcript -Path "C:\ProgramData\Debloat\Debloat.log"

############################################################################################################
#                                        Remove AppX Packages                                              #
#                                                                                                          #
############################################################################################################

#Removes AppxPackages
$WhitelistedApps = @(
    'Microsoft.WindowsNotepad',
    'Microsoft.CompanyPortal',
    'Microsoft.ScreenSketch',
    'Microsoft.Paint3D',
    'Microsoft.WindowsCalculator',
    'Microsoft.WindowsStore',
    'Microsoft.Windows.Photos',
    'Microsoft.MicrosoftStickyNotes',
    'Microsoft.MSPaint',
    'Microsoft.WindowsCamera',
    '.NET Framework',
    'Microsoft.HEIFImageExtension',
    'Microsoft.StorePurchaseApp',
    'Microsoft.VP9VideoExtensions',
    'Microsoft.WebMediaExtensions',
    'Microsoft.WebpImageExtension',
    'Microsoft.DesktopAppInstaller',
    'WindSynthBerry',
    'MIDIBerry',
    'Microsoft.RemoteDesktop',
    'Microsoft.SecHealthUI',
    'WavesAudio.MaxxAudioProforDell2019',
    'Dell Optimizer Core',
    'Dell SupportAssist Remediation',
    'Dell SupportAssist OS Recovery Plugin for Dell Update',
    'Dell Pair',
    'Dell Display Manager 2.0',
    'Dell Display Manager 2.1',
    'Dell Display Manager 2.2',
    'Dell Peripheral Manager',
    'MSTeams',
    'Microsoft.Paint',
    'Microsoft.OutlookForWindows',
    'Microsoft.WindowsTerminal',
    'Microsoft.MicrosoftEdge.Stable'
)
##If $customwhitelist is set, split on the comma and add to whitelist
if ($customwhitelist) {
    $customWhitelistApps = $customwhitelist -split ","
    foreach ($whitelistapp in $customwhitelistapps) {
        ##Add to the array
        $WhitelistedApps += $whitelistapp
    }
}

#NonRemovable Apps that where getting attempted and the system would reject the uninstall, speeds up debloat and prevents 'initalizing' overlay when removing apps
$NonRemovable = @(
    '1527c705-839a-4832-9118-54d4Bd6a0c89',
    'c5e2524a-ea46-4f67-841f-6a9465d9d515',
    'E2A4F912-2574-4A75-9BB0-0D023378592B',
    'F46D4000-FD22-4DB4-AC8E-4E1DDDE828FE',
    'InputApp',
    'Microsoft.AAD.BrokerPlugin',
    'Microsoft.AccountsControl',
    'Microsoft.BioEnrollment',
    'Microsoft.CredDialogHost',
    'Microsoft.ECApp',
    'Microsoft.LockApp',
    'Microsoft.MicrosoftEdgeDevToolsClient',
    'Microsoft.MicrosoftEdge',
    'Microsoft.PPIProjection',
    'Microsoft.Win32WebViewHost',
    'Microsoft.Windows.Apprep.ChxApp',
    'Microsoft.Windows.AssignedAccessLockApp',
    'Microsoft.Windows.CapturePicker',
    'Microsoft.Windows.CloudExperienceHost',
    'Microsoft.Windows.ContentDeliveryManager',
    'Microsoft.Windows.Cortana',
    'Microsoft.Windows.NarratorQuickStart',
    'Microsoft.Windows.ParentalControls',
    'Microsoft.Windows.PeopleExperienceHost',
    'Microsoft.Windows.PinningConfirmationDialog',
    'Microsoft.Windows.SecHealthUI',
    'Microsoft.Windows.SecureAssessmentBrowser',
    'Microsoft.Windows.ShellExperienceHost',
    'Microsoft.Windows.XGpuEjectDialog',
    'Microsoft.XboxGameCallableUI',
    'Windows.CBSPreview',
    'windows.immersivecontrolpanel',
    'Windows.PrintDialog',
    'Microsoft.VCLibs.140.00',
    'Microsoft.Services.Store.Engagement',
    'Microsoft.UI.Xaml.2.0',
    'Microsoft.AsyncTextService',
    'Microsoft.UI.Xaml.CBS',
    'Microsoft.Windows.CallingShellApp',
    'Microsoft.Windows.OOBENetworkConnectionFlow',
    'Microsoft.Windows.PrintQueueActionCenter',
    'Microsoft.Windows.StartMenuExperienceHost',
    'MicrosoftWindows.Client.CBS',
    'MicrosoftWindows.Client.Core',
    'MicrosoftWindows.UndockedDevKit',
    'NcsiUwpApp',
    'Microsoft.NET.Native.Runtime.2.2',
    'Microsoft.NET.Native.Framework.2.2',
    'Microsoft.UI.Xaml.2.8',
    'Microsoft.UI.Xaml.2.7',
    'Microsoft.UI.Xaml.2.3',
    'Microsoft.UI.Xaml.2.4',
    'Microsoft.UI.Xaml.2.1',
    'Microsoft.UI.Xaml.2.2',
    'Microsoft.UI.Xaml.2.5',
    'Microsoft.UI.Xaml.2.6',
    'Microsoft.VCLibs.140.00.UWPDesktop',
    'MicrosoftWindows.Client.LKG',
    'MicrosoftWindows.Client.FileExp',
    'Microsoft.WindowsAppRuntime.1.5',
    'Microsoft.WindowsAppRuntime.1.3',
    'Microsoft.WindowsAppRuntime.1.1',
    'Microsoft.WindowsAppRuntime.1.2',
    'Microsoft.WindowsAppRuntime.1.4',
    'Microsoft.Windows.OOBENetworkCaptivePortal',
    'Microsoft.Windows.Search'
)

##Combine the two arrays
$appstoignore = $WhitelistedApps += $NonRemovable

##Bloat list for future reference
$Bloatware = @(
#Unnecessary Windows 10/11 AppX Apps
"*ActiproSoftwareLLC*"
"*AdobeSystemsIncorporated.AdobePhotoshopExpress*"
"*BubbleWitch3Saga*"
"*CandyCrush*"
"*DevHome*"
"*Disney*"
"*Dolby*"
"*Duolingo-LearnLanguagesforFree*"
"*EclipseManager*"
"*Facebook*"
"*Flipboard*"
"*gaming*"
"*Minecraft*"
"*Office*"
"*PandoraMediaInc*"
"*Royal Revolt*"
"*Speed Test*"
"*Spotify*"
"*Sway*"
"*Twitter*"
"*Wunderlist*"
"AD2F1837.HPPrinterControl"
"AppUp.IntelGraphicsExperience"
"C27EB4BA.DropboxOEM*"
"Disney.37853FC22B2CE"
"DolbyLaboratories.DolbyAccess"
"DolbyLaboratories.DolbyAudio"
"E0469640.SmartAppearance"
"Microsoft.549981C3F5F10"
#"Microsoft.AV1VideoExtension"
"Microsoft.BingNews"
"Microsoft.BingSearch"
"Microsoft.BingWeather"
"Microsoft.GetHelp"
"Microsoft.Getstarted"
"Microsoft.GamingApp"
#"Microsoft.HEVCVideoExtension"
"Microsoft.Messaging"
"Microsoft.Microsoft3DViewer"
#"Microsoft.MicrosoftEdge.Stable"
"Microsoft.MicrosoftJournal"
"Microsoft.MicrosoftOfficeHub"
"Microsoft.MicrosoftSolitaireCollection"
"Microsoft.MixedReality.Portal"
#"Microsoft.MPEG2VideoExtension"
"Microsoft.News"
"Microsoft.Office.Lens"
"Microsoft.Office.OneNote"
"Microsoft.Office.Sway"
"Microsoft.OneConnect"
"Microsoft.OneDriveSync"
"Microsoft.People"
"Microsoft.PowerAutomateDesktop"
"Microsoft.PowerAutomateDesktopCopilotPlugin"
"Microsoft.Print3D"
#"Microsoft.RemoteDesktop"
"Microsoft.SkypeApp"
#"Microsoft.StorePurchaseApp"
#"Microsoft.SysinternalsSuite"
#"Microsoft.Teams"
"Microsoft.Todos"
"Microsoft.Whiteboard"
"Microsoft.Windows.DevHome"
#"Microsoft.WindowsAlarms"
#"Microsoft.WindowsCamera"
"Microsoft.windowscommunicationsapps"
"Microsoft.WindowsFeedbackHub"
"Microsoft.WindowsMaps"
#"Microsoft.WindowsSoundRecorder"
#"Microsoft.WindowsStore"
"Microsoft.Xbox.TCUI"
"Microsoft.XboxApp"
"Microsoft.XboxGameOverlay"
"Microsoft.XboxGamingOverlay"
"Microsoft.XboxGamingOverlay_5.721.10202.0_neutral_~_8wekyb3d8bbwe"
"Microsoft.XboxIdentityProvider"
"Microsoft.XboxSpeechToTextOverlay"
"Microsoft.YourPhone"
"Microsoft.ZuneMusic"
"Microsoft.ZuneVideo"
"MicrosoftCorporationII.MicrosoftFamily"
"MicrosoftCorporationII.QuickAssist"
"MicrosoftWindows.Client.WebExperience"
"MicrosoftWindows.CrossDevice"
"MirametrixInc.GlancebyMirametrix"
#"MSTeams"
"RealtimeboardInc.RealtimeBoard"
"SpotifyAB.SpotifyMusic"
#Optional: Typically not removed but you can if you need to for some reason
"*Microsoft.Advertising.Xaml_10.1712.5.0_x64__8wekyb3d8bbwe*"
"*Microsoft.Advertising.Xaml_10.1712.5.0_x86__8wekyb3d8bbwe*"
#"*Microsoft.MSPaint*"
#"*Microsoft.MicrosoftStickyNotes*"
#"*Microsoft.Windows.Photos*"
#"*Microsoft.WindowsCalculator*"
"Microsoft.Office.Todo.List"
)


$provisioned = Get-AppxProvisionedPackage -Online | Where-Object { $_.DisplayName -in $Bloatware -and $_.DisplayName -notin $appstoignore -and $_.DisplayName -notlike 'MicrosoftWindows.Voice*' -and $_.DisplayName -notlike 'Microsoft.LanguageExperiencePack*' -and $_.DisplayName -notlike 'MicrosoftWindows.Speech*' }
foreach ($appxprov in $provisioned) {
    $packagename = $appxprov.PackageName
    $displayname = $appxprov.DisplayName
    write-output "Removing $displayname AppX Provisioning Package"
    try {
        Remove-AppxProvisionedPackage -PackageName $packagename -Online -ErrorAction SilentlyContinue
        write-output "Removed $displayname AppX Provisioning Package"
    }
    catch {
        write-output "Unable to remove $displayname AppX Provisioning Package"
    }

}


$appxinstalled = Get-AppxPackage -AllUsers | Where-Object { $_.Name -in $Bloatware -and $_.Name -notin $appstoignore  -and $_.Name -notlike 'MicrosoftWindows.Voice*' -and $_.Name -notlike 'Microsoft.LanguageExperiencePack*' -and $_.Name -notlike 'MicrosoftWindows.Speech*'}
foreach ($appxapp in $appxinstalled) {
    $packagename = $appxapp.PackageFullName
    $displayname = $appxapp.Name
    write-output "$displayname AppX Package exists"
    write-output "Removing $displayname AppX Package"
    try {
        Remove-AppxPackage -Package $packagename -AllUsers -ErrorAction SilentlyContinue
        write-output "Removed $displayname AppX Package"
    }
    catch {
        write-output "$displayname AppX Package does not exist"
    }



}


############################################################################################################
#                                        Remove Registry Keys                                              #
#                                                                                                          #
############################################################################################################

##We need to grab all SIDs to remove at user level
$UserSIDs = Get-ChildItem "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList" | Select-Object -ExpandProperty PSChildName


#These are the registry keys that it will delete.

$Keys = @(

    #Remove Background Tasks
    "HKCR:\Extensions\ContractId\Windows.BackgroundTasks\PackageId\46928bounde.EclipseManager_2.2.4.51_neutral__a5h4egax66k6y"
    "HKCR:\Extensions\ContractId\Windows.BackgroundTasks\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0"
    "HKCR:\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.MicrosoftOfficeHub_17.7909.7600.0_x64__8wekyb3d8bbwe"
    "HKCR:\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.PPIProjection_10.0.15063.0_neutral_neutral_cw5n1h2txyewy"
    "HKCR:\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.XboxGameCallableUI_1000.15063.0.0_neutral_neutral_cw5n1h2txyewy"
    "HKCR:\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.XboxGameCallableUI_1000.16299.15.0_neutral_neutral_cw5n1h2txyewy"

    #Windows File
    "HKCR:\Extensions\ContractId\Windows.File\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0"

    #Registry keys to delete if they aren't uninstalled by RemoveAppXPackage/RemoveAppXProvisionedPackage
    "HKCR:\Extensions\ContractId\Windows.Launch\PackageId\46928bounde.EclipseManager_2.2.4.51_neutral__a5h4egax66k6y"
    "HKCR:\Extensions\ContractId\Windows.Launch\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0"
    "HKCR:\Extensions\ContractId\Windows.Launch\PackageId\Microsoft.PPIProjection_10.0.15063.0_neutral_neutral_cw5n1h2txyewy"
    "HKCR:\Extensions\ContractId\Windows.Launch\PackageId\Microsoft.XboxGameCallableUI_1000.15063.0.0_neutral_neutral_cw5n1h2txyewy"
    "HKCR:\Extensions\ContractId\Windows.Launch\PackageId\Microsoft.XboxGameCallableUI_1000.16299.15.0_neutral_neutral_cw5n1h2txyewy"

    #Scheduled Tasks to delete
    "HKCR:\Extensions\ContractId\Windows.PreInstalledConfigTask\PackageId\Microsoft.MicrosoftOfficeHub_17.7909.7600.0_x64__8wekyb3d8bbwe"

    #Windows Protocol Keys
    "HKCR:\Extensions\ContractId\Windows.Protocol\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0"
    "HKCR:\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.PPIProjection_10.0.15063.0_neutral_neutral_cw5n1h2txyewy"
    "HKCR:\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.XboxGameCallableUI_1000.15063.0.0_neutral_neutral_cw5n1h2txyewy"
    "HKCR:\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.XboxGameCallableUI_1000.16299.15.0_neutral_neutral_cw5n1h2txyewy"

    #Windows Share Target
    "HKCR:\Extensions\ContractId\Windows.ShareTarget\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0"
)

#This writes the output of each key it is removing and also removes the keys listed above.
ForEach ($Key in $Keys) {
    write-output "Removing $Key from registry"
    Remove-Item $Key -Recurse
}


#Disables Windows Feedback Experience
write-output "Disabling Windows Feedback Experience program"
$Advertising = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo"
If (!(Test-Path $Advertising)) {
    New-Item $Advertising
}
If (Test-Path $Advertising) {
    Set-ItemProperty $Advertising Enabled -Value 0
}

#Stops Cortana from being used as part of your Windows Search Function
write-output "Stopping Cortana from being used as part of your Windows Search Function"
$Search = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search"
If (!(Test-Path $Search)) {
    New-Item $Search
}
If (Test-Path $Search) {
    Set-ItemProperty $Search AllowCortana -Value 0
}

#Disables Web Search in Start Menu
write-output "Disabling Bing Search in Start Menu"
$WebSearch = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search"
If (!(Test-Path $WebSearch)) {
    New-Item $WebSearch
}
Set-ItemProperty $WebSearch DisableWebSearch -Value 1
##Loop through all user SIDs in the registry and disable Bing Search
foreach ($sid in $UserSIDs) {
    $WebSearch = "Registry::HKU\$sid\SOFTWARE\Microsoft\Windows\CurrentVersion\Search"
    If (!(Test-Path $WebSearch)) {
        New-Item $WebSearch
    }
    Set-ItemProperty $WebSearch BingSearchEnabled -Value 0
}

Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" BingSearchEnabled -Value 0


#Stops the Windows Feedback Experience from sending anonymous data
write-output "Stopping the Windows Feedback Experience program"
$Period = "HKCU:\Software\Microsoft\Siuf\Rules"
If (!(Test-Path $Period)) {
    New-Item $Period
}
Set-ItemProperty $Period PeriodInNanoSeconds -Value 0

##Loop and do the same
foreach ($sid in $UserSIDs) {
    $Period = "Registry::HKU\$sid\Software\Microsoft\Siuf\Rules"
    If (!(Test-Path $Period)) {
        New-Item $Period
    }
    Set-ItemProperty $Period PeriodInNanoSeconds -Value 0
}

##Disables games from showing in Search bar
write-output "Adding Registry key to stop games from search bar"
$registryPath = "HKLM:\	SOFTWARE\Policies\Microsoft\Windows\Windows Search"
If (!(Test-Path $registryPath)) {
    New-Item $registryPath
}
Set-ItemProperty $registryPath EnableDynamicContentInWSB -Value 0

#Prevents bloatware applications from returning and removes Start Menu suggestions
write-output "Adding Registry key to prevent bloatware apps from returning"
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent"
$registryOEM = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager"
If (!(Test-Path $registryPath)) {
    New-Item $registryPath
}
Set-ItemProperty $registryPath DisableWindowsConsumerFeatures -Value 1

If (!(Test-Path $registryOEM)) {
    New-Item $registryOEM
}
Set-ItemProperty $registryOEM  ContentDeliveryAllowed -Value 0
Set-ItemProperty $registryOEM  OemPreInstalledAppsEnabled -Value 0
Set-ItemProperty $registryOEM  PreInstalledAppsEnabled -Value 0
Set-ItemProperty $registryOEM  PreInstalledAppsEverEnabled -Value 0
Set-ItemProperty $registryOEM  SilentInstalledAppsEnabled -Value 0
Set-ItemProperty $registryOEM  SystemPaneSuggestionsEnabled -Value 0

##Loop through users and do the same
foreach ($sid in $UserSIDs) {
    $registryOEM = "Registry::HKU\$sid\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager"
    If (!(Test-Path $registryOEM)) {
        New-Item $registryOEM
    }
    Set-ItemProperty $registryOEM  ContentDeliveryAllowed -Value 0
    Set-ItemProperty $registryOEM  OemPreInstalledAppsEnabled -Value 0
    Set-ItemProperty $registryOEM  PreInstalledAppsEnabled -Value 0
    Set-ItemProperty $registryOEM  PreInstalledAppsEverEnabled -Value 0
    Set-ItemProperty $registryOEM  SilentInstalledAppsEnabled -Value 0
    Set-ItemProperty $registryOEM  SystemPaneSuggestionsEnabled -Value 0
}

#Preping mixed Reality Portal for removal
write-output "Setting Mixed Reality Portal value to 0 so that you can uninstall it in Settings"
$Holo = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Holographic"
If (Test-Path $Holo) {
    Set-ItemProperty $Holo  FirstRunSucceeded -Value 0
}

##Loop through users and do the same
foreach ($sid in $UserSIDs) {
    $Holo = "Registry::HKU\$sid\Software\Microsoft\Windows\CurrentVersion\Holographic"
    If (Test-Path $Holo) {
        Set-ItemProperty $Holo  FirstRunSucceeded -Value 0
    }
}

#Disables Wi-fi Sense
write-output "Disabling Wi-Fi Sense"
$WifiSense1 = "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting"
$WifiSense2 = "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots"
$WifiSense3 = "HKLM:\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\config"
If (!(Test-Path $WifiSense1)) {
    New-Item $WifiSense1
}
Set-ItemProperty $WifiSense1  Value -Value 0
If (!(Test-Path $WifiSense2)) {
    New-Item $WifiSense2
}
Set-ItemProperty $WifiSense2  Value -Value 0
Set-ItemProperty $WifiSense3  AutoConnectAllowedOEM -Value 0

#Disables live tiles
write-output "Disabling live tiles"
$Live = "HKCU:\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications"
If (!(Test-Path $Live)) {
    New-Item $Live
}
Set-ItemProperty $Live  NoTileApplicationNotification -Value 1

##Loop through users and do the same
foreach ($sid in $UserSIDs) {
    $Live = "Registry::HKU\$sid\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications"
    If (!(Test-Path $Live)) {
        New-Item $Live
    }
    Set-ItemProperty $Live  NoTileApplicationNotification -Value 1
}

#Turns off Data Collection via the AllowTelemtry key by changing it to 0
# This is needed for Intune reporting to work, uncomment if using via other method
#write-output "Turning off Data Collection"
#$DataCollection1 = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection"
#$DataCollection2 = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection"
#$DataCollection3 = "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Policies\DataCollection"
#If (Test-Path $DataCollection1) {
#    Set-ItemProperty $DataCollection1  AllowTelemetry -Value 0
#}
#If (Test-Path $DataCollection2) {
#    Set-ItemProperty $DataCollection2  AllowTelemetry -Value 0
#}
#If (Test-Path $DataCollection3) {
#    Set-ItemProperty $DataCollection3  AllowTelemetry -Value 0
#}


###Enable location tracking for "find my device", uncomment if you don't need it

#Disabling Location Tracking
#write-output "Disabling Location Tracking"
#$SensorState = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Overrides\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}"
#$LocationConfig = "HKLM:\SYSTEM\CurrentControlSet\Services\lfsvc\Service\Configuration"
#If (!(Test-Path $SensorState)) {
#    New-Item $SensorState
#}
#Set-ItemProperty $SensorState SensorPermissionState -Value 0
#If (!(Test-Path $LocationConfig)) {
#    New-Item $LocationConfig
#}
#Set-ItemProperty $LocationConfig Status -Value 0

#Disables People icon on Taskbar
write-output "Disabling People icon on Taskbar"
$People = 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People'
If (Test-Path $People) {
    Set-ItemProperty $People -Name PeopleBand -Value 0
}

##Loop through users and do the same
foreach ($sid in $UserSIDs) {
    $People = "Registry::HKU\$sid\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People"
    If (Test-Path $People) {
        Set-ItemProperty $People -Name PeopleBand -Value 0
    }
}

write-output "Disabling Cortana"
$Cortana1 = "HKCU:\SOFTWARE\Microsoft\Personalization\Settings"
$Cortana2 = "HKCU:\SOFTWARE\Microsoft\InputPersonalization"
$Cortana3 = "HKCU:\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore"
If (!(Test-Path $Cortana1)) {
    New-Item $Cortana1
}
Set-ItemProperty $Cortana1 AcceptedPrivacyPolicy -Value 0
If (!(Test-Path $Cortana2)) {
    New-Item $Cortana2
}
Set-ItemProperty $Cortana2 RestrictImplicitTextCollection -Value 1
Set-ItemProperty $Cortana2 RestrictImplicitInkCollection -Value 1
If (!(Test-Path $Cortana3)) {
    New-Item $Cortana3
}
Set-ItemProperty $Cortana3 HarvestContacts -Value 0

##Loop through users and do the same
foreach ($sid in $UserSIDs) {
    $Cortana1 = "Registry::HKU\$sid\SOFTWARE\Microsoft\Personalization\Settings"
    $Cortana2 = "Registry::HKU\$sid\SOFTWARE\Microsoft\InputPersonalization"
    $Cortana3 = "Registry::HKU\$sid\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore"
    If (!(Test-Path $Cortana1)) {
        New-Item $Cortana1
    }
    Set-ItemProperty $Cortana1 AcceptedPrivacyPolicy -Value 0
    If (!(Test-Path $Cortana2)) {
        New-Item $Cortana2
    }
    Set-ItemProperty $Cortana2 RestrictImplicitTextCollection -Value 1
    Set-ItemProperty $Cortana2 RestrictImplicitInkCollection -Value 1
    If (!(Test-Path $Cortana3)) {
        New-Item $Cortana3
    }
    Set-ItemProperty $Cortana3 HarvestContacts -Value 0
}


#Removes 3D Objects from the 'My Computer' submenu in explorer
write-output "Removing 3D Objects from explorer 'My Computer' submenu"
$Objects32 = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}"
$Objects64 = "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}"
If (Test-Path $Objects32) {
    Remove-Item $Objects32 -Recurse
}
If (Test-Path $Objects64) {
    Remove-Item $Objects64 -Recurse
}

##Removes the Microsoft Feeds from displaying
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds"
$Name = "EnableFeeds"
$value = "0"

if (!(Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
    New-ItemProperty -Path $registryPath -Name $name -Value $value -PropertyType DWORD -Force | Out-Null
}

else {
    New-ItemProperty -Path $registryPath -Name $name -Value $value -PropertyType DWORD -Force | Out-Null
}

##Kill Cortana again
Get-AppxPackage Microsoft.549981C3F5F10 -allusers | Remove-AppxPackage



############################################################################################################
#                                   Disable unwanted OOBE screens for Device Prep                          #
#                                                                                                          #
############################################################################################################

$registryPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OOBE"
$registryPath2 = "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System"
$Name1 = "DisablePrivacyExperience"
$Name2 = "DisableVoice"
$Name3 = "PrivacyConsentStatus"
$Name4 = "Protectyourpc"
$Name5 = "HideEULAPage"
$Name6 = "EnableFirstLogonAnimation"
New-ItemProperty -Path $registryPath -Name $name1 -Value 1 -PropertyType DWord -Force
New-ItemProperty -Path $registryPath -Name $name2 -Value 1 -PropertyType DWord -Force
New-ItemProperty -Path $registryPath -Name $name3 -Value 1 -PropertyType DWord -Force
New-ItemProperty -Path $registryPath -Name $name4 -Value 3 -PropertyType DWord -Force
New-ItemProperty -Path $registryPath -Name $name5 -Value 1 -PropertyType DWord -Force
New-ItemProperty -Path $registryPath2 -Name $name6 -Value 1 -PropertyType DWord -Force



############################################################################################################
#                                        Remove Learn about this picture                                   #
#                                                                                                          #
############################################################################################################

#Turn off Learn about this picture
write-output "Disabling Learn about this picture"
$picture = 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel'
If (Test-Path $picture) {
    Set-ItemProperty $picture -Name "{2cc5ca98-6485-489a-920e-b3e88a6ccce3}" -Value 1
}

##Loop through users and do the same
foreach ($sid in $UserSIDs) {
    $picture = "Registry::HKU\$sid\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel"
    If (Test-Path $picture) {
        Set-ItemProperty $picture -Name "{2cc5ca98-6485-489a-920e-b3e88a6ccce3}" -Value 1
    }
}


############################################################################################################
#                                     Disable Consumer Experiences                                         #
#                                                                                                          #
############################################################################################################

#Disabling consumer experience
write-output "Disabling consumer experience"
$consumer = 'HKLM:\\SOFTWARE\Policies\Microsoft\Windows\CloudContent'
If (Test-Path $consumer) {
    Set-ItemProperty $consumer -Name "DisableWindowsConsumerFeatures" -Value 1
}


############################################################################################################
#                                                   Disable Spotlight                                      #
#                                                                                                          #
############################################################################################################

write-output "Disabling Windows Spotlight on lockscreen"
$spotlight = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager'
If (Test-Path $spotlight) {
    Set-ItemProperty $spotlight -Name "RotatingLockScreenOverlayEnabled" -Value 0
    Set-ItemProperty $spotlight -Name "RotatingLockScreenEnabled" -Value 0
}

##Loop through users and do the same
foreach ($sid in $UserSIDs) {
    $spotlight = "Registry::HKU\$sid\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager"
    If (Test-Path $spotlight) {
        Set-ItemProperty $spotlight -Name "RotatingLockScreenOverlayEnabled" -Value 0
        Set-ItemProperty $spotlight -Name "RotatingLockScreenEnabled" -Value 0
    }
}

write-output "Disabling Windows Spotlight on background"
$spotlight = 'HKCU:\Software\Policies\Microsoft\Windows\CloudContent'
If (Test-Path $spotlight) {
    Set-ItemProperty $spotlight -Name "DisableSpotlightCollectionOnDesktop" -Value 1
    Set-ItemProperty $spotlight -Name "DisableWindowsSpotlightFeatures" -Value 1
}

##Loop through users and do the same
foreach ($sid in $UserSIDs) {
    $spotlight = "Registry::HKU\$sid\Software\Policies\Microsoft\Windows\CloudContent"
    If (Test-Path $spotlight) {
        Set-ItemProperty $spotlight -Name "DisableSpotlightCollectionOnDesktop" -Value 1
        Set-ItemProperty $spotlight -Name "DisableWindowsSpotlightFeatures" -Value 1
    }
}

############################################################################################################
#                                        Remove Scheduled Tasks                                            #
#                                                                                                          #
############################################################################################################

#Disables scheduled tasks that are considered unnecessary
write-output "Disabling scheduled tasks"
$task1 = Get-ScheduledTask -TaskName XblGameSaveTaskLogon -ErrorAction SilentlyContinue
if ($null -ne $task1) {
    Get-ScheduledTask  XblGameSaveTaskLogon | Disable-ScheduledTask -ErrorAction SilentlyContinue
}
$task2 = Get-ScheduledTask -TaskName XblGameSaveTask -ErrorAction SilentlyContinue
if ($null -ne $task2) {
    Get-ScheduledTask  XblGameSaveTask | Disable-ScheduledTask -ErrorAction SilentlyContinue
}
$task3 = Get-ScheduledTask -TaskName Consolidator -ErrorAction SilentlyContinue
if ($null -ne $task3) {
    Get-ScheduledTask  Consolidator | Disable-ScheduledTask -ErrorAction SilentlyContinue
}
$task4 = Get-ScheduledTask -TaskName UsbCeip -ErrorAction SilentlyContinue
if ($null -ne $task4) {
    Get-ScheduledTask  UsbCeip | Disable-ScheduledTask -ErrorAction SilentlyContinue
}
$task5 = Get-ScheduledTask -TaskName DmClient -ErrorAction SilentlyContinue
if ($null -ne $task5) {
    Get-ScheduledTask  DmClient | Disable-ScheduledTask -ErrorAction SilentlyContinue
}
$task6 = Get-ScheduledTask -TaskName DmClientOnScenarioDownload -ErrorAction SilentlyContinue
if ($null -ne $task6) {
    Get-ScheduledTask  DmClientOnScenarioDownload | Disable-ScheduledTask -ErrorAction SilentlyContinue
}


############################################################################################################
#                                             Disable Services                                             #
#                                                                                                          #
############################################################################################################
##write-output "Stopping and disabling Diagnostics Tracking Service"
#Disabling the Diagnostics Tracking Service
##Stop-Service "DiagTrack"
##Set-Service "DiagTrack" -StartupType Disabled


############################################################################################################
#                                        Windows 11 Specific                                               #
#                                                                                                          #
############################################################################################################
#Windows 11 Customisations
write-output "Removing Windows 11 Customisations"


##Disable Feeds
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Dsh"
If (!(Test-Path $registryPath)) {
    New-Item $registryPath
}
Set-ItemProperty $registryPath "AllowNewsAndInterests" -Value 0
write-output "Disabled Feeds"

############################################################################################################
#                                           Windows Backup App                                             #
#                                                                                                          #
############################################################################################################
$version = Get-CimInstance Win32_OperatingSystem | Select-Object -ExpandProperty Caption
if ($version -like "*Windows 10*") {
    write-output "Removing Windows Backup"
    $filepath = "C:\Windows\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy\WindowsBackup\Assets"
    if (Test-Path $filepath) {
        Remove-WindowsPackage -Online -PackageName "Microsoft-Windows-UserExperience-Desktop-Package~31bf3856ad364e35~amd64~~10.0.19041.3393"

        ##Add back snipping tool functionality
        write-output "Adding Windows Shell Components"
        DISM /Online /Add-Capability /CapabilityName:Windows.Client.ShellComponents~~~~0.0.1.0
        write-output "Components Added"
    }
    write-output "Removed"
}

############################################################################################################
#                                           Windows CoPilot                                                #
#                                                                                                          #
############################################################################################################
$version = Get-CimInstance Win32_OperatingSystem | Select-Object -ExpandProperty Caption
if ($version -like "*Windows 11*") {
    write-output "Removing Windows Copilot"
    # Define the registry key and value
    $registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot"
    $propertyName = "TurnOffWindowsCopilot"
    $propertyValue = 1

    # Check if the registry key exists
    if (!(Test-Path $registryPath)) {
        # If the registry key doesn't exist, create it
        New-Item -Path $registryPath -Force | Out-Null
    }

    # Get the property value
    $currentValue = Get-ItemProperty -Path $registryPath -Name $propertyName -ErrorAction SilentlyContinue

    # Check if the property exists and if its value is different from the desired value
    if ($null -eq $currentValue -or $currentValue.$propertyName -ne $propertyValue) {
        # If the property doesn't exist or its value is different, set the property value
        Set-ItemProperty -Path $registryPath -Name $propertyName -Value $propertyValue
    }


    ##Grab the default user as well
    $registryPath = "HKEY_USERS\.DEFAULT\Software\Policies\Microsoft\Windows\WindowsCopilot"
    $propertyName = "TurnOffWindowsCopilot"
    $propertyValue = 1

    # Check if the registry key exists
    if (!(Test-Path $registryPath)) {
        # If the registry key doesn't exist, create it
        New-Item -Path $registryPath -Force | Out-Null
    }

    # Get the property value
    $currentValue = Get-ItemProperty -Path $registryPath -Name $propertyName -ErrorAction SilentlyContinue

    # Check if the property exists and if its value is different from the desired value
    if ($null -eq $currentValue -or $currentValue.$propertyName -ne $propertyValue) {
        # If the property doesn't exist or its value is different, set the property value
        Set-ItemProperty -Path $registryPath -Name $propertyName -Value $propertyValue
    }


    ##Load the default hive from c:\users\Default\NTUSER.dat
    reg load HKU\temphive "c:\users\default\ntuser.dat"
    $registryPath = "registry::hku\temphive\Software\Policies\Microsoft\Windows\WindowsCopilot"
    $propertyName = "TurnOffWindowsCopilot"
    $propertyValue = 1

    # Check if the registry key exists
    if (!(Test-Path $registryPath)) {
        # If the registry key doesn't exist, create it
        [Microsoft.Win32.RegistryKey]$HKUCoPilot = [Microsoft.Win32.Registry]::Users.CreateSubKey("temphive\Software\Policies\Microsoft\Windows\WindowsCopilot", [Microsoft.Win32.RegistryKeyPermissionCheck]::ReadWriteSubTree)
        $HKUCoPilot.SetValue("TurnOffWindowsCopilot", 0x1, [Microsoft.Win32.RegistryValueKind]::DWord)
    }





    $HKUCoPilot.Flush()
    $HKUCoPilot.Close()
    [gc]::Collect()
    [gc]::WaitForPendingFinalizers()
    reg unload HKU\temphive


    write-output "Removed"


    foreach ($sid in $UserSIDs) {
        $registryPath = "Registry::HKU\$sid\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot"
        $propertyName = "TurnOffWindowsCopilot"
        $propertyValue = 1

        # Check if the registry key exists
        if (!(Test-Path $registryPath)) {
            # If the registry key doesn't exist, create it
            New-Item -Path $registryPath -Force | Out-Null
        }

        # Get the property value
        $currentValue = Get-ItemProperty -Path $registryPath -Name $propertyName -ErrorAction SilentlyContinue

        # Check if the property exists and if its value is different from the desired value
        if ($null -eq $currentValue -or $currentValue.$propertyName -ne $propertyValue) {
            # If the property doesn't exist or its value is different, set the property value
            Set-ItemProperty -Path $registryPath -Name $propertyName -Value $propertyValue
        }
    }
}
############################################################################################################
#                                              Remove Recall                                               #
#                                                                                                          #
############################################################################################################

#Turn off Recall
write-output "Disabling Recall"
$recall = "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsAI"
If (!(Test-Path $recall)) {
    New-Item $recall
}
Set-ItemProperty $recall DisableAIDataAnalysis -Value 1


$recalluser = 'HKCU:\SOFTWARE\Policies\Microsoft\Windows\WindowsAI'
If (!(Test-Path $recalluser)) {
    New-Item $recalluser
}
Set-ItemProperty $recalluser DisableAIDataAnalysis -Value 1

##Loop through users and do the same
foreach ($sid in $UserSIDs) {
    $recallusers = "Registry::HKU\$sid\SOFTWARE\Policies\Microsoft\Windows\WindowsAI"
    If (!(Test-Path $recallusers)) {
        New-Item $recallusers
    }
    Set-ItemProperty $recallusers DisableAIDataAnalysis -Value 1
}


############################################################################################################
#                                             Clear Start Menu                                             #
#                                                                                                          #
############################################################################################################
write-output "Clearing Start Menu"
#Delete layout file if it already exists

##Check windows version
$version = Get-CimInstance Win32_OperatingSystem | Select-Object -ExpandProperty Caption
if ($version -like "*Windows 10*") {
    write-output "Windows 10 Detected"
    write-output "Removing Current Layout"
    If (Test-Path C:\Windows\StartLayout.xml)
    {

        Remove-Item C:\Windows\StartLayout.xml

    }
    write-output "Creating Default Layout"
    #Creates the blank layout file

    Write-Output "<LayoutModificationTemplate xmlns:defaultlayout=""http://schemas.microsoft.com/Start/2014/FullDefaultLayout"" xmlns:start=""http://schemas.microsoft.com/Start/2014/StartLayout"" Version=""1"" xmlns=""http://schemas.microsoft.com/Start/2014/LayoutModification"">" >> C:\Windows\StartLayout.xml

    Write-Output " <LayoutOptions StartTileGroupCellWidth=""6"" />" >> C:\Windows\StartLayout.xml

    Write-Output " <DefaultLayoutOverride>" >> C:\Windows\StartLayout.xml

    Write-Output " <StartLayoutCollection>" >> C:\Windows\StartLayout.xml

    Write-Output " <defaultlayout:StartLayout GroupCellWidth=""6"" />" >> C:\Windows\StartLayout.xml

    Write-Output " </StartLayoutCollection>" >> C:\Windows\StartLayout.xml

    Write-Output " </DefaultLayoutOverride>" >> C:\Windows\StartLayout.xml

    Write-Output "</LayoutModificationTemplate>" >> C:\Windows\StartLayout.xml
}
if ($version -like "*Windows 11*") {
    write-output "Windows 11 Detected"
    write-output "Removing Current Layout"
    If (Test-Path "C:\Users\Default\AppData\Local\Microsoft\Windows\Shell\LayoutModification.xml")
    {

        Remove-Item "C:\Users\Default\AppData\Local\Microsoft\Windows\Shell\LayoutModification.xml"

    }

    $blankjson = @'
{
    "pinnedList": [
{ "desktopAppId": "MSEdge" },
{ "packagedAppId": "desktopAppId":"Microsoft.Windows.Explorer" }
    ]
}
'@

    $blankjson | Out-File "C:\Users\Default\AppData\Local\Microsoft\Windows\Shell\LayoutModification.xml" -Encoding utf8 -Force
    $intunepath = "HKLM:\SOFTWARE\Microsoft\IntuneManagementExtension\Win32Apps"
    $intunecomplete = @(Get-ChildItem $intunepath).count
    # $userpath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList"
    # $userprofiles = Get-ChildItem $userpath | ForEach-Object { Get-ItemProperty $_.PSPath }

    # $nonAdminLoggedOn = $false
    # foreach ($user in $userprofiles) {
        # if ($user.PSChildName -ne '.DEFAULT' -and $user.PSChildName -ne 'S-1-5-18' -and $user.PSChildName -ne 'S-1-5-19' -and $user.PSChildName -ne 'S-1-5-20' -and $user.PSChildName -notmatch 'S-1-5-21-\d+-\d+-\d+-500') {
            # $nonAdminLoggedOn = $true
            # break
        # }
    # }

    # if ($nonAdminLoggedOn -eq $false) {
        # MkDir -Path "C:\Users\Default\AppData\Local\Packages\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\LocalState" -Force -ErrorAction SilentlyContinue | Out-Null
        # $starturl = "https://github.com/ehousse/Intune-De-Bloat/raw/main/start2.bin"
        # invoke-webrequest -uri $starturl -outfile "C:\Users\Default\AppData\Local\Packages\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\LocalState\Start2.bin"
    # }
}


############################################################################################################
#                                              Remove Xbox Gaming                                          #
#                                                                                                          #
############################################################################################################

New-ItemProperty -Path "HKLM:\System\CurrentControlSet\Services\xbgm" -Name "Start" -PropertyType DWORD -Value 4 -Force
Set-Service -Name XblAuthManager -StartupType Disabled
Set-Service -Name XblGameSave -StartupType Disabled
Set-Service -Name XboxGipSvc -StartupType Disabled
Set-Service -Name XboxNetApiSvc -StartupType Disabled
$task = Get-ScheduledTask -TaskName "Microsoft\XblGameSave\XblGameSaveTask" -ErrorAction SilentlyContinue
if ($null -ne $task) {
    Set-ScheduledTask -TaskPath $task.TaskPath -Enabled $false
}

##Check if GamePresenceWriter.exe exists
if (Test-Path "$env:WinDir\System32\GameBarPresenceWriter.exe") {
    write-output "GamePresenceWriter.exe exists"
    #Take-Ownership -Path "$env:WinDir\System32\GameBarPresenceWriter.exe"
    $NewAcl = Get-Acl -Path "$env:WinDir\System32\GameBarPresenceWriter.exe"
    # Set properties
    $identity = "$builtin\Administrators"
    $fileSystemRights = "FullControl"
    $type = "Allow"
    # Create new rule
    $fileSystemAccessRuleArgumentList = $identity, $fileSystemRights, $type
    $fileSystemAccessRule = New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $fileSystemAccessRuleArgumentList
    # Apply new rule
    $NewAcl.SetAccessRule($fileSystemAccessRule)
    Set-Acl -Path "$env:WinDir\System32\GameBarPresenceWriter.exe" -AclObject $NewAcl
    Stop-Process -Name "GameBarPresenceWriter.exe" -Force
    Remove-Item "$env:WinDir\System32\GameBarPresenceWriter.exe" -Force -Confirm:$false

}
else {
    write-output "GamePresenceWriter.exe does not exist"
}

New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\GameDVR" -Name "AllowgameDVR" -PropertyType DWORD -Value 0 -Force
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name "SettingsPageVisibility" -PropertyType String -Value "hide:gaming-gamebar;gaming-gamedvr;gaming-broadcasting;gaming-gamemode;gaming-xboxnetworking" -Force
Remove-Item C:\Windows\Temp\SetACL.exe -recurse

############################################################################################################
#                                        Disable Edge Surf Game                                            #
#                                                                                                          #
############################################################################################################
$surf = "HKLM:\SOFTWARE\Policies\Microsoft\Edge"
If (!(Test-Path $surf)) {
    New-Item $surf
}
New-ItemProperty -Path $surf -Name 'AllowSurfGame' -Value 0 -PropertyType DWord

############################################################################################################
#                                       Grab all Uninstall Strings                                         #
#                                                                                                          #
############################################################################################################


write-output "Checking 32-bit System Registry"
##Search for 32-bit versions and list them
$allstring = @()
$path1 = "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall"
#Loop Through the apps if name has Adobe and NOT reader
$32apps = Get-ChildItem -Path $path1 | Get-ItemProperty | Select-Object -Property DisplayName, UninstallString

foreach ($32app in $32apps) {
    #Get uninstall string
    $string1 = $32app.uninstallstring
    #Check if it's an MSI install
    if ($string1 -match "^msiexec*") {
        #MSI install, replace the I with an X and make it quiet
        $string2 = $string1 + " /quiet /norestart"
        $string2 = $string2 -replace "/I", "/X "
        #Create custom object with name and string
        $allstring += New-Object -TypeName PSObject -Property @{
            Name   = $32app.DisplayName
            String = $string2
        }
    }
    else {
        #Exe installer, run straight path
        $string2 = $string1
        $allstring += New-Object -TypeName PSObject -Property @{
            Name   = $32app.DisplayName
            String = $string2
        }
    }

}
write-output "32-bit check complete"
write-output "Checking 64-bit System registry"
##Search for 64-bit versions and list them

$path2 = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall"
#Loop Through the apps if name has Adobe and NOT reader
$64apps = Get-ChildItem -Path $path2 | Get-ItemProperty | Select-Object -Property DisplayName, UninstallString

foreach ($64app in $64apps) {
    #Get uninstall string
    $string1 = $64app.uninstallstring
    #Check if it's an MSI install
    if ($string1 -match "^msiexec*") {
        #MSI install, replace the I with an X and make it quiet
        $string2 = $string1 + " /quiet /norestart"
        $string2 = $string2 -replace "/I", "/X "
        #Uninstall with string2 params
        $allstring += New-Object -TypeName PSObject -Property @{
            Name   = $64app.DisplayName
            String = $string2
        }
    }
    else {
        #Exe installer, run straight path
        $string2 = $string1
        $allstring += New-Object -TypeName PSObject -Property @{
            Name   = $64app.DisplayName
            String = $string2
        }
    }

}

write-output "64-bit checks complete"

##USER
write-output "Checking 32-bit User Registry"
##Search for 32-bit versions and list them
$path1 = "HKCU:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall"
##Check if path exists
if (Test-Path $path1) {
    #Loop Through the apps if name has Adobe and NOT reader
    $32apps = Get-ChildItem -Path $path1 | Get-ItemProperty | Select-Object -Property DisplayName, UninstallString

    foreach ($32app in $32apps) {
        #Get uninstall string
        $string1 = $32app.uninstallstring
        #Check if it's an MSI install
        if ($string1 -match "^msiexec*") {
            #MSI install, replace the I with an X and make it quiet
            $string2 = $string1 + " /quiet /norestart"
            $string2 = $string2 -replace "/I", "/X "
            #Create custom object with name and string
            $allstring += New-Object -TypeName PSObject -Property @{
                Name   = $32app.DisplayName
                String = $string2
            }
        }
        else {
            #Exe installer, run straight path
            $string2 = $string1
            $allstring += New-Object -TypeName PSObject -Property @{
                Name   = $32app.DisplayName
                String = $string2
            }
        }
    }
}
write-output "32-bit check complete"
write-output "Checking 64-bit Use registry"
##Search for 64-bit versions and list them

$path2 = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall"
#Loop Through the apps if name has Adobe and NOT reader
$64apps = Get-ChildItem -Path $path2 | Get-ItemProperty | Select-Object -Property DisplayName, UninstallString

foreach ($64app in $64apps) {
    #Get uninstall string
    $string1 = $64app.uninstallstring
    #Check if it's an MSI install
    if ($string1 -match "^msiexec*") {
        #MSI install, replace the I with an X and make it quiet
        $string2 = $string1 + " /quiet /norestart"
        $string2 = $string2 -replace "/I", "/X "
        #Uninstall with string2 params
        $allstring += New-Object -TypeName PSObject -Property @{
            Name   = $64app.DisplayName
            String = $string2
        }
    }
    else {
        #Exe installer, run straight path
        $string2 = $string1
        $allstring += New-Object -TypeName PSObject -Property @{
            Name   = $64app.DisplayName
            String = $string2
        }
    }

}


function UninstallAppFull {

    param (
        [string]$appName
    )

    # Get a list of installed applications from Programs and Features
    $installedApps = Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*,
    HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* |
    Where-Object { $null -ne $_.DisplayName } |
    Select-Object DisplayName, UninstallString

    $userInstalledApps = Get-ItemProperty HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* |
    Where-Object { $null -ne $_.DisplayName } |
    Select-Object DisplayName, UninstallString

    $allInstalledApps = $installedApps + $userInstalledApps | Where-Object { $_.DisplayName -eq "$appName" }

    # Loop through the list of installed applications and uninstall them

    foreach ($app in $allInstalledApps) {
        $uninstallString = $app.UninstallString
        $displayName = $app.DisplayName
        if ($uninstallString -match "^msiexec*") {
            #MSI install, replace the I with an X and make it quiet
            $string2 = $uninstallString + " /quiet /norestart"
            $string2 = $string2 -replace "/I", "/X "
        }
        else {
            #Exe installer, run straight path
            $string2 = $uninstallString
        }
        write-output "Uninstalling: $displayName"
        Start-Process $string2
        write-output "Uninstalled: $displayName" -ForegroundColor Green
    }
}


############################################################################################################
#                                        Remove Manufacturer Bloat                                         #
#                                                                                                          #
############################################################################################################
##Check Manufacturer
write-output "Detecting Manufacturer"
$details = Get-CimInstance -ClassName Win32_ComputerSystem
$manufacturer = $details.Manufacturer

if ($manufacturer -like "*HP*") {
    write-output "HP detected"
    #Remove HP bloat


    ##HP Specific
    $UninstallPrograms = @(
        "Poly Lens"
        "HP Client Security Manager"
        "HP Notifications"
        "HP Security Update Service"
        "HP System Default Settings"
        "HP Wolf Security"
        "HP Wolf Security Application Support for Sure Sense"
        "HP Wolf Security Application Support for Windows"
        "AD2F1837.HPPCHardwareDiagnosticsWindows"
        "AD2F1837.HPPowerManager"
        "AD2F1837.HPPrivacySettings"
        "AD2F1837.HPQuickDrop"
        "AD2F1837.HPSupportAssistant"
        "AD2F1837.HPSystemInformation"
        "AD2F1837.myHP"
        "RealtekSemiconductorCorp.HPAudioControl",
        "HP Sure Recover",
        "HP Sure Run Module"
        "RealtekSemiconductorCorp.HPAudioControl_2.39.280.0_x64__dt26b99r8h8gj"
        "HP Wolf Security - Console"
        "HP Wolf Security Application Support for Chrome 122.0.6261.139"
        "Windows Driver Package - HP Inc. sselam_4_4_2_453 AntiVirus  (11/01/2022 4.4.2.453)"
    )



    $UninstallPrograms = $UninstallPrograms | Where-Object { $appstoignore -notcontains $_ }

    #$HPidentifier = "AD2F1837"

    #$ProvisionedPackages = Get-AppxProvisionedPackage -Online | Where-Object {(($UninstallPrograms -contains $_.DisplayName) -or (($_.DisplayName -like "*$HPidentifier"))-and ($_.DisplayName -notin $WhitelistedApps))}

    #$InstalledPackages = Get-AppxPackage -AllUsers | Where-Object {(($UninstallPrograms -contains $_.Name) -or (($_.Name -like "^$HPidentifier"))-and ($_.Name -notin $WhitelistedApps))}

    $InstalledPrograms = $allstring | Where-Object { $UninstallPrograms -contains $_.Name }
    foreach ($app in $UninstallPrograms) {

        if (Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like $app -ErrorAction SilentlyContinue) {
            Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like $app | Remove-AppxProvisionedPackage -Online
            write-output "Removed provisioned package for $app."
        }
        else {
            write-output "Provisioned package for $app not found."
        }

        if (Get-AppxPackage -allusers -Name $app -ErrorAction SilentlyContinue) {
            Get-AppxPackage -allusers -Name $app | Remove-AppxPackage -AllUsers
            write-output "Removed $app."
        }
        else {
            write-output "$app not found."
        }

        UninstallAppFull -appName $app


    }





    ##Belt and braces, remove via CIM too
    foreach ($program in $UninstallPrograms) {
        Get-CimInstance -Classname Win32_Product | Where-Object Name -Match $program | Invoke-CimMethod -MethodName UnInstall
    }


    #Remove HP Documentation if it exists
    if (test-path -Path "C:\Program Files\HP\Documentation\Doc_uninstall.cmd") {
        Start-Process -FilePath "C:\Program Files\HP\Documentation\Doc_uninstall.cmd" -Wait -passthru -NoNewWindow
    }

    ##Remove HP Connect Optimizer if setup.exe exists
    if (test-path -Path 'C:\Program Files (x86)\InstallShield Installation Information\{6468C4A5-E47E-405F-B675-A70A70983EA6}\setup.exe') {
        invoke-webrequest -uri "https://raw.githubusercontent.com/ehousse/Intune-De-Bloat/main/HPConnOpt.iss" -outfile "C:\Windows\Temp\HPConnOpt.iss"

        &'C:\Program Files (x86)\InstallShield Installation Information\{6468C4A5-E47E-405F-B675-A70A70983EA6}\setup.exe' @('-s', '-f1C:\Windows\Temp\HPConnOpt.iss')
    }
##Remove HP Data Science Stack Manager
if (test-path -Path 'C:\Program Files\HP\Z By HP Data Science Stack Manager\Uninstall Z by HP Data Science Stack Manager.exe') {
    &'C:\Program Files\HP\Z By HP Data Science Stack Manager\Uninstall Z by HP Data Science Stack Manager.exe' @('/allusers', '/S')
}


    ##Remove other crap
    if (Test-Path -Path "C:\Program Files (x86)\HP\Shared" -PathType Container) { Remove-Item -Path "C:\Program Files (x86)\HP\Shared" -Recurse -Force }
    if (Test-Path -Path "C:\Program Files (x86)\Online Services" -PathType Container) { Remove-Item -Path "C:\Program Files (x86)\Online Services" -Recurse -Force }
    if (Test-Path -Path "C:\ProgramData\HP\TCO" -PathType Container) { Remove-Item -Path "C:\ProgramData\HP\TCO" -Recurse -Force }
    if (Test-Path -Path "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Amazon.com.lnk" -PathType Leaf) { Remove-Item -Path "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Amazon.com.lnk" -Force }
    if (Test-Path -Path "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Angebote.lnk" -PathType Leaf) { Remove-Item -Path "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Angebote.lnk" -Force }
    if (Test-Path -Path "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\TCO Certified.lnk" -PathType Leaf) { Remove-Item -Path "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\TCO Certified.lnk" -Force }
    if (Test-Path -Path "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Booking.com.lnk" -PathType Leaf) { Remove-Item -Path "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Booking.com.lnk" -Force }
    if (Test-Path -Path "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Adobe offers.lnk" -PathType Leaf) { Remove-Item -Path "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Adobe offers.lnk" -Force }


    ##Remove Wolf Security
    wmic product where "name='HP Wolf Security'" call uninstall
    wmic product where "name='HP Wolf Security - Console'" call uninstall
    wmic product where "name='HP Security Update Service'" call uninstall

    write-output "Removed HP bloat"
}



if ($manufacturer -like "*Dell*") {
    write-output "Dell detected"
    #Remove Dell bloat

    ##Dell

    $UninstallPrograms = @(
        "Dell Optimizer"
        "Dell Power Manager"
        "DellOptimizerUI"
        "Dell SupportAssist OS Recovery"
        "Dell SupportAssist"
        "Dell Optimizer Service"
        "Dell Optimizer Core"
        "DellInc.PartnerPromo"
        "DellInc.DellOptimizer"
        "DellInc.DellCommandUpdate"
        "DellInc.DellPowerManager"
        "DellInc.DellDigitalDelivery"
        "DellInc.DellSupportAssistforPCs"
        "DellInc.PartnerPromo"
        "Dell Command | Update"
        "Dell Command | Update for Windows Universal"
        "Dell Command | Update for Windows 10"
        "Dell Command | Power Manager"
        "Dell Digital Delivery Service"
        "Dell Digital Delivery"
        "Dell Peripheral Manager"
        "Dell Power Manager Service"
        "Dell SupportAssist Remediation"
        "SupportAssist Recovery Assistant"
        "Dell SupportAssist OS Recovery Plugin for Dell Update"
        "Dell SupportAssistAgent"
        "Dell Update - SupportAssist Update Plugin"
        "Dell Core Services"
        "Dell Pair"
        "Dell Display Manager 2.0"
        "Dell Display Manager 2.1"
        "Dell Display Manager 2.2"
        "Dell SupportAssist Remediation"
        "Dell Update - SupportAssist Update Plugin"
        "DellInc.PartnerPromo"
    )



    $UninstallPrograms = $UninstallPrograms | Where-Object { $appstoignore -notcontains $_ }


    foreach ($app in $UninstallPrograms) {

        if (Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like $app -ErrorAction SilentlyContinue) {
            Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like $app | Remove-AppxProvisionedPackage -Online
            write-output "Removed provisioned package for $app."
        }
        else {
            write-output "Provisioned package for $app not found."
        }

        if (Get-AppxPackage -allusers -Name $app -ErrorAction SilentlyContinue) {
            Get-AppxPackage -allusers -Name $app | Remove-AppxPackage -AllUsers
            write-output "Removed $app."
        }
        else {
            write-output "$app not found."
        }

        UninstallAppFull -appName $app



    }

    ##Belt and braces, remove via CIM too
    foreach ($program in $UninstallPrograms) {
        write-output "Removing $program"
        Get-CimInstance -Query "SELECT * FROM Win32_Product WHERE name = '$program'" | Invoke-CimMethod -MethodName Uninstall
    }

    ##Manual Removals

    ##Dell Optimizer
    $dellSA = Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall, HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall | Get-ItemProperty | Where-Object { $_.DisplayName -like "Dell*Optimizer*Core" } | Select-Object -Property UninstallString

    ForEach ($sa in $dellSA) {
        If ($sa.UninstallString) {
            try {
                cmd.exe /c $sa.UninstallString -silent
            }
            catch {
                Write-Warning "Failed to uninstall Dell Optimizer"
            }
        }
    }


    ##Dell Dell SupportAssist Remediation
    $dellSA = Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall, HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall | Get-ItemProperty | Where-Object { $_.DisplayName -match "Dell SupportAssist Remediation" } | Select-Object -Property QuietUninstallString

    ForEach ($sa in $dellSA) {
        If ($sa.QuietUninstallString) {
            try {
                cmd.exe /c $sa.QuietUninstallString
            }
            catch {
                Write-Warning "Failed to uninstall Dell Support Assist Remediation"
            }
        }
    }

    ##Dell Dell SupportAssist OS Recovery Plugin for Dell Update
    $dellSA = Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall, HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall | Get-ItemProperty | Where-Object { $_.DisplayName -match "Dell SupportAssist OS Recovery Plugin for Dell Update" } | Select-Object -Property QuietUninstallString

    ForEach ($sa in $dellSA) {
        If ($sa.QuietUninstallString) {
            try {
                cmd.exe /c $sa.QuietUninstallString
            }
            catch {
                Write-Warning "Failed to uninstall Dell Support Assist Remediation"
            }
        }
    }



    ##Dell Display Manager
    $dellSA = Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall, HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall | Get-ItemProperty | Where-Object { $_.DisplayName -like "Dell*Display*Manager*" } | Select-Object -Property UninstallString

    ForEach ($sa in $dellSA) {
        If ($sa.UninstallString) {
            try {
                cmd.exe /c $sa.UninstallString /S
            }
            catch {
                Write-Warning "Failed to uninstall Dell Optimizer"
            }
        }
    }

    ##Dell Peripheral Manager

    try {
        start-process c:\windows\system32\cmd.exe '/c "C:\Program Files\Dell\Dell Peripheral Manager\Uninstall.exe" /S'
    }
    catch {
        Write-Warning "Failed to uninstall Dell Optimizer"
    }


    ##Dell Pair

    try {
        start-process c:\windows\system32\cmd.exe '/c "C:\Program Files\Dell\Dell Pair\Uninstall.exe" /S'
    }
    catch {
        Write-Warning "Failed to uninstall Dell Optimizer"
    }

}


if ($manufacturer -like "Lenovo") {
    write-output "Lenovo detected"


    ##Lenovo Specific
    # Function to uninstall applications with .exe uninstall strings

    function UninstallApp {

        param (
            [string]$appName
        )

        # Get a list of installed applications from Programs and Features
        $installedApps = Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*,
        HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* |
        Where-Object { $_.DisplayName -like "*$appName*" }

        # Loop through the list of installed applications and uninstall them

        foreach ($app in $installedApps) {
            $uninstallString = $app.UninstallString
            $displayName = $app.DisplayName
            write-output "Uninstalling: $displayName"
            Start-Process $uninstallString -ArgumentList "/VERYSILENT" -Wait
            write-output "Uninstalled: $displayName" -ForegroundColor Green
        }
    }

    ##Stop Running Processes

    $processnames = @(
        "SmartAppearanceSVC.exe"
        "UDClientService.exe"
        "ModuleCoreService.exe"
        "ProtectedModuleHost.exe"
        "*lenovo*"
        "FaceBeautify.exe"
        "McCSPServiceHost.exe"
        "mcapexe.exe"
        "MfeAVSvc.exe"
        "mcshield.exe"
        "Ammbkproc.exe"
        "AIMeetingManager.exe"
        "DADUpdater.exe"
        "CommercialVantage.exe"
    )

    foreach ($process in $processnames) {
        write-output "Stopping Process $process"
        Get-Process -Name $process | Stop-Process -Force
        write-output "Process $process Stopped"
    }

    $UninstallPrograms = @(
        "E046963F.AIMeetingManager"
        "E0469640.SmartAppearance"
        "MirametrixInc.GlancebyMirametrix"
        "E046963F.LenovoCompanion"
        "E0469640.LenovoUtility"
        "E0469640.LenovoSmartCommunication"
        "E046963F.LenovoSettingsforEnterprise"
        "E046963F.cameraSettings"
        "4505Fortemedia.FMAPOControl2_2.1.37.0_x64__4pejv7q2gmsnr"
        "ElevocTechnologyCo.Ltd.SmartMicrophoneSettings_1.1.49.0_x64__ttaqwwhyt5s6t"
        "Lenovo User Guide"
    )


    $UninstallPrograms = $UninstallPrograms | Where-Object { $appstoignore -notcontains $_ }



    $InstalledPrograms = $allstring | Where-Object { (($_.Name -in $UninstallPrograms)) }


    foreach ($app in $UninstallPrograms) {

        if (Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like $app -ErrorAction SilentlyContinue) {
            Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like $app | Remove-AppxProvisionedPackage -Online
            write-output "Removed provisioned package for $app."
        }
        else {
            write-output "Provisioned package for $app not found."
        }

        if (Get-AppxPackage -allusers -Name $app -ErrorAction SilentlyContinue) {
            Get-AppxPackage -allusers -Name $app | Remove-AppxPackage -AllUsers
            write-output "Removed $app."
        }
        else {
            write-output "$app not found."
        }

        UninstallAppFull -appName $app


    }


    ##Belt and braces, remove via CIM too
    foreach ($program in $UninstallPrograms) {
        Get-CimInstance -Classname Win32_Product | Where-Object Name -Match $program | Invoke-CimMethod -MethodName UnInstall
    }

    # Get Lenovo Vantage service uninstall string to uninstall service
    $lvs = Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*", "HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*" | Where-Object DisplayName -eq "Lenovo Vantage Service"
    if (!([string]::IsNullOrEmpty($lvs.QuietUninstallString))) {
        $uninstall = "cmd /c " + $lvs.QuietUninstallString
        write-output $uninstall
        Invoke-Expression $uninstall
    }

    # Uninstall Lenovo Smart
    UninstallApp -appName "Lenovo Smart"

    # Uninstall Ai Meeting Manager Service
    UninstallApp -appName "Ai Meeting Manager"

    # Uninstall ImController service
    ##Check if exists
    $path = "c:\windows\system32\ImController.InfInstaller.exe"
    if (Test-Path $path) {
        write-output "ImController.InfInstaller.exe exists"
        $uninstall = "cmd /c " + $path + " -uninstall"
        write-output $uninstall
        Invoke-Expression $uninstall
    }
    else {
        write-output "ImController.InfInstaller.exe does not exist"
    }
    ##Invoke-Expression -Command 'cmd.exe /c "c:\windows\system32\ImController.InfInstaller.exe" -uninstall'

    # Remove vantage associated registry keys
    Remove-Item 'HKLM:\SOFTWARE\Policies\Lenovo\E046963F.LenovoCompanion_k1h2ywk1493x8' -Recurse -ErrorAction SilentlyContinue
    Remove-Item 'HKLM:\SOFTWARE\Policies\Lenovo\ImController' -Recurse -ErrorAction SilentlyContinue
    Remove-Item 'HKLM:\SOFTWARE\Policies\Lenovo\Lenovo Vantage' -Recurse -ErrorAction SilentlyContinue
    #Remove-Item 'HKLM:\SOFTWARE\Policies\Lenovo\Commercial Vantage' -Recurse -ErrorAction SilentlyContinue

    # Uninstall AI Meeting Manager Service
    $path = 'C:\Program Files\Lenovo\Ai Meeting Manager Service\unins000.exe'
    $params = "/SILENT"
    if (test-path -Path $path) {
        Start-Process -FilePath $path -ArgumentList $params -Wait
    }


        # Uninstall Lenovo Now
        $path = 'C:\Program Files (x86)\Lenovo\LenovoNow\unins000.exe'
        $params = "/SILENT"
        if (test-path -Path $path) {
            Start-Process -FilePath $path -ArgumentList $params -Wait
        }

    # Uninstall Lenovo Vantage
    $pathname = (Get-ChildItem -Path "C:\Program Files (x86)\Lenovo\VantageService").name
    $path = "C:\Program Files (x86)\Lenovo\VantageService\$pathname\Uninstall.exe"
    $params = '/SILENT'
    if (test-path -Path $path) {
        Start-Process -FilePath $path -ArgumentList $params -Wait
    }

    ##Uninstall Smart Appearance
    $path = 'C:\Program Files\Lenovo\Lenovo Smart Appearance Components\unins000.exe'
    $params = '/SILENT'
    if (test-path -Path $path) {
        try {
            Start-Process -FilePath $path -ArgumentList $params -Wait
        }
        catch {
            Write-Warning "Failed to start the process"
        }
    }
    $lenovowelcome = "c:\program files (x86)\lenovo\lenovowelcome\x86"
    if (Test-Path $lenovowelcome) {
        # Remove Lenovo Now
        Set-Location "c:\program files (x86)\lenovo\lenovowelcome\x86"

        # Update $PSScriptRoot with the new working directory
        $PSScriptRoot = (Get-Item -Path ".\").FullName
        try {
            invoke-expression -command .\uninstall.ps1 -ErrorAction SilentlyContinue
        }
        catch {
            write-output "Failed to execute uninstall.ps1"
        }

        write-output "All applications and associated Lenovo components have been uninstalled." -ForegroundColor Green
    }

    $lenovonow = "c:\program files (x86)\lenovo\LenovoNow\x86"
    if (Test-Path $lenovonow) {
        # Remove Lenovo Now
        Set-Location "c:\program files (x86)\lenovo\LenovoNow\x86"

        # Update $PSScriptRoot with the new working directory
        $PSScriptRoot = (Get-Item -Path ".\").FullName
        try {
            invoke-expression -command .\uninstall.ps1 -ErrorAction SilentlyContinue
        }
        catch {
            write-output "Failed to execute uninstall.ps1"
        }

        write-output "All applications and associated Lenovo components have been uninstalled." -ForegroundColor Green
    }


    $filename = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\User Guide.lnk"

    if (Test-Path $filename) {
        Remove-Item -Path $filename -Force
    }

    ##Camera fix for Lenovo E14
    $model = Get-CimInstance -ClassName Win32_ComputerSystem | Select-Object -ExpandProperty Model
    if ($model -eq "21E30001MY") {
        $keypath = "HKLM:\SOFTWARE\\Microsoft\Windows Media Foundation\Platform"
        $keyname = "EnableFrameServerMode"
        $value = 0
        if (!(Test-Path $keypath)) {
            New-Item -Path $keypath -Force
        }
        Set-ItemProperty -Path $keypath -Name $keyname -Value $value -Type DWord -Force

        $keypath2 = "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows Media Foundation\Platform"
        if (!(Test-Path $keypath2)) {
            New-Item -Path $keypath2 -Force
        }
        Set-ItemProperty -Path $keypath2 -Name $keyname -Value $value -Type DWord -Force
    }


        ##Remove Lenovo theme and background image
        $registryPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes"

        # Check and remove ThemeName if it exists
        if (Get-ItemProperty -Path $registryPath -Name "ThemeName" -ErrorAction SilentlyContinue) {
            Remove-ItemProperty -Path $registryPath -Name "ThemeName"
        }
    
        # Check and remove DesktopBackground if it exists
        if (Get-ItemProperty -Path $registryPath -Name "DesktopBackground" -ErrorAction SilentlyContinue) {
            Remove-ItemProperty -Path $registryPath -Name "DesktopBackground"
        }

}


##Remove bookmarks

##Enumerate all users
$users = Get-ChildItem -Path "C:\Users" -Directory
foreach ($user in $users) {
    $userpath = $user.FullName
    $bookmarks = "C:\Users\$userpath\AppData\Local\Microsoft\Edge\User Data\Default\Bookmarks"
    ##Remove any files if they exist
    foreach ($bookmark in $bookmarks) {
        if (Test-Path -Path $bookmark) {
            Remove-Item -Path $bookmark -Force
        }
    }
}


############################################################################################################
#                                        Remove Any other installed crap                                   #
#                                                                                                          #
############################################################################################################

#McAfee

write-output "Detecting McAfee"
$mcafeeinstalled = "false"
$InstalledSoftware = Get-ChildItem "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall"
foreach ($obj in $InstalledSoftware) {
    $name = $obj.GetValue('DisplayName')
    if ($name -like "*McAfee*") {
        $mcafeeinstalled = "true"
    }
}

$InstalledSoftware32 = Get-ChildItem "HKLM:\Software\WOW6432NODE\Microsoft\Windows\CurrentVersion\Uninstall"
foreach ($obj32 in $InstalledSoftware32) {
    $name32 = $obj32.GetValue('DisplayName')
    if ($name32 -like "*McAfee*") {
        $mcafeeinstalled = "true"
    }
}

if ($mcafeeinstalled -eq "true") {
    write-output "McAfee detected"
    #Remove McAfee bloat
    ##McAfee
    ### Download McAfee Consumer Product Removal Tool ###
    write-output "Downloading McAfee Removal Tool"
    # Download Source
    $URL = 'https://github.com/ehousse/Intune-De-Bloat/raw/main/mcafeeclean.zip'

    # Set Save Directory
    $destination = 'C:\ProgramData\Debloat\mcafee.zip'

    #Download the file
    Invoke-WebRequest -Uri $URL -OutFile $destination -Method Get

    Expand-Archive $destination -DestinationPath "C:\ProgramData\Debloat" -Force

    write-output "Removing McAfee"
    # Automate Removal and kill services
    start-process "C:\ProgramData\Debloat\Mccleanup.exe" -ArgumentList "-p StopServices,MFSY,PEF,MXD,CSP,Sustainability,MOCP,MFP,APPSTATS,Auth,EMproxy,FWdiver,HW,MAS,MAT,MBK,MCPR,McProxy,McSvcHost,VUL,MHN,MNA,MOBK,MPFP,MPFPCU,MPS,SHRED,MPSCU,MQC,MQCCU,MSAD,MSHR,MSK,MSKCU,MWL,NMC,RedirSvc,VS,REMEDIATION,MSC,YAP,TRUEKEY,LAM,PCB,Symlink,SafeConnect,MGS,WMIRemover,RESIDUE -v -s"
    write-output "McAfee Removal Tool has been run"

    ###New MCCleanup
    ### Download McAfee Consumer Product Removal Tool ###
    write-output "Downloading McAfee Removal Tool"
    # Download Source
    $URL = 'https://github.com/ehousse/Intune-De-Bloat/raw/main/mccleanup.zip'

    # Set Save Directory
    $destination = 'C:\ProgramData\Debloat\mcafeenew.zip'

    #Download the file
    Invoke-WebRequest -Uri $URL -OutFile $destination -Method Get

    New-Item -Path "C:\ProgramData\Debloat\mcnew" -ItemType Directory
    Expand-Archive $destination -DestinationPath "C:\ProgramData\Debloat\mcnew" -Force

    write-output "Removing McAfee"
    # Automate Removal and kill services
    start-process "C:\ProgramData\Debloat\mcnew\Mccleanup.exe" -ArgumentList "-p StopServices,MFSY,PEF,MXD,CSP,Sustainability,MOCP,MFP,APPSTATS,Auth,EMproxy,FWdiver,HW,MAS,MAT,MBK,MCPR,McProxy,McSvcHost,VUL,MHN,MNA,MOBK,MPFP,MPFPCU,MPS,SHRED,MPSCU,MQC,MQCCU,MSAD,MSHR,MSK,MSKCU,MWL,NMC,RedirSvc,VS,REMEDIATION,MSC,YAP,TRUEKEY,LAM,PCB,Symlink,SafeConnect,MGS,WMIRemover,RESIDUE -v -s"
    write-output "McAfee Removal Tool has been run"

    $InstalledPrograms = $allstring | Where-Object { ($_.Name -like "*McAfee*") }
    $InstalledPrograms | ForEach-Object {

        write-output "Attempting to uninstall: [$($_.Name)]..."
        $uninstallcommand = $_.String

        Try {
            if ($uninstallcommand -match "^msiexec*") {
                #Remove msiexec as we need to split for the uninstall
                $uninstallcommand = $uninstallcommand -replace "msiexec.exe", ""
                $uninstallcommand = $uninstallcommand + " /quiet /norestart"
                $uninstallcommand = $uninstallcommand -replace "/I", "/X "
                #Uninstall with string2 params
                Start-Process 'msiexec.exe' -ArgumentList $uninstallcommand -NoNewWindow -Wait
            }
            else {
                #Exe installer, run straight path
                $string2 = $uninstallcommand
                start-process $string2
            }
            #$A = Start-Process -FilePath $uninstallcommand -Wait -passthru -NoNewWindow;$a.ExitCode
            #$Null = $_ | Uninstall-Package -AllVersions -Force -ErrorAction Stop
            write-output "Successfully uninstalled: [$($_.Name)]"
        }
        Catch { Write-Warning -Message "Failed to uninstall: [$($_.Name)]" }
    }

    ##Remove Safeconnect
    $safeconnects = Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall, HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall | Get-ItemProperty | Where-Object { $_.DisplayName -match "McAfee Safe Connect" } | Select-Object -Property UninstallString

    ForEach ($sc in $safeconnects) {
        If ($sc.UninstallString) {
            cmd.exe /c $sc.UninstallString /quiet /norestart
        }
    }

    ##
    ##remove some extra leftover Mcafee items from StartMenu-AllApps and uninstall registry keys
    ##
    if (Test-Path -Path "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\McAfee") {
        Remove-Item -Path "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\McAfee" -Recurse -Force
    }
    if (Test-Path -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\McAfee.WPS") {
        Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\McAfee.WPS" -Recurse -Force
    }
    #Interesting emough, this producese an error, but still deletes the package anyway
    get-appxprovisionedpackage -online | sort-object displayname | format-table displayname, packagename
    get-appxpackage -allusers | sort-object name | format-table name, packagefullname
    Get-AppxProvisionedPackage -Online | Where-Object DisplayName -eq "McAfeeWPSSparsePackage" | Remove-AppxProvisionedPackage -Online -AllUsers
}


##Look for anything else

##Make sure Intune hasn't installed anything so we don't remove installed apps

$intunepath = "HKLM:\SOFTWARE\Microsoft\IntuneManagementExtension\Win32Apps"
$intunecomplete = @(Get-ChildItem $intunepath).count
$userpath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList"
$userprofiles = Get-ChildItem $userpath | Get-ItemProperty

$nonAdminLoggedOn = $false
foreach ($user in $userprofiles) {
    # Exclude default, system, and network service profiles, and the Administrator profile
    if ($user.PSChildName -notin '.DEFAULT', 'S-1-5-18', 'S-1-5-19', 'S-1-5-20' -and $user.PSChildName -notmatch 'S-1-5-21-\d+-\d+-\d+-500') {
        $nonAdminLoggedOn = $true
        break
    }
}
$TypeDef = @"
 
using System;
using System.Text;
using System.Collections.Generic;
using System.Runtime.InteropServices;
 
namespace Api
{
 public class Kernel32
 {
   [DllImport("kernel32.dll", CharSet = CharSet.Auto, SetLastError = true)]
   public static extern int OOBEComplete(ref int bIsOOBEComplete);
 }
}
"@
 
Add-Type -TypeDefinition $TypeDef -Language CSharp
 
$IsOOBEComplete = $false
$hr = [Api.Kernel32]::OOBEComplete([ref] $IsOOBEComplete)
 

if ($IsOOBEComplete -eq 0) {

    write-output "Still in OOBE, continue"
    ##Apps to remove - NOTE: Chrome has an unusual uninstall so sort on it's own
    $blacklistapps = @(

    )


    foreach ($blacklist in $blacklistapps) {

        UninstallAppFull -appName $blacklist

    }


    ##Remove Chrome
    # $chrome32path = "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Google Chrome"

    # if ($null -ne $chrome32path) {

        # $versions = (Get-ItemProperty -path 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Google Chrome').version
        # ForEach ($version in $versions) {
            # write-output "Found Chrome version $version"
            # $directory = ${env:ProgramFiles(x86)}
            # write-output "Removing Chrome"
            # Start-Process "$directory\Google\Chrome\Application\$version\Installer\setup.exe" -argumentlist  "--uninstall --multi-install --chrome --system-level --force-uninstall"
        # }

    # }

    # $chromepath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Google Chrome"

    # if ($null -ne $chromepath) {

        # $versions = (Get-ItemProperty -path 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Google Chrome').version
        # ForEach ($version in $versions) {
            # write-output "Found Chrome version $version"
            # $directory = ${env:ProgramFiles}
            # write-output "Removing Chrome"
            # Start-Process "$directory\Google\Chrome\Application\$version\Installer\setup.exe" -argumentlist  "--uninstall --multi-install --chrome --system-level --force-uninstall"
        # }


    # }
$xml = @"
<Configuration>
  <Display Level="None" AcceptEULA="True" />
  <Property Name="FORCEAPPSHUTDOWN" Value="True" />
  <Remove>
    <Product ID="O365HomePremRetail"/>
    <Product ID="OneNoteFreeRetail"/>
  </Remove>
</Configuration>
"@

##write XML to the debloat folder
$xml | Out-File -FilePath "C:\ProgramData\Debloat\o365.xml"

##Download the ODT
$odturl = "https://github.com/ehousse/Intune-De-Bloat/raw/main/odt.exe"
$odtdestination = "C:\ProgramData\Debloat\odt.exe"
Invoke-WebRequest -Uri $odturl -OutFile $odtdestination -Method Get -UseBasicParsing

##Run it
Start-Process -FilePath "C:\ProgramData\Debloat\odt.exe" -ArgumentList "/configure C:\ProgramData\Debloat\o365.xml" -Wait

}
else {
    write-output "Intune detected, skipping removal of apps"
    write-output "$intunecomplete number of apps detected"

}

write-output "Completed"

Stop-Transcript
# SIG # Begin signature block
# MIImwwYJKoZIhvcNAQcCoIImtDCCJrACAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUgmBWPGFmVGAnMcTp7Z/qjJ48
# jQyggiANMIIFjTCCBHWgAwIBAgIQDpsYjvnQLefv21DiCEAYWjANBgkqhkiG9w0B
# AQwFADBlMQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMRkwFwYD
# VQQLExB3d3cuZGlnaWNlcnQuY29tMSQwIgYDVQQDExtEaWdpQ2VydCBBc3N1cmVk
# IElEIFJvb3QgQ0EwHhcNMjIwODAxMDAwMDAwWhcNMzExMTA5MjM1OTU5WjBiMQsw
# CQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMRkwFwYDVQQLExB3d3cu
# ZGlnaWNlcnQuY29tMSEwHwYDVQQDExhEaWdpQ2VydCBUcnVzdGVkIFJvb3QgRzQw
# ggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQC/5pBzaN675F1KPDAiMGkz
# 7MKnJS7JIT3yithZwuEppz1Yq3aaza57G4QNxDAf8xukOBbrVsaXbR2rsnnyyhHS
# 5F/WBTxSD1Ifxp4VpX6+n6lXFllVcq9ok3DCsrp1mWpzMpTREEQQLt+C8weE5nQ7
# bXHiLQwb7iDVySAdYyktzuxeTsiT+CFhmzTrBcZe7FsavOvJz82sNEBfsXpm7nfI
# SKhmV1efVFiODCu3T6cw2Vbuyntd463JT17lNecxy9qTXtyOj4DatpGYQJB5w3jH
# trHEtWoYOAMQjdjUN6QuBX2I9YI+EJFwq1WCQTLX2wRzKm6RAXwhTNS8rhsDdV14
# Ztk6MUSaM0C/CNdaSaTC5qmgZ92kJ7yhTzm1EVgX9yRcRo9k98FpiHaYdj1ZXUJ2
# h4mXaXpI8OCiEhtmmnTK3kse5w5jrubU75KSOp493ADkRSWJtppEGSt+wJS00mFt
# 6zPZxd9LBADMfRyVw4/3IbKyEbe7f/LVjHAsQWCqsWMYRJUadmJ+9oCw++hkpjPR
# iQfhvbfmQ6QYuKZ3AeEPlAwhHbJUKSWJbOUOUlFHdL4mrLZBdd56rF+NP8m800ER
# ElvlEFDrMcXKchYiCd98THU/Y+whX8QgUWtvsauGi0/C1kVfnSD8oR7FwI+isX4K
# Jpn15GkvmB0t9dmpsh3lGwIDAQABo4IBOjCCATYwDwYDVR0TAQH/BAUwAwEB/zAd
# BgNVHQ4EFgQU7NfjgtJxXWRM3y5nP+e6mK4cD08wHwYDVR0jBBgwFoAUReuir/SS
# y4IxLVGLp6chnfNtyA8wDgYDVR0PAQH/BAQDAgGGMHkGCCsGAQUFBwEBBG0wazAk
# BggrBgEFBQcwAYYYaHR0cDovL29jc3AuZGlnaWNlcnQuY29tMEMGCCsGAQUFBzAC
# hjdodHRwOi8vY2FjZXJ0cy5kaWdpY2VydC5jb20vRGlnaUNlcnRBc3N1cmVkSURS
# b290Q0EuY3J0MEUGA1UdHwQ+MDwwOqA4oDaGNGh0dHA6Ly9jcmwzLmRpZ2ljZXJ0
# LmNvbS9EaWdpQ2VydEFzc3VyZWRJRFJvb3RDQS5jcmwwEQYDVR0gBAowCDAGBgRV
# HSAAMA0GCSqGSIb3DQEBDAUAA4IBAQBwoL9DXFXnOF+go3QbPbYW1/e/Vwe9mqyh
# hyzshV6pGrsi+IcaaVQi7aSId229GhT0E0p6Ly23OO/0/4C5+KH38nLeJLxSA8hO
# 0Cre+i1Wz/n096wwepqLsl7Uz9FDRJtDIeuWcqFItJnLnU+nBgMTdydE1Od/6Fmo
# 8L8vC6bp8jQ87PcDx4eo0kxAGTVGamlUsLihVo7spNU96LHc/RzY9HdaXFSMb++h
# UD38dglohJ9vytsgjTVgHAIDyyCwrFigDkBjxZgiwbJZ9VVrzyerbHbObyMt9H5x
# aiNrIv8SuFQtJ37YOtnwtoeW/VvRXKwYw02fc7cBqZ9Xql4o4rmUMIIGRDCCBCyg
# AwIBAgITFgAAAAbBoJtqsm+c+gAAAAAABjANBgkqhkiG9w0BAQsFADAXMRUwEwYD
# VQQDEwxEQlJJIFJvb3QgQ0EwHhcNMTcwODE3MTgxNjU3WhcNMjcwODE3MTgyNjU3
# WjBEMRUwEwYKCZImiZPyLGQBGRYFTE9DQUwxFDASBgoJkiaJk/IsZAEZFgREQlJJ
# MRUwEwYDVQQDEwxEQlJJIFNVQiBDQTEwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAw
# ggIKAoICAQCvYJlELsr2zWhL5tEnW4ze9qP8KnTp7EtKuheC42fsK1jsbpihZo0A
# pOxzwHXwNgkrBQS9JDVA1C2PVPqND1bk6SP9D176EpGwRhnKSIv+kSw9vje7RUey
# L3b4HFG57nizA5STSZ2ZaJCzHyqjQZUm7P9IFqVnJIXKO6FJ05qZbScToXrXdm8z
# U5mW+y2ZwVkA4g4NivYnHSJbokbMV3KOFCy7VU5RkzcOoXlgaNcVRn6TQt5gfen5
# N1T3hwaR2fn6c+cXQAzHyq4f98DVfj6h03n/Uz53FNCGlpoSDi7TGsLRdJYbfWmY
# 5/Jl/UekYKfYeyGBOW8RTgUj22bX1MgAetXxZ6E/nwrCXoxN35zqeKQ3kapyS99E
# GVYPiXj2Hq3/3e5lWUPwhTF2Jr5qryvlrrmnCivjllglw60cUYduiZ1wAq2d35v/
# B3404i+uqXtNjfnjr3kvWd5E1UCH639oGjTHu/NsMbjpa46u7c03Fkpuaq1hHcRq
# hT77NV+jU9GvAi2p0rZjDyDhkQfJlGaAxPaZgPT0OYLif1FwyKIFUn2tktSDE5+g
# u2KFuUHLN/hg/oJHNK3fOgn9hj7qZQdaT7Jc7jNgRAhsiV/WRYQzqcKl6s5SydVz
# sagbp3XohaVeDOctF3Sd6/W507TZyOY0riWq8jWZ1teHRNqY68tvAwIDAQABo4IB
# WjCCAVYwEgYJKwYBBAGCNxUBBAUCAwIAAjAjBgkrBgEEAYI3FQIEFgQUkTRXrqMA
# 3OxGCJ/dYGfHLmFzbiIwHQYDVR0OBBYEFGUYpvmNd5j9Ux6vBjJ9FsHcTb9RMBkG
# CSsGAQQBgjcUAgQMHgoAUwB1AGIAQwBBMAsGA1UdDwQEAwIBhjAPBgNVHRMBAf8E
# BTADAQH/MB8GA1UdIwQYMBaAFJFVtev9XLM0erDcn8asKbfvvrFYMEUGA1UdHwQ+
# MDwwOqA4oDaGNGh0dHA6Ly9yaXN1YmNhcDEuZGJyaS5sb2NhbC9wa2kvREJSSSUy
# MFJvb3QlMjBDQS5jcmwwWwYIKwYBBQUHAQEETzBNMEsGCCsGAQUFBzAChj9odHRw
# Oi8vcmlzdWJjYXAxLmRicmkubG9jYWwvcGtpL1JJUk9PVENBUDFfREJSSSUyMFJv
# b3QlMjBDQS5jcnQwDQYJKoZIhvcNAQELBQADggIBAB6Q8Ao40pxZCiRJC0XLDHcG
# WWbY5emUfrmcIzeyNarB4BoOC4ffdmi5MgVMlLkgbeBmuolrRtczs2oaeYsXpa6D
# BbCmONE8W9GWUVOpi2z1/hAefWW0S+7cnOi5DIweSbX8sQmFAZ4DZ6koysFz9j7D
# eFMR+spaAQpsS4Odyh+IbyjqlrSC8ou9mrkLXcOulzd0l1PKctahQ6Zzzi5PIysz
# fvlO6WTK+lyzkcgxZzbKa8m4/tXUFJwCqJAX9tX5gDbvq4g2c3m6CJrT/8FvPv4c
# jww97Li8LbdFggmFJyXsQdrPL/iD5kSMaZpaSkwexfR5X5QJY+4duPh59LFpNomL
# VkZHXdfGw7VWQvv3uo2inGMhPTXQ6PDTXz+c/g8AP8MQzLZDluCFYe6NOGkMYc0O
# /nwAMKBcG4gHqFSx993EV2FQhkWCUPrJL7j/4fwRVKG5cJSKOESRAP+oyqcrMc2a
# UlVAeLNNyPsvOEdkJo0Eo0V7VRkcGboBKCVBORFla3FJ6lvWDLakzL6AzsFkMjLM
# Ig6WUnpyDEKvT7jYm+3iECf3J2ristjMyhsVio2JJ2/Rclg/16Pew06bpL+aSPfu
# 6UhEeowbsvEl2BOKmAgM2GB0zGFuaPqX4/8ZrSXslivxxqL5MwccxB/Bb1jnENqA
# ApzK9JViGC1WTE7bC2bqMIIGrjCCBJagAwIBAgIQBzY3tyRUfNhHrP0oZipeWzAN
# BgkqhkiG9w0BAQsFADBiMQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQg
# SW5jMRkwFwYDVQQLExB3d3cuZGlnaWNlcnQuY29tMSEwHwYDVQQDExhEaWdpQ2Vy
# dCBUcnVzdGVkIFJvb3QgRzQwHhcNMjIwMzIzMDAwMDAwWhcNMzcwMzIyMjM1OTU5
# WjBjMQswCQYDVQQGEwJVUzEXMBUGA1UEChMORGlnaUNlcnQsIEluYy4xOzA5BgNV
# BAMTMkRpZ2lDZXJ0IFRydXN0ZWQgRzQgUlNBNDA5NiBTSEEyNTYgVGltZVN0YW1w
# aW5nIENBMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAxoY1BkmzwT1y
# SVFVxyUDxPKRN6mXUaHW0oPRnkyibaCwzIP5WvYRoUQVQl+kiPNo+n3znIkLf50f
# ng8zH1ATCyZzlm34V6gCff1DtITaEfFzsbPuK4CEiiIY3+vaPcQXf6sZKz5C3GeO
# 6lE98NZW1OcoLevTsbV15x8GZY2UKdPZ7Gnf2ZCHRgB720RBidx8ald68Dd5n12s
# y+iEZLRS8nZH92GDGd1ftFQLIWhuNyG7QKxfst5Kfc71ORJn7w6lY2zkpsUdzTYN
# XNXmG6jBZHRAp8ByxbpOH7G1WE15/tePc5OsLDnipUjW8LAxE6lXKZYnLvWHpo9O
# dhVVJnCYJn+gGkcgQ+NDY4B7dW4nJZCYOjgRs/b2nuY7W+yB3iIU2YIqx5K/oN7j
# PqJz+ucfWmyU8lKVEStYdEAoq3NDzt9KoRxrOMUp88qqlnNCaJ+2RrOdOqPVA+C/
# 8KI8ykLcGEh/FDTP0kyr75s9/g64ZCr6dSgkQe1CvwWcZklSUPRR8zZJTYsg0ixX
# NXkrqPNFYLwjjVj33GHek/45wPmyMKVM1+mYSlg+0wOI/rOP015LdhJRk8mMDDtb
# iiKowSYI+RQQEgN9XyO7ZONj4KbhPvbCdLI/Hgl27KtdRnXiYKNYCQEoAA6EVO7O
# 6V3IXjASvUaetdN2udIOa5kM0jO0zbECAwEAAaOCAV0wggFZMBIGA1UdEwEB/wQI
# MAYBAf8CAQAwHQYDVR0OBBYEFLoW2W1NhS9zKXaaL3WMaiCPnshvMB8GA1UdIwQY
# MBaAFOzX44LScV1kTN8uZz/nupiuHA9PMA4GA1UdDwEB/wQEAwIBhjATBgNVHSUE
# DDAKBggrBgEFBQcDCDB3BggrBgEFBQcBAQRrMGkwJAYIKwYBBQUHMAGGGGh0dHA6
# Ly9vY3NwLmRpZ2ljZXJ0LmNvbTBBBggrBgEFBQcwAoY1aHR0cDovL2NhY2VydHMu
# ZGlnaWNlcnQuY29tL0RpZ2lDZXJ0VHJ1c3RlZFJvb3RHNC5jcnQwQwYDVR0fBDww
# OjA4oDagNIYyaHR0cDovL2NybDMuZGlnaWNlcnQuY29tL0RpZ2lDZXJ0VHJ1c3Rl
# ZFJvb3RHNC5jcmwwIAYDVR0gBBkwFzAIBgZngQwBBAIwCwYJYIZIAYb9bAcBMA0G
# CSqGSIb3DQEBCwUAA4ICAQB9WY7Ak7ZvmKlEIgF+ZtbYIULhsBguEE0TzzBTzr8Y
# +8dQXeJLKftwig2qKWn8acHPHQfpPmDI2AvlXFvXbYf6hCAlNDFnzbYSlm/EUExi
# HQwIgqgWvalWzxVzjQEiJc6VaT9Hd/tydBTX/6tPiix6q4XNQ1/tYLaqT5Fmniye
# 4Iqs5f2MvGQmh2ySvZ180HAKfO+ovHVPulr3qRCyXen/KFSJ8NWKcXZl2szwcqMj
# +sAngkSumScbqyQeJsG33irr9p6xeZmBo1aGqwpFyd/EjaDnmPv7pp1yr8THwcFq
# cdnGE4AJxLafzYeHJLtPo0m5d2aR8XKc6UsCUqc3fpNTrDsdCEkPlM05et3/JWOZ
# Jyw9P2un8WbDQc1PtkCbISFA0LcTJM3cHXg65J6t5TRxktcma+Q4c6umAU+9Pzt4
# rUyt+8SVe+0KXzM5h0F4ejjpnOHdI/0dKNPH+ejxmF/7K9h+8kaddSweJywm228V
# ex4Ziza4k9Tm8heZWcpw8De/mADfIBZPJ/tgZxahZrrdVcA6KYawmKAr7ZVBtzrV
# FZgxtGIJDwq9gdkT/r+k0fNX2bwE+oLeMt8EifAAzV3C+dAjfwAL5HYCJtnwZXZC
# pimHCUcr5n8apIUP/JiW9lVUKx+A+sDyDivl1vupL0QVSucTDh3bNzgaoSv27dZ8
# /DCCBrwwggSkoAMCAQICEAuuZrxaun+Vh8b56QTjMwQwDQYJKoZIhvcNAQELBQAw
# YzELMAkGA1UEBhMCVVMxFzAVBgNVBAoTDkRpZ2lDZXJ0LCBJbmMuMTswOQYDVQQD
# EzJEaWdpQ2VydCBUcnVzdGVkIEc0IFJTQTQwOTYgU0hBMjU2IFRpbWVTdGFtcGlu
# ZyBDQTAeFw0yNDA5MjYwMDAwMDBaFw0zNTExMjUyMzU5NTlaMEIxCzAJBgNVBAYT
# AlVTMREwDwYDVQQKEwhEaWdpQ2VydDEgMB4GA1UEAxMXRGlnaUNlcnQgVGltZXN0
# YW1wIDIwMjQwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQC+anOf9pUh
# q5Ywultt5lmjtej9kR8YxIg7apnjpcH9CjAgQxK+CMR0Rne/i+utMeV5bUlYYSuu
# M4vQngvQepVHVzNLO9RDnEXvPghCaft0djvKKO+hDu6ObS7rJcXa/UKvNminKQPT
# v/1+kBPgHGlP28mgmoCw/xi6FG9+Un1h4eN6zh926SxMe6We2r1Z6VFZj75MU/HN
# mtsgtFjKfITLutLWUdAoWle+jYZ49+wxGE1/UXjWfISDmHuI5e/6+NfQrxGFSKx+
# rDdNMsePW6FLrphfYtk/FLihp/feun0eV+pIF496OVh4R1TvjQYpAztJpVIfdNsE
# vxHofBf1BWkadc+Up0Th8EifkEEWdX4rA/FE1Q0rqViTbLVZIqi6viEk3RIySho1
# XyHLIAOJfXG5PEppc3XYeBH7xa6VTZ3rOHNeiYnY+V4j1XbJ+Z9dI8ZhqcaDHOoj
# 5KGg4YuiYx3eYm33aebsyF6eD9MF5IDbPgjvwmnAalNEeJPvIeoGJXaeBQjIK13S
# lnzODdLtuThALhGtyconcVuPI8AaiCaiJnfdzUcb3dWnqUnjXkRFwLtsVAxFvGqs
# xUA2Jq/WTjbnNjIUzIs3ITVC6VBKAOlb2u29Vwgfta8b2ypi6n2PzP0nVepsFk8n
# lcuWfyZLzBaZ0MucEdeBiXL+nUOGhCjl+QIDAQABo4IBizCCAYcwDgYDVR0PAQH/
# BAQDAgeAMAwGA1UdEwEB/wQCMAAwFgYDVR0lAQH/BAwwCgYIKwYBBQUHAwgwIAYD
# VR0gBBkwFzAIBgZngQwBBAIwCwYJYIZIAYb9bAcBMB8GA1UdIwQYMBaAFLoW2W1N
# hS9zKXaaL3WMaiCPnshvMB0GA1UdDgQWBBSfVywDdw4oFZBmpWNe7k+SH3agWzBa
# BgNVHR8EUzBRME+gTaBLhklodHRwOi8vY3JsMy5kaWdpY2VydC5jb20vRGlnaUNl
# cnRUcnVzdGVkRzRSU0E0MDk2U0hBMjU2VGltZVN0YW1waW5nQ0EuY3JsMIGQBggr
# BgEFBQcBAQSBgzCBgDAkBggrBgEFBQcwAYYYaHR0cDovL29jc3AuZGlnaWNlcnQu
# Y29tMFgGCCsGAQUFBzAChkxodHRwOi8vY2FjZXJ0cy5kaWdpY2VydC5jb20vRGln
# aUNlcnRUcnVzdGVkRzRSU0E0MDk2U0hBMjU2VGltZVN0YW1waW5nQ0EuY3J0MA0G
# CSqGSIb3DQEBCwUAA4ICAQA9rR4fdplb4ziEEkfZQ5H2EdubTggd0ShPz9Pce4FL
# Jl6reNKLkZd5Y/vEIqFWKt4oKcKz7wZmXa5VgW9B76k9NJxUl4JlKwyjUkKhk3aY
# x7D8vi2mpU1tKlY71AYXB8wTLrQeh83pXnWwwsxc1Mt+FWqz57yFq6laICtKjPIC
# YYf/qgxACHTvypGHrC8k1TqCeHk6u4I/VBQC9VK7iSpU5wlWjNlHlFFv/M93748Y
# TeoXU/fFa9hWJQkuzG2+B7+bMDvmgF8VlJt1qQcl7YFUMYgZU1WM6nyw23vT6QSg
# wX5Pq2m0xQ2V6FJHu8z4LXe/371k5QrN9FQBhLLISZi2yemW0P8ZZfx4zvSWzVXp
# Ab9k4Hpvpi6bUe8iK6WonUSV6yPlMwerwJZP/Gtbu3CKldMnn+LmmRTkTXpFIEB0
# 6nXZrDwhCGED+8RsWQSIXZpuG4WLFQOhtloDRWGoCwwc6ZpPddOFkM2LlTbMcqFS
# zm4cd0boGhBq7vkqI1uHRz6Fq1IX7TaRQuR+0BGOzISkcqwXu7nMpFu3mgrlgbAW
# +BzikRVQ3K2YHcGkiKjA4gi4OA/kz1YCsdhIBHXqBzR0/Zd2QwQ/l4Gxftt/8wY3
# grcc/nS//TVkej9nmUYu83BDtccHHXKibMs/yXHhDXNkoPIdynhVAku7aRZOwqw6
# pDCCBr4wggSmoAMCAQICE1sAAK2/qm0XXVtmUJYAAgAArb8wDQYJKoZIhvcNAQEL
# BQAwRDEVMBMGCgmSJomT8ixkARkWBUxPQ0FMMRQwEgYKCZImiZPyLGQBGRYEREJS
# STEVMBMGA1UEAxMMREJSSSBTVUIgQ0ExMB4XDTIzMTIxMTE5NTUyMVoXDTI1MTIx
# MDE5NTUyMVowcjELMAkGA1UEBhMCQ0ExEDAOBgNVBAgTB09udGFyaW8xETAPBgNV
# BAcTCEhhbWlsdG9uMQ0wCwYDVQQKEwRQSFJJMQwwCgYDVQQLEwNJQ1QxITAfBgNV
# BAMTGFBIUkkgSW50dW5lIENvZGUtU2lnbmluZzCCAiIwDQYJKoZIhvcNAQEBBQAD
# ggIPADCCAgoCggIBANEW/M0orU4ZTgER01JO7bLFrFzLJZGHBrpA9qjA3ZCed6qJ
# cht7a9Z3IFUtd2OV8allEP/YsPIG6QSfI5sq/VwiHeU/dgyVquNG44Zpzm0kW7Lt
# xJRPQuNBUM/HXqAjVBynnx6+9P9f3bj/E+E9sEzWL3PJEEMVzMqQSiSznrZk6K15
# +vd4twn5yJYS7Vv3Pi6vEO0/QLH+pVFMoeizjksCWc1xarWvFSQuGvpBRrvvlvC1
# FDlHBjplNGYFm+3PrRaxel+FQy50t8vxN34wOq0fG8fjq0QSbXl2H7MMoDFqNYbt
# 61qsaFPweh9dvkyUiyNYTZis0EiDWAWvfW8VvYcWxvO0VVh+Fu4p45mUhfEuvsV/
# Tml0Bh8pTwGD7oZwDBbKszHrUR75iKEii9CJiql4CMhi/rRMKxchMKDW3p8mm7pv
# 1h3vvLflwu2dKrbEIyJXmLW7RccqLt145P9CGUjFia4G4ahbBxypUnK01839EL2h
# qqDUi3NsLfXbysbnGp108gFrdrbnmaCQxxaY0WRNQB54PtWq31fymi/mo12OYy8R
# Bx8oU2k0JYrcVDBUukwaxXwxwGXjdB/Vs67TifFJf7x5bNHbvVShohN7jDno6UYZ
# swJaxmY3rDtPcPc9Rk6N298s9U3MoM/TKyV3XK3VdLasW1SyimAvBgIeIJcFAgMB
# AAGjggF5MIIBdTAdBgNVHQ4EFgQUraLRpzPyjAPZM31DQpjf31enxhIwHwYDVR0j
# BBgwFoAUZRim+Y13mP1THq8GMn0WwdxNv1EwSAYDVR0fBEEwPzA9oDugOYY3aHR0
# cDovL3Jpc3ViY2FwMS5kYnJpLmxvY2FsL3BraS9EQlJJJTIwU1VCJTIwQ0ExKDIp
# LmNybDBoBggrBgEFBQcBAQRcMFowWAYIKwYBBQUHMAKGTGh0dHA6Ly9yaXN1YmNh
# cDEuZGJyaS5sb2NhbC9wa2kvUklTVUJDQVAxLkRCUkkuTE9DQUxfREJSSSUyMFNV
# QiUyMENBMSgyKS5jcnQwDgYDVR0PAQH/BAQDAgeAMD0GCSsGAQQBgjcVBwQwMC4G
# JisGAQQBgjcVCIHL9wuD1uVQh52HBoW2yTGBuYlJMYba2VqC2uRbAgFkAgELMBMG
# A1UdJQQMMAoGCCsGAQUFBwMDMBsGCSsGAQQBgjcVCgQOMAwwCgYIKwYBBQUHAwMw
# DQYJKoZIhvcNAQELBQADggIBAASrlGmZDkknXDA2CIbzFx74H/FHGCco93UzLwp2
# i9hRbtC6s+byH9AhRHCdexY6FXlftY5zoVzx6IDBnbpq/5sxuX0h4FfPreRGTxJh
# 2XfC+rjPE5vREI6wy0xpTcsUis1itqOJCEchbw+yHpTzYTmMfu63hLDWAk+Vkd34
# 9fKHHKiOWCjVHfLbEgsLPpaqemWvOAZmkwILyi7Nw1N0P/fRNEflsZVtAu4J3ahh
# GboyhqVej1mPuSHV0YckAwhg7d//bzYr8U466L7LSSOZIA6N+4Ns6B3l5M6VsCSV
# f0ZZEMKBh5xYIRg7eRez1M5DYl/Uv+0bkaS6/OzgQwpL+aL8dHgGbg1a5L5kqzgb
# /rkXELvlatKL++BaRnEkzxkoQkSc7FvNVrJiIQpErQlCdD8JCJpgLC/18CrRezsk
# 0iM54DXSWkonibyWYqR5lKdx7xQ4JpzkR1En6nY6NDVlQLXIf1tj1PykOzau4YGU
# 2WzubNaHGKJl05YYnhWQjLr7v4u7gE4oCf/gPnIMjoqYQwTIgd9i+M/ur0q2dQoE
# lK6eF82/t6g2WHenvj8QVsEF9nWkreOLm8Xwv3xNGhfF/iS7UN1jtVFrVeOssagF
# esloAPkvOoawdll2Hh6p+Sk0GOnhvcPGys9iT6zSsCYHK/u17q6cdSvRm8IjfVj3
# TnKoMYIGIDCCBhwCAQEwWzBEMRUwEwYKCZImiZPyLGQBGRYFTE9DQUwxFDASBgoJ
# kiaJk/IsZAEZFgREQlJJMRUwEwYDVQQDEwxEQlJJIFNVQiBDQTECE1sAAK2/qm0X
# XVtmUJYAAgAArb8wCQYFKw4DAhoFAKB4MBgGCisGAQQBgjcCAQwxCjAIoAKAAKEC
# gAAwGQYJKoZIhvcNAQkDMQwGCisGAQQBgjcCAQQwHAYKKwYBBAGCNwIBCzEOMAwG
# CisGAQQBgjcCARUwIwYJKoZIhvcNAQkEMRYEFLU6nQVhPQH5tRIt/U4pKgnQAgLZ
# MA0GCSqGSIb3DQEBAQUABIICAAYSJU2ART1YSGIpI6sedqsTUatLVNkFzoIJwCHH
# rGBiuuilMB86RnAUeaqFdHOqxmwFF/WT1X5p3s3x5iwHVMtBhhTgprJHKYOhVXz/
# g/PNUDNtOdh+YfpjBXWlkVQRvH5ODxRdgnjcpH9fw8Vd/Y9+iUgF5UwJppt2d6KS
# xYxmd5AS3ROr+SfAEulp0D/Xq79N8YWdNEj32Ox+22nzsggh2qQvF7h6OeTYrDjv
# /Zu3aqu+QdCT1QM5T6PqyqEcDVnRiuxggEB2Jwax1uaTDMT+VNqaT4VFo69pXKRo
# R1rklJ3r1m9G4ztWWVCvkOZ8/r7XhlLpzLLWIFB+AMqoaecDiTs0ZDBRcLwja9EX
# SaABAadtZcQN8NT1RB1o3UX/c/N+EboxUhIWYYuDdD5cqmTlWK1iO0KK+tDYHuOb
# PpndvS3MzSWyvwutcp+FuZvoQyNlrnPCBz/R4q66d76Bv5dByhZT2VxbH+/Wy3gN
# 4KrNq8sphYc6oXQHLAlsYc+szEwuD9zIlsTWjlvAuFxC0ZM6AJlGN+cbZIzluvm5
# e4omQjR6KaP5p1a3gacBFbDbOU6KiLa/+6Q3qrOWBugEdwrvty9VoMJZ86ElNPUj
# 7wRnmaN9cjiYsHo9OA5bYRg2ebidMUfb6yS2blQd6BvzfIYM/URu2FDRzit1jmLG
# gQJpoYIDIDCCAxwGCSqGSIb3DQEJBjGCAw0wggMJAgEBMHcwYzELMAkGA1UEBhMC
# VVMxFzAVBgNVBAoTDkRpZ2lDZXJ0LCBJbmMuMTswOQYDVQQDEzJEaWdpQ2VydCBU
# cnVzdGVkIEc0IFJTQTQwOTYgU0hBMjU2IFRpbWVTdGFtcGluZyBDQQIQC65mvFq6
# f5WHxvnpBOMzBDANBglghkgBZQMEAgEFAKBpMBgGCSqGSIb3DQEJAzELBgkqhkiG
# 9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI1MDEyMzIzNTQzMFowLwYJKoZIhvcNAQkE
# MSIEIJJFDXeBdvo0VrJarbcCBxgbtRx1bQUjrSuW9KK5jxPRMA0GCSqGSIb3DQEB
# AQUABIICAB17uOBxBCbamEoFPn88A607HS1C6d1fIIVadnvRO+mgxiFNNW6h6Hg+
# gRJdV8kiHaN4QkgayROt9OV71CfFtQRzrQtYZbCpSP0IF7SYEAOrU3kyayBUM0N4
# Wsn0jDNy1Ed48IX44+n4E70i+eYzy78QheQ1m39culdIoGj0WfqLZ9M+QsrpZZLL
# vZeAQfTVWAPDJFrhZxDKL5rS0IOyw5bXMFwXlIAZk0mL1gpWBMG2n3TUCfJ+Zn3z
# niY+NvReL3c9klWXMDxjmuyKibZoP4cCdyYxjqniXKaz6h57zk6QHk2jzT8xXtK0
# v6i2ta8/6E63ulhbu+cROQEczL6DtLhwyHTl2QjRHzr/viDL89HpxOZp/FJmWQJO
# mR1gFU8tYVWais1yiysYJ0CDAvINzfIpzmmPmDrWecseILgL64lyQmyXaJRhLYvJ
# BL8605xLcgCaOZeCvw0HdYOYgCBHDMFj34yUglbRnIgiliY6r/iNtFuavc6FBpn0
# oInKHvkO0a8+3KS9VUF80U3dZ3lvaUNpqI4sPcW0GizUzEQ1OsT0xZS9i6DAAj8Y
# ifY9LY2XcooGxZ3TYc+XR+mNu/pKer/xhO6RA6nvazZXHhsb179mKsTNI2Ew16oF
# iEFYcOFI0BiE3YfgpEnnHri4fwpY5Lx0EcMHe6VqXsaii6PjsHba
# SIG # End signature block
