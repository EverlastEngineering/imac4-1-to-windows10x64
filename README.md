# imac4-1-to-windows10x64
This is a depo for all the files and information needed to upgrade the first Intel Mac, the Core Duo 32 bit machine, to a 64 bit processor and all the steps needed to get it to run Windows 10 x64.

## Step 1 - Upgrade the firmware to iMac5,1
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

*Credits:<br>
http://forum.netkas.org/index.php/topic,1122.0.html<br>
http://forum.netkas.org/index.php/topic,1122.msg38747.html#msg38747*

## Step 2 - Upgrade your CPU to a Core 2 Duo
I upgraded to a 2.0GHz T7200, which can be found on ebay for under $4. However, best performance is the T7600 which is a 2.33GHz CPU. This hardware upgrade is necessary to have a 64-bit CPU available for the operating system. Here's an ifixit link:
https://www.ifixit.com/Guide/iMac+Intel+20-Inch+EMC+2105+and+2118+CPU+Replacement/35350

I do believe that you could get away without upgrading the CPU and sticking to a 32bit operating system. Windows is the only OS to have an up-to-date Chrome package available in 32-bit as of Feb 2020. I chose to go to 64-bit to future-proof the machine a bit.

*You may also want to consider installing a SSD drive at this point. I used a Samsung SSD with a 3.5" to 2.5" SATA carrier with great success, and even reused the temperature sensor. You can use an external SATA mount to read/write and I used SuperDuper! to backup the old drive to the SSD which worked perfectly under Catalina. *

## Step 3 - Partition your drive with Bootcamp
Go into your installed MacOS and setup a bootcamp partition. You don't need your Windows install media or anything, just get the partition set up. It also sets up the emulated BIOS needed for windows to operate.

## Step 4 - Get your Windows 7 DVD ready
Download Windows 7 Professional. I downloaded from the legal Internet Archive, where it can be found here:
https://archive.org/details/Windows7Professional64Bit

You may already have a Windows 7 DVD. Here's the problem: when you boot this disk, you get prompted to make a choice about installation; the installer will fail due to the 32bit EFI and 64bit CPU. So to remedy this you need to build a new ISO after using the *Oscdimg* tool. *Oscdimg* is a command-line tool that you can use to create an image (.iso) file of a customized 32-bit or 64-bit version of Windows Preinstallation Environment (Windows PE). Download it here:
https://github.com/jasoncopp/imac4-1-to-windows10x64/blob/master/image-creating-tool/oscdimg.zip

Extract the Windows 7 ISO to a folder on a Windows PC. Then, go to an appropriate location and run the *Oscdimg* tool from the cmd prompt with this format, substituting the proper folder names, etc:
`oscdimg -n -m -bc:\windows7contents\boot\etfsboot.com c:\windows7contents c:\newwindows7dvd\newwindows7dvd.iso`

Burn this new ISO to a DVD.

*Credit: https://www.jackfeschuk.com/fixing-select-cd-rom-boot-type-when-installing-64bit-windows/*

## Step 5 - Install Windows 7 with no product key or Bootcamp drivers.
Now, boot the mac while holding Option after the chime. When you insert this newly created DVD, you will be able to choose it from the boot menu, which will install Windows 7. Skip entering a Windows Key, and don't bother to find any drivers for it, as we're going to blow away this Windows with a new install later. This step is because the Windows 10 installer doesn't do well with the 32bit EFI and 64bit CPU, even when booting from DVD. It can cause issues during the install or afterwards. Using Windows 7 to start seems to avoid this problem.

## Step 6 - Install Windows 10
I installed Windows 10 from USB from within Windows 7. It renames the Windows folder to Windows.old which you can delete later. I actually went to an older version of Windows 10 initially, then to a newer one, but I think you can go directly to the latest Windows 10 ISO available from Microsoft's website:
https://www.microsoft.com/en-ca/software-download/windows10ISO
