<div align=center>

# mpv-scripts

## PowerShell scripts to set up and update [mpv](https://mpv.io) on Windows

</div>

## Setup

```powershell
irm "https://raw.githubusercontent.com/ljstadler/mpv-scripts/main/setup.ps1" | iex
```

## Update

```powershell
irm "https://raw.githubusercontent.com/ljstadler/mpv-scripts/main/update.ps1" | iex
```

## Configure

```powershell
iwr "https://raw.githubusercontent.com/ljstadler/mpv-scripts/main/mpv.conf" -OutFile "$HOME\AppData\Roaming\mpv\mpv.conf"
```
