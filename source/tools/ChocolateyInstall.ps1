. "$PSScriptRoot/linphone-helpers.ps1"

$ErrorActionPreference = 'Stop'

$packageArgsInstall = @{
	packageName            = $env:ChocolateyPackageName
	fileType               = 'EXE'
	url                    = 'https://download.linphone.org/releases/windows/app/Linphone-6.2.4-win64.exe'
	checksum               = '5b275f52f52e22b2180ad33c0f9b46cbc01c87fbd5afc072ef72d16895f15d54'
	checksumType           = 'sha256'
	silentArgs             = '/S'
	validExitCodes         = @(0)
	softwareName           = 'linphone'
}

$LinphoneActive = Get-Process Linphone -ErrorAction SilentlyContinue
if($LinphoneActive -eq $null) {

	# the silent installer won't start the uninstaller of the old version in silent mode, so do it manually...
	linphone_uninstall($true)

	Install-ChocolateyPackage @packageArgsInstall
} else {
 	Write-Error "A version of $($packageArgsInstall['softwareName']) is already running, please stop and try again"
}
