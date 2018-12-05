# Installation

## General Linux (raspi)
 The scripts here are using bash, git (and probably some other bits)

It was initially developed with the QAN (Quick and Nasty) principle.

## Install Dependencies

command line: none

as pi-star installs most of the bits needed

Touch Screen:

Dependent on NextionDriver functionality for touch screen

https://github.com/on7lds/NextionDriver

https://github.com/on7lds/NextionDriverInstaller

* start with clean img
* copy wpa_supplicant to boot and reboot
* Pi-star setup hostname callsign location apply then update
* plug in display and setup (/dev/ttyUSB0)
* NextionDriver Install (will find the config entry of USB0 and fix the config files)
* Install Pi-star switcher
* extra notes here about nextion.py later

### Nano-spot

Has very small filesystem follow the NextionDriver install procedure to put the files in tmp

'''
cd /tmp
git clone https://github.com/on7lds/NextionDriverInstaller.git
sudo NextionDriver/install.sh
'''

### raspberry pi zero (Jumbospot, and similar builds)

Install the NextionDriver in the home folder to have access to sample filesystem


'''
cd


### Pi-Star - raspi

```
rpi-rw
git clone https://github.com/sgtsmall/Pi-Star_switcher
cd Pi-Star_switcher
sudo make install
cd

```

Then run
```switcher -h```


For updates

```
rpi-rw
cd Pi-Star_switcher
git pull origin master
sudo make install
```
