Write-Host -ForegroundColor Yellow "Staging script requirements..." -NoNewline

$Hardware = "https://raw.githubusercontent.com/wju10755/Upgrade-Win11/main/1.HardwareReadiness.ps1"

$Toast1 = "https://github.com/wju10755/Upgrade-Win11/blob/main/2.Win11_Toast1_Notif.ps1"

$Download = "https://github.com/wju10755/Upgrade-Win11/blob/main/3.Windows11_Download.ps1"

$Install =  "https://github.com/wju10755/Upgrade-Win11/blob/main/4.Windows11_Install.ps1"

$Toast2 = "https://github.com/wju10755/Upgrade-Win11/blob/main/5.Win11_Toast2_Notif.ps1"

$Dir = "c:\install"

$Capable = "C:\install\Capable.txt"

$ISO = "C:\temp\Win11_23H2-x64v2.iso"

Set-Location "C:\install"

Invoke-WebRequest $Hardware -OutFile "$Dir\1.HardwareReadiness.ps1"

Invoke-WebRequest $Toast1 -OutFile "$Dir\2.Win11_Toast1_Notify.ps1"

Invoke-WebRequest $Download -OutFile "$Dir\3.Windows11_Download.ps1"

Invoke-WebRequest $Install -OutFile "$Dir\4.Windows11_Install.ps1"

Invoke-WebRequest $Toast2 -OutFile "$Dir\4.Win11_Toast2_Notify.ps1"

Write-Host -ForegroundColor Green " done."

Start-Sleep -seconds 2

try {
    & "$Dir\1.HardwareReadiness.ps1"
    if (Test-Path $Capable) {
    & "$Dir\2.Win11_Toast1_Notify.ps1"
    & "$Dir\3.Windows11_Download.ps1"
    if (Test-Path $ISO) {
    & "$Dir\4.Windows11_Install.ps1"
    & "$Dir\5.Win11_Toast2_Notify.ps1"
    }
    }
}
catch {
    Write-Error "An error occurred: $_"
}



