if (-Not (Test-Path "$HOME\AppData\Local\mpv")) {
    New-Item -ItemType Directory -Path "$HOME\AppData\Local\mpv"
}

if (-Not (Test-Path "$HOME\AppData\Roaming\mpv")) {
    New-Item -ItemType Directory -Path "$HOME\AppData\Roaming\mpv"
}

Invoke-WebRequest "https://nightly.link/mpv-player/mpv/workflows/build/master/mpv-x86_64-pc-windows-msvc.zip" -OutFile "$HOME\Downloads\mpv.zip"

Expand-Archive -Force -Path "$HOME\Downloads\mpv.zip" -DestinationPath "$HOME\AppData\Local\mpv"

Remove-Item "$HOME\Downloads\mpv.zip"

if (-Not (Test-Path "$HOME\AppData\Roaming\mpv\mpv.conf")) {
    Invoke-WebRequest "https://raw.githubusercontent.com/ljstadler/mpv-setup/main/mpv.conf" -OutFile "$HOME\AppData\Roaming\mpv\mpv.conf"
}

if (-Not ([Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::User).Contains("$HOME\AppData\Local\mpv"))) {
    [Environment]::SetEnvironmentVariable(
        "Path",
        [Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::User) + ";$HOME\AppData\Local\mpv",
        [EnvironmentVariableTarget]::User
    )
}

if (-Not (Test-Path "$HOME\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\mpv.lnk")) {
    $WScriptShell = New-Object -ComObject WScript.Shell
    $shortcut = $WScriptShell.CreateShortcut("$HOME\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\mpv.lnk")
    $shortcut.TargetPath = "$HOME\AppData\Local\mpv\mpv.exe"
    $shortcut.Save()
}
