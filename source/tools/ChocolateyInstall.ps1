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
		url                    = 'https://download.linphone.org/releases/windows/app/Linphone-6.2.0-win64.exe'
		checksum               = '494b5abb637330ec28f0fdbd906420456ad851efa0fccd491b2e53d6e38e1c16'
  		checksumType           = 'sha256'
		silentArgs             = '/S'
		validExitCodes         = @(0)
		softwareName           = 'linphone'
	}

	Install-ChocolateyPackage @packageArgsInstall
} else {
 	Write-Error "A version of $($packageArgsInstall['softwareName']) is already running, please stop and try again"
}
