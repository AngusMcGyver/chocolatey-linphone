This repository contains a [chocolatey package](https://community.chocolatey.org/packages/LinPhone) for [linphone](https://www.linphone.org/)

### ToDo

* split the duplicated unsinstall code (in `chocolateyinstall.ps1` and `chocolateyuninstall.ps1`) into a helper script file, e.g. `linphone-helpers.ps1`

### how to build from local source

```
PS C:\repositories\chocolatey-linphone\source\4.3.2\> choco pack .\linphone.nuspec


Chocolatey v0.12.1
2 validations performed. 2 success(es), 0 warning(s), and 0 error(s).

Attempting to build package from 'linphone.nuspec'.
Successfully created package 'C:\repositories\chocolatey-linphone\source\4.3.2\LinPhone.4.3.2.nupkg'
```

### how to upload to chocolatey

```
PS C:\repositories\chocolatey-linphone\source\4.3.1\> choco apikey --key *** --source https://push.chocolatey.org/


Chocolatey v0.12.1
2 validations performed. 2 success(es), 0 warning(s), and 0 error(s).

Added ApiKey for https://push.chocolatey.org/




PS C:\repositories\chocolatey-linphone\source\4.3.1\> choco push LinPhone.4.3.1.nupkg --source https://push.chocolatey.org/


Chocolatey v0.12.1
2 validations performed. 2 success(es), 0 warning(s), and 0 error(s).

Attempting to push LinPhone.4.3.1.nupkg to https://push.chocolatey.org/
LinPhone 4.3.1 was pushed successfully to https://push.chocolatey.org/

Your package will go through automated checks and may be subject to
human moderation. You should receive email(s) with the automated
testing results. If you don't receive them within 1-3 business days,
please use the 'Contact Site Admins' on the package page to contact the
moderators. If your package is subject to human moderation there is no
guarantee on the length of time that this can take to complete. This
depends on the availability of moderators, number of packages in the
queue at this time, as well as many other factors.

You can check where your package is in the moderation queue here:
https://ch0.co/moderation

For more information about the moderation process, see the docs:
https://docs.chocolatey.org/en-us/community-repository/moderation/

Please ensure your registered email address is correct and emails from
moderation at chocolatey dot org are not being sent to your spam/junk
folder.
```

### how to install from local source

```
PS C:\repositories\chocolatey-linphone\source\4.3.1\> choco install .\LinPhone.4.3.1.nupkg


The use of .nupkg or .nuspec in for package name or source is known to cause issues. Please use the package id from the nuspec `<id />` with `-s .` (for local folder where nupkg is found).
Chocolatey v0.12.1
2 validations performed. 2 success(es), 0 warning(s), and 0 error(s).

Installing the following packages:
.\LinPhone.4.3.1.nupkg
By installing, you accept licenses for the packages.

LinPhone v4.3.1
linphone package files install completed. Performing other installation steps.
The package LinPhone wants to run 'chocolateyinstall.ps1'.
Note: If you don't run this script, the installation will fail.
Note: To confirm automatically next time, use '-y' or consider:
choco feature enable -n allowGlobalConfirmation
Do you want to run the script?([Y]es/[A]ll - yes to all/[N]o/[P]rint): y

Downloading LinPhone
  from 'https://download.linphone.org/releases/windows/app/Linphone-4.3.1-win32.exe'
Progress: 100% - Completed download of C:\Users\user\AppData\Local\Temp\chocolatey\LinPhone\4.3.1\Linphone-4.3.1-win32.exe (57.88 MB).
Download of Linphone-4.3.1-win32.exe (57.88 MB) completed.
Hashes match.
Installing LinPhone...
LinPhone has been installed.
  linphone may be able to be automatically uninstalled.
 The install of linphone was successful.
  Software installed as 'EXE', install location is likely default.

Chocolatey installed 1/1 packages.
 See the log for details (C:\ProgramData\chocolatey\logs\chocolatey.log).
```

### how to upgrade from local source

```
PS C:\repositories\chocolatey-linphone\source\4.3.2\> choco upgrade .\LinPhone.4.3.2.nupkg


The use of .nupkg or .nuspec in for package name or source is known to cause issues. Please use the package id from the nuspec `<id />` with `-s .` (for local folder where nupkg is found).
Chocolatey v0.12.1
2 validations performed. 2 success(es), 0 warning(s), and 0 error(s).

Upgrading the following packages:
.\LinPhone.4.3.2.nupkg
By upgrading, you accept licenses for the packages.
.\LinPhone.4.3.2.nupkg is not installed. Installing...

LinPhone v4.3.2
linphone package files upgrade completed. Performing other installation steps.
The package LinPhone wants to run 'chocolateyinstall.ps1'.
Note: If you don't run this script, the installation will fail.
Note: To confirm automatically next time, use '-y' or consider:
choco feature enable -n allowGlobalConfirmation
Do you want to run the script?([Y]es/[A]ll - yes to all/[N]o/[P]rint): y

Uninstalling LinPhone...
0
LinPhone has been uninstalled.
Downloading LinPhone
  from 'https://download.linphone.org/releases/windows/app/Linphone-4.3.2-win32.exe'
Progress: 100% - Completed download of C:\Users\user\AppData\Local\Temp\chocolatey\LinPhone\4.3.2\Linphone-4.3.2-win32.exe (57.88 MB).
Download of Linphone-4.3.2-win32.exe (57.88 MB) completed.
Hashes match.
Installing LinPhone...
LinPhone has been installed.
  linphone may be able to be automatically uninstalled.
 The upgrade of linphone was successful.
  Software installed as 'EXE', install location is likely default.

Chocolatey upgraded 1/1 packages.
 See the log for details (C:\ProgramData\chocolatey\logs\chocolatey.log).
```

### how to uninstall

```
PS C:\repositories\chocolatey-linphone\source\4.3.2\> choco uninstall linphone


Chocolatey v0.12.1
2 validations performed. 2 success(es), 0 warning(s), and 0 error(s).

Uninstalling the following packages:
Linphone

LinPhone v4.3.2
The package LinPhone wants to run 'chocolateyuninstall.ps1'.
Note: If you don't run this script, the installation will fail.
Note: To confirm automatically next time, use '-y' or consider:
choco feature enable -n allowGlobalConfirmation
Do you want to run the script?([Y]es/[A]ll - yes to all/[N]o/[P]rint): y

Uninstalling LinPhone...
0
LinPhone has been uninstalled.
 Skipping auto uninstaller - Package contains a skip file ('.skipAutoUninstall').
 LinPhone has been successfully uninstalled.

Chocolatey uninstalled 1/1 packages.
 See the log for details (C:\ProgramData\chocolatey\logs\chocolatey.log).
```


### Source:  

This repository is a fork of https://github.com/sofakingdead/Chocolatey_Packages

The source code of linphone client itself can be found here https://github.com/BelledonneCommunications/linphone-desktop
