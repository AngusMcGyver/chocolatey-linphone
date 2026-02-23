. "$PSScriptRoot/linphone-helpers.ps1"

$ErrorActionPreference = 'Stop'

$LinphoneActive = Get-Process Linphone -ErrorAction SilentlyContinue
if($LinphoneActive -eq $null) {

	# the silent installer won't start the uninstaller of the old version in silent mode, so do it manually...
	linphone_uninstall($true)

	# install
	$packageArgsInstall = @{
		packageName            = $env:ChocolateyPackageName
		fileType               = 'EXE'
		url                    = 'https://download.linphone.org/releases/windows/app/Linphone-6.1.0-win64.exe'
		checksum               = 'a80b4fde07e86f94999857075d83e021f0f375aac844998a6d7e76840053a411'
  		checksumType           = 'sha256'
		silentArgs             = '/S'
		validExitCodes         = @(0)
		softwareName           = 'linphone'
	}

	Install-ChocolateyPackage @packageArgsInstall
} else {
 	Write-Error "A version of $($packageArgsInstall['softwareName']) is already running, please stop and try again"
}
