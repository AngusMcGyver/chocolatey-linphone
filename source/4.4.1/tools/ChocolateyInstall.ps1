$ErrorActionPreference = 'Stop'

$LinphoneActive = Get-Process Linphone -ErrorAction SilentlyContinue
if($LinphoneActive -eq $null) {
	# the silent installer won't start the uninstaller of the old version in silent mode, so do it manually...
	$packageArgsUnInstall = @{
	packageName            = $env:ChocolateyPackageName
	fileType               = 'EXE'
	silentArgs             = '/S'
	validExitCodes         = @(0)
	softwareName           = 'linphone'
	}

	# get uninstaller
	[array]$key = Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall, HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall | Get-ItemProperty | Where-Object {$_.DisplayName -match $packageArgsUnInstall['softwareName'] } | Select-Object -Property DisplayName, UninstallString
	if ($key.Count -eq 1) {
	$key | % {
		$packageArgsUnInstall['file'] = "$($_.UninstallString)"
		Write-Verbose "uninstall old $($_.DisplayName) version: $($_.UninstallString) $packageArgsUnInstall['silentArgs']"
		Uninstall-ChocolateyPackage @packageArgsUnInstall
	}
	} elseif ($key.Count -eq 0) {
	Write-Verbose "skip uninstall of old $packageArgsUnInstall['softwareName'] version, no installation found"
	}

	# install
	$packageArgsInstall = @{
	packageName            = $env:ChocolateyPackageName
	fileType               = 'EXE'
	url                    = 'https://download.linphone.org/releases/windows/app/Linphone-4.4.1-win64.exe'
	checksum               = 'ed99ac209fe3718d30cf60f2551ef0da9438a2522caaad517446ac0aef27b4ed'
	checksumType           = 'sha256'
	silentArgs             = '/S'
	validExitCodes         = @(0)
	softwareName           = 'linphone'
	}

	Install-ChocolateyPackage @packageArgsInstall
} else {
 	Write-Error "A version of linphone is already running, please stop and try again"
}
