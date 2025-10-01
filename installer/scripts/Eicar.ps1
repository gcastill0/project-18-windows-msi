$e = Join-Path $env:ProgramData 'eicar.com'
Set-Content -Path $e -NoNewline -Value 'X5O!P%@AP[4\PZX54(P^)7CC)7}$EICAR-STANDARD-ANTIVIRUS-TEST-FILE!$H+H*'
Start-Sleep 2
Remove-Item -Force $e
