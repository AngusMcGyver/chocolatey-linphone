$ErrorActionPreference = 'Stop'
 
$packageArgs = @{
  packageName            = 'Linphone'
  fileType               = 'EXE'
  url                    = 'http://www.linphone.org/releases/windows/Linphone-4.1.1-win32.exe'
  checksum               = 'BB7B7B9B6B620BD15740CCE9E176F3342F6C8B1527830697A608E6FEFF08BDF3'
  checksumType           = 'sha256'
  silentArgs             = '/S'
  validExitCodes         = @(0)
  softwareName           = 'Linphone *'
}
Install-ChocolateyPackage @packageArgs