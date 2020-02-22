# How to get the first Intel iMac to run Windows 10
#### imac4-1-to-windows10x64
The first Intel iMac was released in early 2006. This is a guide to run Windows 10 x64 on this machine and this depo contains most of the files and information needed. I've found it runs quite satisfactory.

### Step 1 - Upgrade the firmware to iMac5,1
First up, you need to upgrade the firmware on you iMac4,1 to iMac5,1. Unzip this file in a location of your choice on your iMac in MacOS:<br>
https://github.com/jasoncopp/imac4-1-to-windows10x64/blob/master/bios-upgrade/iMac41-iMac51%20Firmware%20Tool.zip

Unfortunately this tool no longer works properly as the URL to download the firmware has been changed. It gives "error 5530". However, here is a workaround from the source forum; it's pretty straightforward.

>STEP A - Download EFI updates:<br>
>https://github.com/jasoncopp/imac4-1-to-windows10x64/blob/master/bios-upgrade/iMacFirmwareUpdate.dmg<br>
>https://github.com/jasoncopp/imac4-1-to-windows10x64/blob/master/bios-upgrade/iMacFirmwareUpdate1.2.dmg
>
>
>STEP B - Rename downloaded `.dmg` files
>
>Efi update 1.1: iMacFirmwareUpdate.dmg -> rename to -> iMacEFIiMac41.dmg<br>
>Efi update 1.2: iMacFirmwareUpdate1.2.dmg -> rename to -> iMacEFIiMac51.dmg
>
>STEP C - Run iMac41-iMac51 Firmware Tool
>
>Run it as usual. It will report error 5530 as before and it will create on desktop a RamDisk volume. DO NOT EXPULSE IT!
>
>STEP D - Copy files to RamDisk
>
>Select "iMac41-iMac51 Firmware Tool.app", right click and then click on "Show packet content"
>Copy the following files to "/Volumes/RamDisk": ExtractAndPatchEFIFiles.sh, iMac41EFIUpdater.patch, iMac51EFIUpdater.patch and UpdateEFIiMac41-iMac51.sh.
>Copy also the two downloaded .dmg from Apple: iMacEFIiMac41.dmg and iMacEFIiMac51.dmg
>
>STEP E - Lets do the Magic
>
>Open a terminal and drag and drop on it the ExtractAndPatchEFIFiles.sh script. Then run it and wait until everything finish
>Open a terminal, type sudo and then drag and drop the UpdateEFIiMac41-iMac51.sh script:
>sudo /Volumes/Ramdisk/UpdateEFIiMac41-iMac51.sh
>Then run it and wait until everything finishes (at the end it should report that return code is 0, which means that everything worked correctly).
>
>STEP F - Reboot
>
>Shutdown the iMac
>Turn it on and keep pressed power button until the iMac light ENDS blinking
>You will hear a BEEP sound
>The iMac will start the EFI update (a progress bar should be displayed)
>Wait the EFI update to complete and….. Voila!

*Credits:<br>
http://forum.netkas.org/index.php/topic,1122.0.html<br>
http://forum.netkas.org/index.php/topic,1122.msg38747.html#msg38747*<br>
*Sources:<br>
https://support.apple.com/kb/DL305?viewlocale=en_US&locale=en_US<br>
https://support.apple.com/kb/DL205?viewlocale=en_US&locale=es_ES*

### Step 2 - Upgrade your CPU to a Core 2 Duo
I upgraded to a 2.0GHz T7200, which can be found on ebay for under $4. However, best performance is the T7600 which is a 2.33GHz CPU. This hardware upgrade is necessary to have a 64-bit CPU available for the operating system. Here's an ifixit link:
https://www.ifixit.com/Guide/iMac+Intel+20-Inch+EMC+2105+and+2118+CPU+Replacement/35350

It's possible that you could find success without upgrading the CPU and sticking to a 32-bit operating system. Windows is the only OS to have an up-to-date Chrome package available in 32-bit as of Feb 2020. I chose to go to 64-bit to future-proof the machine a bit. *As of this writing, there is still a current up-to-date 32-bit Chrome available for Windows: https://cloud.google.com/chrome-enterprise/browser/download/

You may also want to consider installing a SSD drive at this point. I used a Samsung SSD with a 3.5" to 2.5" SATA carrier with great success, and even reused the temperature sensor. You can use an external SATA mount to read/write and I used SuperDuper! to backup the old drive to the SSD which worked perfectly under Catalina.

### Step 3 - Partition your drive with Bootcamp
Go into your installed MacOS and setup a bootcamp partition. You don't need your Windows install media or anything, just get the partition set up. It also sets up the emulated BIOS needed for windows to operate.

### Step 4 - Get your Windows 7 DVD ready
Download Windows 7 Professional. I downloaded from the legal Internet Archive, where it can be found here:
https://archive.org/details/Windows7Professional64Bit

You may already have a Windows 7 DVD. Here's the problem: when you boot this disk, you get prompted to make a choice about installation; the installer will ask you to make a selection and the keyboard will appear to not work. It will ultimately fail due to the 32-bit EFI and 64-bit CPU. So to remedy this you need to build a new ISO after using the *Oscdimg* tool. *Oscdimg* is a command-line tool that you can use to create an image (.iso) file of a customized 32-bit or 64-bit version of Windows Preinstallation Environment (Windows PE). Download it here:
https://github.com/jasoncopp/imac4-1-to-windows10x64/blob/master/image-creating-tool/oscdimg.zip

Extract the Windows 7 ISO to a folder on a Windows PC. Then, go to an appropriate location and run the *Oscdimg* tool from the cmd prompt with this format, substituting the proper folder names, etc:
`oscdimg -n -m -bc:\windows7contents\boot\etfsboot.com c:\windows7contents c:\newwindows7dvd\newwindows7dvd.iso`

