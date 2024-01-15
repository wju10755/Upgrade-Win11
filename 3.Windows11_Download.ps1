#https://www.microsoft.com/software-download/windows11
$Capable = "C:\Install\Capable.txt"
If (Test-Path -Path $Capable) { 
    #Download .iso
    Start-Job -Name WebReq -ScriptBlock { 
        $ProgressPreference = 'SilentlyContinue'
        $URL = "https://azurestorageblob.com/Win11_23H2-x64v2.iso"
        $Path = "C:\Install\Win11_23H2-x64v2.iso"
        Invoke-WebRequest -Uri $URL -OutFile $Path 
    }
    Wait-Job -Name WebReq
}