# Installation

## General Linux (raspi)
 The scripts here are using bash, git (and probably some other bits)

It was initially developed with the QAN (Quick and Nasty) principle.

## Install Dependencies

command line: none

as pi-star installs most of the bits needed

Touch Screen:

Dependent on NextionDriver functionality for touch screen

Use this installer script on pi-star [Github on7lds NextionDriverInstaller](https://github.com/on7lds/NextionDriverInstaller)

Here is the package which contains several detailed readme files
[Github on7lds NextionDriver](https://github.com/on7lds/NextionDriver)


- start with clean img (3.4.x tested ok, 4.1 beta sort of works still testing)
- (copy wpa_supplicant to boot and reboot)
 - or use new autoap feature
- Make sure you only add the proper wifi and reboot at this stage otherwise pi-star starts tring to set lots of things which are impacted by no real network.

- Pi-star setup hostname callsign location apply then update
- plug in display and setup (/dev/ttyUSB0)
- NextionDriverInstaller Install (will find the config entry of USB0 and fix the config files)
- Install Pi-star switcher

### Nano-spot

Has very small filesystem configured expand the filesystem to the rest of the internal space.

```
sudo pistar-expand
```

then reboot

### raspberry pi zero (Jumbospot, and similar builds)


```
rpi-rw
cd      # is expecting to be running from $HOME
git clone https://github.com/sgtsmall/Pi-Star_switcher
cd Pi-Star_switcher
sudo make install
sudo make install-list  
sudo make install-user  
swupdateuser  
cd
```

FYI
- "install-list" generates a list of sub programs that pi-star has installed
- "install-user" loads initial set of groups and users that are used in the display
- "swupdateuser" retrieves the latest list of user id to callsign.



Help for options is available

``switcher -h``


For updates use

``switcher -U -O``


### Now proceed with the Nextion Display install

[docs/Installer-Nextion.md]

### Optional - Pi-Star - mobile

these are great mobile device web pages not sure of the future of these.

```
rpi-rw
sudo wget -O /tmp/pi-star.mobile.install.sh http://www.w0otm.com/pistar/pi-star.mobile.install.sh
sudo chmod 555 /tmp/pi-star.mobile.install.sh
sudo /tmp/pi-star.mobile.install.sh
cd /var/www/dashboard/mobile
sudo rm data.csv
sudo ln -s /usr/local/etc/stripped.csv data.csv
```

These last 3 steps link the user data files so you just need to update one.
