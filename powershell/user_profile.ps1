# PROMPT
oh-my-posh --init --shell pwsh --config '$env:LOCALAPPDATA\Programs\oh-my-posh\themes\star.omp.json' | Invoke-Expression

# MODULES
Import-Module Terminal-Icons
Import-Module PSFzf

# SETTINGS
Set-PsReadLineOption -BellStyle None
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# ALIASES
Set-Alias vim nvim
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'

# FUNCTIONS
function which($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}
