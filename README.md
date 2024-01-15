# Windows 11 Upgrade Scripts

This script was born out of frustration with the Windows 11 Upgrade Assistant just rebooting without notification after the upgrade was complete. This was scripted for use with ConnectWise Automate or Microsoft Intune. The scripts are numbered in the order in which they need to run and are further explained below.

## Files
1.HardwareReadiness.ps1
- **Run as System.**
- This is Microsoft's HardwareReadiness script that can be found here https://techcommunity.microsoft.com/t5/microsoft-intune-blog/understanding-readiness-for-windows-11-with-microsoft-endpoint/ba-p/2770866.
- There is a directory check at the start as well as forced Windows notifications to be on.
- The script will create a file with the results of the readiness check, output will be either CAPABLE or NOT CAPABLE.

2.Win11_Toast1_Notif.ps1
- **Run as logged in user.**
- At the top I set variables for the NOT CAPABLE document to be later output by the "Not Capable" Toast notification.
- Everything from here on out in the remainder of the scripts is dependant on either file existing.

3.Windows11_Download.ps1
- **Run as logged in user.**
- https://www.microsoft.com/software-download/windows11 This is where you can generate a new download key. It lasts for 24 hours. Just replace it in the script.

4.Windows11_Install.ps1
- **Run as System.**
- Mounting ISO
- Installing Windows 11 Upgrade
- Unmounting Image
- Deleting ISO

5.Win11_Toast2_Notif.ps1
- **Run as logged in user.**
- Final Toast Notification letting the user know to restart their computer.
