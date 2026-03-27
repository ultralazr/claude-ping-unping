Add-Type -AssemblyName presentationCore
$dir = "$env:USERPROFILE\.claude\sounds"
$files = Get-ChildItem -Path $dir -Filter "*.mp3" -File
if ($files.Count -eq 0) { exit }
$file = ($files | Get-Random).FullName
$mp = New-Object System.Windows.Media.MediaPlayer
$mp.Open([uri]$file)
$mp.Play()
Start-Sleep -Seconds 6
