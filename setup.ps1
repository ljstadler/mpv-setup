Write-Host "Creating Directories"

New-Item -ItemType Directory -Path "$HOME\AppData\Local\mpv"

New-Item -ItemType Directory -Path "$HOME\AppData\Roaming\mpv"

Write-Host "Downloading mpv"

Invoke-WebRequest "https://nightly.link/mpv-player/mpv/workflows/build/master/mpv-x86_64-windows-msvc.zip" -OutFile "$HOME\Downloads\mpv.zip"

Write-Host "Extracting mpv"

Expand-Archive -Path "$HOME\Downloads\mpv.zip" -DestinationPath "$HOME\AppData\Local\mpv"

Write-Host "Removing Download"

Remove-Item "$HOME\Downloads\mpv.zip"

Write-Host "Adding mpv to Path"

[Environment]::SetEnvironmentVariable(
    "Path",
    [Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::User) + ";$HOME\AppData\Local\mpv",
    [EnvironmentVariableTarget]::User
)

Write-Host "Creating Start Menu Shortcut"

$WScriptShell = New-Object -ComObject WScript.Shell

$shortcut = $WScriptShell.CreateShortcut("$HOME\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\mpv.lnk")

$shortcut.TargetPath = "$HOME\AppData\Local\mpv\mpv.exe"

$shortcut.Save()

Write-Host "mpv Setup Complete"