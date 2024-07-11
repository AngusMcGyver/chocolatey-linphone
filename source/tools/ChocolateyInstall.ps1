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
		url                    = 'https://download.linphone.org/releases/windows/app/Linphone-5.2.5-win64.exe'
		checksum               = '1d3e1e9a0845be264fde265d9139d8e074d352d5f3ceb15b83937d7d3a427477'
  		checksumType           = 'sha256'
		silentArgs             = '/S'
		validExitCodes         = @(0)
		softwareName           = 'linphone'
	}

	Install-ChocolateyPackage @packageArgsInstall
} else {
 	Write-Error "A version of $($packageArgsInstall['softwareName']) is already running, please stop and try again"
}
