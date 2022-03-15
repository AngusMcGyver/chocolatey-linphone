$ErrorActionPreference = 'Stop'

$packageArgsUnInstall = @{
  packageName            = $env:ChocolateyPackageName
  fileType               = 'EXE'
  silentArgs             = '/S'
  validExitCodes         = @(0)
  softwareName           = 'linphone'
}

[array]$key = Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall, HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall | Get-ItemProperty | Where-Object {$_.DisplayName -match $packageArgsUnInstall['softwareName'] } | Select-Object -Property DisplayName, UninstallString
if ($key.Count -eq 1) {
  $key | % { 
	# kill running process before uninstall
	[array]$LinphoneActive = Get-Process Linphone -ErrorAction SilentlyContinue
	if ( $LinphoneActive -ne $null ) {
		Write-Warning "Kill running process $LinphoneActive.ProcessName - PID $LinphoneActive.Id"
		kill $LinphoneActive.Id
	}
	$packageArgsUnInstall['file'] = "$($_.UninstallString)"
	Write-Verbose "uninstall old $($_.DisplayName) version: $($_.UninstallString) $packageArgsUnInstall['silentArgs']"
    Uninstall-ChocolateyPackage @packageArgsUnInstall
  }
} elseif ($key.Count -eq 0) {
  Write-Error "uninstall failed, no installation of $packageArgsUnInstall['softwareName'] found"
}
