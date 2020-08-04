# Installation

## General Linux (raspi)
 The scripts here are using bash, git (and probably some other bits)

It was initially developed with the QAN (Quick and Nasty) principle.

## Install Dependencies

#### Aug-2020 this is not needed ?
python serial

```
$ rpi-rw
$ sudo apt-get install python-serial
```


### Install nextiondriver

Newer versions of pi-star seem to partially install NextionDriver

Here are the remaining steps

```
rpi-rw
cd      # is expecting to be running from $HOME
git clone https://github.com/on7lds/NextionDriverInstaller.git
cd NextionDriverInstaller
sudo ./NextionDriver_ConvertConfig /etc/mmdvmhost
sudo cp nextiondriver.service.binary.pistar /usr/local/sbin/nextiondriver.service
sudo cp mmdvmhost.service.pistar /lib/systemd/system/mmdvmhost.service
sudo cp nextiondriver.service.pistar /lib/systemd/system/nextiondriver.service
sudo systemctl daemon-reload
```

NextionDriver and all its functions are now setup and should stop/start as required.




Otherwise:
Install the on7lds nextiondriver if not already done

```
rpi-rw
cd /tmp
git clone https://github.com/on7lds/NextionDriverInstaller.git
sudo NextionDriverInstaller/install.sh
```

 - Optional: install from home folder rather than tmp o look at examples

Check that appropriate settings have been configured in /etc/mmdvmhost


Recommend the following changes:

- Parameter ShowModesStatus=1

### Old process required manual edit of mmdvmhost - this should now be accomplished by the scripts above.

You have to manually edit the file /etc/mmdvmhost to add this

~~~
[NextionDriver]
Port=/dev/ttyUSB0
LogLevel=2
DataFilesPath=/usr/local/etc/
GroupsFile=groups.txt
DMRidFile=stripped.csv
removeDim=0
SleepWhenInactive=600
ShowModesStatus=1
~~~

- Stongly recommend setting DisplayClock to 0 in Nextion section

~~~
[Nextion]
Port=/dev/ttyNextionDriver
Brightness=50
DisplayClock=0
UTC=0
ScreenLayout=4
IdleBrightness=20
~~~

- Contrary to other instructions you do not need to remove DMR Id Lookup, this allows the web pages to continue getting good translations

~~~
[DMR Id Lookup]
File=/usr/local/etc/DMRIds.dat
Time=24
~~~


### Use setNextion to identify a valid screen for your device

The Pi-Star switcher screen templates have the format:

Switcher*X*_*nn*_*Type*.tft

Where:

- *X* is D  for dual mode hotspot, S for single mode hotspot.
- *nn* is the screen size 35 for 3.5 and 32 for 3.2 (more coming!)
- *Type* is Basic or Enhanced


Pi-Star switcher screens support OTA updates, we just have to correctly configure and load the first screen.


~~~
$ setNextion -l
/home/pi-star/Pi-Star_switcher/Nextion/SwitcherD_32_Basic.tft
/home/pi-star/Pi-Star_switcher/Nextion/SwitcherD_32_Enhanced.tft
/home/pi-star/Pi-Star_switcher/Nextion/SwitcherD_35_Basic.tft
/home/pi-star/Pi-Star_switcher/Nextion/SwitcherS_32_Basic.tft
/home/pi-star/Pi-Star_switcher/Nextion/SwitcherS_35_Basic.tft
/home/pi-star/Pi-Star_switcher/Nextion/SwitcherS_35_Enhanced.tft

~~~

In this case shows several screens available. The setNextion will create a link to the proper file for your system, you should only need to run it once.

~~~
setNextion
Usage: setNextion [ -h|-v|-l] [-s 32|35 -t B|E -m S|D]

     -l list screens
     -s 35 -t B|E -m S|D
     -h  This help text
     -v   version

Example: setNextion
Need to specify -s screensize 32 (3.2) or 35 (3.5)
	           -t  type is B basic or E enhanced
	           -m  mode is D dualhat or S singlehat
 Currently little or no checking
~~~

 In this example I'm installing a 3.5, Enhanced for a Single mode hotspot.


```
$ cd
$ setNextion -s 35 -t E -m S
```

- optionally checking the result

```
$ ls -al /usr/local/etc/NX*
lrwxrwxrwx 1 root bin 64 Aug 30 19:31 /usr/local/etc/NX4832K035.tft -> /home/pi-star/Pi-Star_switcher/Nextion/SwitcherS_35_Enhanced.tft
$ ls -al configs/Sw*
lrwxrwxrwx 1 pi-star pi-star 64 Aug 30 19:31 configs/Switcher.tft -> /home/pi-star/Pi-Star_switcher/Nextion/SwitcherS_35_Enhanced.tft

```

- load the template to the Nextion Device

```
$ sudo -i
#
swstopstart stop
cd /home/pi-star/Pi-Star_switcher/Nextion
ps -ef

python nextion.py /home/pi-star/configs/Switcher.tft /dev/ttyUSB0


Trying with baudrate: 2400...
Trying with baudrate: 4800...
Trying with baudrate: 9600...
Connected with baudrate: 9600...
Status: #???comok
Touchscreen: yes
Model: NX4832K035_011R
Firmware version: 99
MCU code: 61699
Serial: DB682C37CB353333
Flash size: 33554432
Downloading, 100.0%...
File transferred successfully
root@nano-vk2lj(ro):Nextion#
```

- initial screen should now be loaded, now reboot the Pi

```sudo reboot```
