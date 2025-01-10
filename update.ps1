Write-Host "Downloading mpv"

Invoke-WebRequest "https://nightly.link/mpv-player/mpv/workflows/build/master/mpv-x86_64-windows-msvc.zip" -OutFile "$HOME\Downloads\mpv.zip"

Write-Host "Extracting mpv"

Expand-Archive -Force -Path "$HOME\Downloads\mpv.zip" -DestinationPath "$HOME\AppData\Local\mpv"

Write-Host "Removing Download"

Remove-Item "$HOME\Downloads\mpv.zip"

Write-Host "mpv Update Complete"