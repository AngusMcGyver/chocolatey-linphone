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
		url                    = 'https://download.linphone.org/releases/windows/app/Linphone-5.2.6-win64.exe'
		checksum               = 'e6feb3814f3caafc4f5df9cde2f7feb352e76f8ff6ffd91636a645d33336d7ff'
  		checksumType           = 'sha256'
		silentArgs             = '/S'
		validExitCodes         = @(0)
		softwareName           = 'linphone'
	}

	Install-ChocolateyPackage @packageArgsInstall
} else {
 	Write-Error "A version of $($packageArgsInstall['softwareName']) is already running, please stop and try again"
}
