# Run as Adminstrator!
# Temporary fix: `powershell -ExecutionPolicy ByPass -File .\development.ps1`
# Permenant Fix: `Set-ExecutionPolicy unrestricted` 

#Properties
# Distros (https://docs.microsoft.com/en-us/windows/wsl/install-manual)
$distroName = 'Ubuntu 18.04'
$distroExe = 'ubuntu1804.exe'
$distroUrl = 'https://aka.ms/wsl-ubuntu-1804'

# Enable Linux Subsystem
$subsystem = Get-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
if ($subsystem.State -eq "Disabled")
{
	Write-Host '[Subsystems] Enabeling Subsystems'
    Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
	# TODO: Restart script after reboot
}

# Download Linux distro
Write-Host '[Subsystems] Dowloading' $distroName '...'
Invoke-WebRequest -Uri $distroUrl -OutFile C:\Users\Public\posix.appx -UseBasicParsing
Write-Host '[Subsystems] Download Complete!'

# Install Linux Distro
Write-Host '[Subsystems] Starting installation...'
Add-AppxPackage C:\Users\Public\posix.appx
Write-Host '[Subsystems] Install Complete!'

# Everything after this is just to allow for the system to be started from the cmd
Write-Host '[Subsystems] Configuring environement...'
Rename-Item C:\Users\Public\posix.appx C:\Users\Public\posix.zip
Expand-Archive C:\Users\Public\posix.zip C:\Users\Public\distro
New-Item -ItemType SymbolicLink -Path C:\Users\Public\distro\posix.exe -Target C:\Users\Public\distro\$distroExe
$userenv = [System.Environment]::GetEnvironmentVariable("Path", "User")
[System.Environment]::SetEnvironmentVariable("PATH", $userenv + ";C:\Users\Public\distro", "User")
Write-Host '[Subsystems] Envirnoment Configured!'

# First run
Write-Host 'First run...'
C:\Users\Public\distro\posix.exe
