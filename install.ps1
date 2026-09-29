# Bootstrap for Windows (run in a normal PowerShell, not as admin):
#   iex (irm https://raw.githubusercontent.com/somaliz/dotfiles/master/install.ps1)
# Sets up the Windows side (WezTerm config and colours, .wslconfig). The Linux side runs inside WSL:
#   wsl -- bash -c "curl -fsSL https://raw.githubusercontent.com/somaliz/dotfiles/master/install.sh | bash"
$ErrorActionPreference = 'Stop'
$bin = Join-Path $HOME 'bin'

if (-not (Get-Command chezmoi -ErrorAction SilentlyContinue)) {
    iex "&{$(irm 'https://get.chezmoi.io/ps1')} -BinDir '$bin'"
    $env:Path = "$bin;$env:Path"
}

chezmoi init somaliz
Write-Host "`nFiles chezmoi would create or change:"
chezmoi status
$ok = Read-Host "Apply now? Existing files listed above get replaced. [y/N]"
if ($ok -match '^[Yy]$') { chezmoi apply -v } else { Write-Host "Not applied. Review with: chezmoi diff   then: chezmoi apply" }

if (-not (Test-Path 'C:\Program Files\WezTerm\wezterm.exe')) {
    Write-Host "`nWezTerm is not installed: get the Windows installer from https://wezterm.org/"
}
Write-Host ".wslconfig changes apply after: wsl --shutdown"
