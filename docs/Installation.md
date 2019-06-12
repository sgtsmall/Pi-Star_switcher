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

Has very small filesystem configured expand the filesystem to the rest of the internal space.

```
sudo pistar-expand
```

then reboot

### raspberry pi zero (Jumbospot, and similar builds)

```
rpi-rw
git clone https://github.com/on7lds/NextionDriverInstaller.git
sudo NextionDriver/install.sh
```

Install the NextionDriver in the home folder to have access to sample filesystem


Now install this software

```
rpi-rw
git clone https://github.com/sgtsmall/Pi-Star_switcher
cd Pi-Star_switcher
sudo make install
sudo make install-list
sudo make install-user
swupdateuser
cd

```
FYI
* "install-list" generates a list of sub programs that pi-star has installed
* "install-user" loads initial set of groups and users that are used in the display
* "swupdateuser" retrieves the latest list of user id to callsign.



Help for options is available
```switcher -h```


For updates

```
rpi-rw
cd Pi-Star_switcher
git pull origin master
sudo make install
```


### Pi-Star - mobile

these are great mobile device web pages

```
rpi-rw
sudo wget -O /tmp/pi-star.mobile.install.sh http://www.w0otm.com/pistar/pi-star.mobile.install.sh
sudo chmod 555 /tmp/pi-star.mobile.install.sh
sudo /tmp/pi-star.mobile.install.sh
```


script to download data sudo wget -O /var/www/dashboard/mobile/data.csv http://www.amateurradio.digital/pi-star_data.php
