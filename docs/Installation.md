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
