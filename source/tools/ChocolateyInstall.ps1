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
		checksum               = '99fe552f8653d1cb39777e3b62a4f846d724909dd6605cfd8d0607e501848e4d76784ce09e90892cfb1557ec2ca0570afc0f75aa169fc0ca9668190d46964e7b'
  		checksumType           = 'sha256'
		silentArgs             = '/S'
		validExitCodes         = @(0)
		softwareName           = 'linphone'
	}

	Install-ChocolateyPackage @packageArgsInstall
} else {
 	Write-Error "A version of $($packageArgsInstall['softwareName']) is already running, please stop and try again"
}