Burn this new ISO to a DVD.

*Credit: https://www.jackfeschuk.com/fixing-select-cd-rom-boot-type-when-installing-64bit-windows/*

### Step 5 - Install Windows 7 with no product key or Bootcamp drivers
Now, boot the mac while holding Option after the chime. When you insert this newly created DVD, you will be able to choose it from the boot menu, which will install Windows 7. Skip entering a Windows Key, and don't bother to find any drivers for it, as we're going to blow away this Windows with a new install later. This step is because the Windows 10 installer doesn't do well with the 32-bit EFI and 64-bit CPU, even when booting from DVD. It can cause issues during the install or afterwards. Using Windows 7 to start seems to avoid this problem.

### Step 6 - Install Windows 10
I installed Windows 10 from USB from within Windows 7. It renames the Windows folder to Windows.old which you can delete later. I actually went to an older version of Windows 10 initially, then to a newer one, but I think you can go directly to the latest Windows 10 ISO available from Microsoft's website:
https://www.microsoft.com/en-ca/software-download/windows10ISO

### Step 7 - Get the Bootcamp drivers
For my Early iMac 2006 17" machine, I needed the *BootCamp4.0.4033.zip* file. When you try to get the Bootcamp support file from MacOS (10.6.8, in my case) it gives an error downloading it. That's because this URL is no longer valid:
https://support.apple.com/kb/DL1630?locale=en_US

You'll notice it goes to a CDN that tries to serve *BootCamp4.0.4033.zip* but fails, so I found a working copy and uploaded it here to this repo:
*insert url here*

If you're doing this upgrade on a slightly different machine, these drivers might not be the right ones, in which case you'll have to find the best suited Bootcamp zip file for your machine. Another good candidate for a lot of machines is *BootCamp5.1.5621.zip*, which is still available from Apple directly:
http://support.apple.com/downloads/DL1720/en_US/BootCamp5.1.5621.zip

## Step 8 - Graphics Drivers

Now, here's a problem. I found that NO drivers worked for my ATI Radeon X1600 graphics card. You might have success with the Bootcamp driver found at `/Drivers/Apple/x64/AppleDisplayInstaller64.exe` inside the *Bootcamp4.0.4033.zip* but mine didn't work. So, I found these drivers for the ATI Mobility FireGL V5200 which includes support for the x1600 located at `http://www.catalog.update.microsoft.com/Search.aspx?q=v5200`. However, the cab extracts strangely so I've made a zip file bundle in this repo which has all the files and the duplicate folder under which allow it to install.

In order to install them, you must:
 - download the file `ati-drivers.zip` from this repo at https://github.com/jasoncopp/imac4-1-to-windows10x64/blob/master/video-drivers/ati-drivers.zip
 - unzip the files in a folder of your choice
 - browse to device manager
 - right click on the video driver
 - upgrade driver
 - Browse for driver software ...
 - Let me pick from list of device drivers ...
 - Have disk
 - Browse to where you unpacked package with drivers
 - Only click on Open with selecting first inf of listed
 
Then, proceed with the driver installation.

## Step 9 - Install Remaining Drivers
Open up the Bootcamp drivers, and look in the Drivers folder. There are loads of drivers, but don't install them all, instead, take an inventory of what is not working and find the specific driver for each. On the iMac4,1 it needs (and in order, sometimes):

 - /Drivers/Apple/x64/AppleBluetoothEnablerInstaller64.exe
 - /Drivers/Apple/x64/AppleBluetoothInstaller64.exe
 - /Drivers/Apple/x64/AppleiSightInstaller64.exe
 - /Drivers/Apple/x64/AppleKeyboardInstaller64.exe
 - /Drivers/Apple/x64/AppleMultiTouchTrackPadInstaller64.exe
 - /Drivers/Apple/x64/AppleNullDriver64.exe (Performance Counters device)
 - /Drivers/Apple/x64/AppleODDInstaller64.exe
 - /Drivers/Apple/x64/AppleTrackpadInstaller64.exe
 - /Drivers/Apple/x64/AppleWirelessMouse64.exe
 
 ## Step 10 - Make it more 'Mac-like'
This is an entirely option series of steps which you can omit any or all of. I performed these because I'm using a Mac keyboard, and I use a Mac in regular use; switching back to a Windows keyboard is difficult for me.

For me the main criteria for "mac-like" doesn't include anything visually; it's **all** about the keyboard shortcuts. For a bare minimum I installed SharpKeys (https://www.randyrants.com/category/sharpkeys/) and swapped the Ctrl and the Windows (Command) key. This puts the Ctrl-z,x,c,v,b,a keys in the right place for me. Next, I used AutoHotKeys (https://www.autohotkey.com/) to make Ctrl-Q perform Alt-F4 and Ctrl-Tab perform Alt-Tab, and made Alt-Tab do the old Ctrl-Tab code. For hardware monitoring, I installed Macs Fan Control for Windows (https://www.crystalidea.com/macs-fan-control) which worked beautifully.

Here's a snapshot of my SharpKeys settings:
https://raw.githubusercontent.com/EverlastEngineering/imac4-1-to-windows10x64/master/sharpkeys-autohotkeys/sharpkeys.png

And here you can download the save file for it:
https://github.com/EverlastEngineering/imac4-1-to-windows10x64/blob/master/sharpkeys-autohotkeys/Mac%20SharpKeys.skl

And finally, here's the AutoHoyKey script to help with command-q, command-tab and command-space for spotlight:
https://github.com/EverlastEngineering/imac4-1-to-windows10x64/blob/master/sharpkeys-autohotkeys/Simple%20Mac%20Hotkeys.ahk
