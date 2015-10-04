# Script directory
$ScriptDir = 'D:\PDT-2.65.0.0-2620-HomeLab'

# Create VHD directory
$OutputDir = 'D:\VHDs'

# Ensure that the script directory exists.
if(!(Test-Path -Path $ScriptDir)){
    Write-Verbose "Script directory does not exist!"
}

# Create Output directory if it doesn't exist.
if(!(Test-Path -Path $OutputDir)){
    mkdir $OutputDir
}

# Load (aka "dot-source) the Function 
. .\Convert-WindowsImage.ps1 


# Create Windows Server 2012 R2 template
Convert-WindowsImage -SourcePath "\\nas\mdt\HydrationCM2012R2SP1\DS\Operating Systems\WS2012R2\sources\install.wim" -Edition SERVERDATACENTER -VHDFormat VHDX -SizeBytes 80GB -VHDPath $OutputDir\Win2012R2.vhdx


# Create Windows Server 2008 R2 template
Convert-WindowsImage -SourcePath "\\nas\apps\IT\PDT\WS2008R2\install.wim" -Edition SERVERDATACENTER -VHDFormat VHDX -SizeBytes 80GB -VHDPath $OutputDir\Win2008R2.vhdx