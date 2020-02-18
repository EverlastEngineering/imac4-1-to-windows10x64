# imac4-1-to-windows10x64
This is a depo for all the files and information needed to upgrade the first Intel Mac, the Core Duo 32 bit machine, to a 64 bit processor and all the steps needed to get it to run Windows 10 x64.

## Step 1 - Upgrade the Firmware to iMac5,1
Credits:
http://forum.netkas.org/index.php/topic,1122.0.html
http://forum.netkas.org/index.php/topic,1122.msg38747.html#msg38747

>First up, you need to upgrade the firmware on you iMac4,1 to iMac5,1. The unzip this file in a location of your choice:
>https://github.com/jasoncopp/imac4-1-to-windows10x64/blob/master/bios-upgrade/iMac41-iMac51%20Firmware%20Tool.zip
>
>These instructions are taken from 
>STEP 1 - Download EFI updates:
>https://github.com/jasoncopp/imac4-1-to-windows10x64/blob/master/bios-upgrade/iMacFirmwareUpdate.dmg
>https://github.com/jasoncopp/imac4-1-to-windows10x64/blob/master/bios-upgrade/iMacFirmwareUpdate1.2.dmg
>
>Efi update 1.1: https://support.apple.com/kb/DL305?viewlocale=en_US&locale=en_US
>Efi update 1.2: https://support.apple.com/kb/DL205?viewlocale=en_US&locale=es_ES
>
>STEP 2 - Remame downloaded .dmg
>
>Efi update 1.1: iMacFirmwareUpdate.dmg -> rename to -> iMacEFIiMac41.dmg
>Efi update 1.2: iMacFirmwareUpdate1.2.dmg -> rename to -> iMacEFIiMac51.dmg
>
>STEP 3 - Run iMac41-iMac51 Firmware Tool
>
>Run it as usual. It will report error 5530 as before and it will create on desktop a RamDisk volume. DO NOT EXPULSE IT!
>
>STEP 4 - Copy files to RamDisk
>
>Select "iMac41-iMac51 Firmware Tool.app", right click and then click on "Show packet content"
>Copy the following files to "/Volumes/RamDisk": ExtractAndPatchEFIFiles.sh, iMac41EFIUpdater.patch, iMac51EFIUpdater.patch and UpdateEFIiMac41-iMac51.sh.
>Copy also the two downloaded .dmg from Apple: iMacEFIiMac41.dmg and iMacEFIiMac51.dmg
>
>STEP 5 - Lets do the Magic
>
>Open a terminal and drag and drop on it the ExtractAndPatchEFIFiles.sh script. Then run it and wait until everything finish
>Open a terminal, type sudo and then drag and drop the UpdateEFIiMac41-iMac51.sh script:
>sudo /Volumes/Ramdisk/UpdateEFIiMac41-iMac51.sh
>Then run it and wait until everything finishes (at the end it should report that return code is 0, which means that everything worked correctly).
>
>STEP 6 - Reboot
>
>Shutdown the iMac
>Turn it on and keep pressed power button until the iMac light ENDS blinking
>You will hear a BEEP sound
>The iMac will start the EFI update (a progress bar should be displayed)
>Wait the EFI update to complete and….. Voila!

##Step 2
