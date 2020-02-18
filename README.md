# imac4-1-to-windows10x64
This is a depo for all the files and information needed to upgrade the first Intel Mac, the Core Duo 32 bit machine, to a 64 bit processor and all the steps needed to get it to run Windows 10 x64.

## Step 1 - Upgrade the firmware to iMac5,1
*Credits:<br>
http://forum.netkas.org/index.php/topic,1122.0.html<br>
http://forum.netkas.org/index.php/topic,1122.msg38747.html#msg38747*

First up, you need to upgrade the firmware on you iMac4,1 to iMac5,1. The unzip this file in a location of your choice:<br>
https://github.com/jasoncopp/imac4-1-to-windows10x64/blob/master/bios-upgrade/iMac41-iMac51%20Firmware%20Tool.zip

The tool no longer works properly as the URL for the firmware has been updated; it gives "error 5530". However, here is a workaround from the above forum. It's pretty straightforward.

>
>STEP 1 - Download EFI updates:<br>
>https://github.com/jasoncopp/imac4-1-to-windows10x64/blob/master/bios-upgrade/iMacFirmwareUpdate.dmg<br>
>https://github.com/jasoncopp/imac4-1-to-windows10x64/blob/master/bios-upgrade/iMacFirmwareUpdate1.2.dmg
>
>Efi update 1.1: https://support.apple.com/kb/DL305?viewlocale=en_US&locale=en_US<br>
>Efi update 1.2: https://support.apple.com/kb/DL205?viewlocale=en_US&locale=es_ES
>
>STEP 2 - Remame downloaded .dmg
>
>Efi update 1.1: iMacFirmwareUpdate.dmg -> rename to -> iMacEFIiMac41.dmg<br>
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

## Step 2 - Upgrade your CPU to a Core 2 Duo
I upgraded to a 2.0GHz T7200, which can be found on ebay for under $4. However, best performance is the T7600 which is a 2.33GHz CPU. This hardware upgrade is necessary to have a 64-bit CPU available for the operating system. Here's an ifixit link:

https://www.ifixit.com/Guide/iMac+Intel+20-Inch+EMC+2105+and+2118+CPU+Replacement/35350

I do believe that you could get away without upgrading the CPU and sticking to a 32bit operating system. Windows is the only OS to have an up-to-date Chrome package available in 32-bit as of Feb 2020. I chose to go to 64-bit to future-proof the machine a bit.

## Step 3 - Partition your drive with Bootcamp.
Go into your installed MacOS and setup a bootcamp partition. You don't need your Windows install media or anything, just get the partition set up. It also sets up the emulated BIOS needed for windows to operate.

## Step 4 - 
Download Windows 7 Professional. I downloaded from the legal Internet Archive, where it can be found here:
https://archive.org/details/Windows7Professional64Bit

## Step 5
This 
