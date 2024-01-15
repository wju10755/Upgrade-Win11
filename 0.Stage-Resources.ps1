Write-Host -ForegroundColor Yellow "Staging script requirements..." -NoNewline

$Hardware = "https://raw.githubusercontent.com/wju10755/Upgrade-Win11/main/1.HardwareReadiness.ps1"

$Toast1 = "https://raw.githubusercontent.com/wju10755/Upgrade-Win11/main/2.Win11_Toast1_Notify.ps1"

$Download = "https://raw.githubusercontent.com/wju10755/Upgrade-Win11/main/3.Windows11_Download.ps1"

$Install =  "https://raw.githubusercontent.com/wju10755/Upgrade-Win11/main/4.Windows11_Install.ps1"

$Toast2 = "https://raw.githubusercontent.com/wju10755/Upgrade-Win11/main/5.Win11_Toast2_Notify.ps1"

$Dir = "c:\install"

$Capable = "C:\install\Capable.txt"

$ISO = "C:\temp\Win11_23H2-x64v2.iso"

if(!(Test-Path $Dir)) {
mkdir "c:\install" *> $null
}

Set-Location "C:\install"

Invoke-WebRequest $Hardware -OutFile "$Dir\1.HardwareReadiness.ps1"

Invoke-WebRequest $Toast1 -OutFile "$Dir\2.Win11_Toast1_Notify.ps1"

Invoke-WebRequest $Download -OutFile "$Dir\3.Windows11_Download.ps1"

Invoke-WebRequest $Install -OutFile "$Dir\4.Windows11_Install.ps1"

Invoke-WebRequest $Toast2 -OutFile "$Dir\5.Win11_Toast2_Notify.ps1"

Write-Host -ForegroundColor Green " done."

Start-Sleep -seconds 2

try {
    & "$Dir\1.HardwareReadiness.ps1"
    if (Test-Path $Capable) {
    & "$Dir\2.Win11_Toast1_Notify.ps1"
    & "$Dir\3.Windows11_Download.ps1"
    if (Test-Path $ISO) {
    & "$Dir\4.Windows11_Install.ps1"
    $setup = Get-Process setup*
    while ($setup -ne $null) {
        Write-Host "Waiting for setup.exe to exit..."
        Start-Sleep -Seconds 5
        & "$Dir\5.Win11_Toast2_Notify.ps1"
    }
    }
    }
}
catch {
    Write-Error "An error occurred: $_"
}


