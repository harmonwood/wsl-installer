# WSL Installer

## Install
No need to figure out how to turn on Windows Subsystems this script will do it for you

* Open Powershell using `Run As Adminstrator`
* Download script via `Invoke-WebRequest -Uri https://raw.githubusercontent.com/harmonwood/wsl-installer/master/src/install.ps1 -OutFile .\install.ps1 -UseBasicParsing`
* Invoke with `powershell -ExecutionPolicy ByPass -File .\install.ps1`
* Reboot when requested
* ReInvoke script after first reboot

### Starting Options
After insalled you can run the POSIX Shell at any time in the following ways:
* The Windows App Bar and select your chosen distribution (Ubuntu by default)
* Executing the given binary  for your chosen distribution` (ubuntu1840.exe`)
* This scripts has also added a generic symbolic link no matter the chosen distribution (`posix.exe`)

### Changing the distribution
If you do not like ubuntu and want to use another distribution you will need to change the following variables in the script before running it.
* `$distroName = 'Ubuntu 18.04'`
* `$distroExe = 'ubuntu1804.exe'`
* `$distroUrl = 'https://aka.ms/wsl-ubuntu-1804'`

A complete list of options and distroUrls can be found at `https://docs.microsoft.com/en-us/windows/wsl/install-manual`
