# Linux-Installation-and-Error-Require-Log

2016.07

Mint Linux

It is close to the Windows environment and lightweight. It is installed beside windows on another hard drive for practice purposes. 

2016.09

Mint does not have a large community like Ubuntu does. This point, I have understood the basics of the Shell environment to navigate and do basic commands in Linux. Stilling learning permission levels and file system arrangement. 

2017.09

Ubuntu Linux 2014 LTS (Long Term Support)

Burning the image onto the USB with Rufus. (Using the current existing Windows 10). The installation was intuitive following the interface. 

This installation wipes entire hard drive and applies encryption. 

2017.10

Ubuntu randonly crashes and display is blinking sometimes. Suspected to be intel graphics card having fault compatibility issues, however it results from lacking proper nvidia drivers since it is LTS. 

2017.11

Ubuntu Linux Upgrade to Non-LTS version

Due to the fact the LTS version of Ubuntu is ridiculously outdated on software, I needed to renew the computer operating system. The latest Ubuntu does not include updated keyboard and trackpad drivers, none seems to work other than external keyboards and mouse. 

Take: Read the message boards and forums before upgrading anything!!!

2017.12

At this point, Ubuntu interface is too much like Windows despite the fact it is a linux environment, work efficiency is not dramatically increased. Decided to switch to tiling windows manager. (i3)

2018.01

Decides to change to Arch Linux for its light-weight, complete customizability and rolling update nature.

Installation Process:

1st Attempt:

Packages were not properly downloading, did not change the mirrorlist, it was fetching data from a Chinese server and laptop died on battery. 

2nd Attempt

Changed the mirrorlist, download were successful, did not download proper dkms driver.

3rd Attempt

-> Did not set locale
-> Did not properly set up Nvidia optimus

4th Attempt

-> Succesful installation, yet is using nouveau rather than Nvidia driver.


2018.03

Changed nouveau to Nvidia and set up proper scripts to deal with hybrid graphics. Blacklist caused system to have black screen during boot, it is resolved by adding nouveau to blacklist. 

Please do add nouveau to blacklist and then reboot, the system will automatically look for nouveau and ignore nvidia therefore resulting in blackscreen. 

2018.05

Updating system caused system crash and falling back to previous version. Closer examination shows it should not be dkms but bbswitch-dkms when installing dkms drivers. 

2018.07

Updating system caused system to crash and falling back to previous version. Later refreshing the repository and further updates fixed the issue, do not know what seems to be the problem. 

2019.01

Updating system cause system to crash and forced shutdown was applied, it cause full-scale system crash, downgrading all packages does not work, full reinstallation of the system was required. 

2019.03

After installing the system, upgrading the system causes error. 


-- Reboot --
Mar 12 11:46:48 MichaelWS systemd-modules-load[278]: Inserted module 'crypto_user'

Mar 12 11:46:48 MichaelWS systemd-modules-load[278]: Failed to insert module 'vboxdrv': Exec format error

Mar 12 11:46:48 MichaelWS systemd-modules-load[278]: Failed to insert module 'vboxpci': Exec format error

Mar 12 11:46:48 MichaelWS systemd-modules-load[278]: Failed to insert module 'vboxnetadp': Exec format error

Mar 12 11:46:48 MichaelWS systemd-modules-load[278]: Failed to insert module 'vboxnetflt': Exec format error

Mar 12 11:46:48 MichaelWS systemd[1]: systemd-modules-load.service: Main process exited, code=exited, status=1/FAILURE

Mar 12 11:46:48 MichaelWS systemd[1]: systemd-modules-load.service: Failed with result 'exit-code'.

Mar 12 11:46:48 MichaelWS systemd[1]: Failed to start Load Kernel Modules.

-- Reboot --

Mar 12 12:00:00 MichaelWS systemd-modules-load[275]: Inserted module 'crypto_user'

Mar 12 12:00:00 MichaelWS systemd-modules-load[275]: Failed to insert module 'vboxdrv': Exec format error

Mar 12 12:00:00 MichaelWS systemd-modules-load[275]: Failed to insert module 'vboxpci': Exec format error

Mar 12 12:00:00 MichaelWS systemd-modules-load[275]: Failed to insert module 'vboxnetadp': Exec format error

Mar 12 12:00:00 MichaelWS systemd-modules-load[275]: Failed to insert module 'vboxnetflt': Exec format error

Mar 12 12:00:00 MichaelWS systemd[1]: systemd-modules-load.service: Main process exited, code=exited, status=1/FAILURE

Mar 12 12:00:00 MichaelWS systemd[1]: systemd-modules-load.service: Failed with result 'exit-code'.

Mar 12 12:00:00 MichaelWS systemd[1]: Failed to start Load Kernel Modules.

This appears to be that the latest kernel does not hold such modules since downgrading only modules and nvidia will suffice. Yet it is still unknown to what the cause of the issue is.


2019.04

The same problem persists. It appears to be a dependency issue, requires further examination to what dependencies does virtualbox and the linux kernel require. 

-- Reboot --
Apr 28 20:14:21 MichaelWS systemd[1]: Starting Load Kernel Modules...

Apr 28 20:14:22 MichaelWS systemd-modules-load[584]: Failed to insert module 'vboxdrv': Exec format error

Apr 28 20:14:22 MichaelWS systemd-modules-load[584]: Failed to insert module 'vboxpci': Exec format error

Apr 28 20:14:22 MichaelWS systemd-modules-load[584]: Failed to insert module 'vboxnetadp': Exec format error

Apr 28 20:14:22 MichaelWS systemd-modules-load[584]: Failed to insert module 'vboxnetflt': Exec format error

Apr 28 20:14:22 MichaelWS systemd[1]: systemd-modules-load.service: Main process exited, code=exited, status=1/FAILURE

Apr 28 20:14:22 MichaelWS systemd[1]: systemd-modules-load.service: Failed with result 'exit-code'.

Apr 28 20:14:22 MichaelWS systemd[1]: Failed to start Load Kernel Modules.


2019.05.02

The same problem persists. 

From kernel 4.20.11 to kernel 5.0.10.

The kernel upgrades and installs correct dkms modules while upgrading. (yay -Syu).

However, the immediate reboot shows systemd-modules.load.service and ufw.service are not loaded. (systemctl --failed)

Further examination to journalctl -u systemd-modules-load.service shows systemd-modules-load.service: Succeeded. 

However, due to the fact uname -a still yields 4.20.11 as the current kernel, it was obvious that it was not upgrading.

Therefore, after 4 month of trying, it is clear that I am stuck to this kernel (4.20.11) for some reason. 

2019.05.06

Note, the above issue is the result of not writing fstab file, normally located in /etc/fstab. 

Either run genfstab before you finishes your installation or you may read the documentations and write fstab by yourself. 

https://wiki.archlinux.org/index.php/Fstab

However, if you don't have fstab, you can still boot and upgrade modules and software. It is only because with the lack of fstab, your boot partition is not mounted automatically therefore when update command is ran, the kernel itself is not upgraded hence resulting in the inconsistences. 



Configurations: Note if you are going to use them, be careful of the directories, you may need to change them to fit your system. 

Conky and i3-bar effects are:


![alt text](https://github.com/gnxn/Linux-Installation-and-Error-Require-Log/blob/master/Example.png)
