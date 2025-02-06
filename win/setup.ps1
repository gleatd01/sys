# (A) You've never installed posh-git from the PowerShell Gallery
PowerShellGet\Install-Module posh-git -Scope CurrentUser -Force
Import-Module posh-git
Add-PoshGitToProfile -AllHosts
