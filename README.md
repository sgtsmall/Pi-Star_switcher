# Pi-Star_switcher
Scripts to manage switching between multiple profiles in Pi-Star
Originally developed to support Nextion touch screen change.
Lots to do
Relies on functionality of NextionDriver by ON7LDS

## Aug 19 Screen development is being done in Nextion 0.53 LTS version I had a quick try with 0.58 and everything blew up!



1.1.1 28Aug19 - minor script change for setNextion initial testing on Pi-Star 4.1 Beta is all good.
1.1.0 25Dec18


## HotSpots tested

* Raspi
  * "JumboSpot"
  * MMDVM_HS_Dual_Hat "1.0"
  * MMDVM_HS_Dual_Hat "1.3"
  * DVMEGA UHF

* Nano
  * Nano-Spot


## Screens tested

* Basic
  * 400x240 3.2
  * 480x320 3.5

* Enhanced
  * 400x240 3.2
  * 480x320 3.5

![Pi-Star_switcher Menu](docs/images/pss-menu.png?raw=true "Menu Screen")

## Additional Features

switcher also has additional features not found in other better programs!.

* added script swstopstart to stop and start and restart services. don't run stop from Nextion
* Folder Nextion contains some sample tft and HMI files
* it also has the nextion.py function to try and load the tft to the screen
* also a userid updater for the Nextion...
* need to find a way to deal with breaking the web page lookup of user data for the standard screen, you have to turn it off if you want the extended data, mobile screen works off it's own data file so it's ok.

* and a set of steak knives
* ok so not really that last bit.

## Installation

See: https://github.com/sgtsmall/Pi-Star_switcher/tree/master/docs/Installation.md

note in your Expert settings for NextionDisplay  make sure you have /usr/local/etc/  (trailing / ) in the the data file directory entry, or you too could spend a couple of hours going around in circles.

## Documentation

```
Usage: switcher [ -i|-l|-s profile|-X profile [-O]]

      -i  return current matched profile
      -h  This help text
      -l  return current list of profiles
      -s profile  replace mmdvmhost
      -t   as yet unspecified test
      -v   version
      -X profile  copy current mmdvmhost etc to configs/profile
      -O  option to -X to confirm overwrite

      -U -O  update switcher from git requires -O as confirmation

         profile stored as Xn-YYYY
             X - internal value based on config ie m - mmdvmhost d - dstargateway y - ysfgateway ...
             n - user supplied profile number e.g. 0
             YYYY - user supplied short name
       TIDY UP syntax of X and s ie   X needs  0-ipsc to create m0-ipsc s just needs 0 or ipsc

            profile field will search for  n or YYYY or n-YYYY
      files stored as '$CONFDIR'/$profile/m0-xxxx and a tar file

      /home/pi-star/configs/0-ipsc/0-ipsc.tgz  and
      /home/pi-star/configs/0-ipsc/m0-ipsc (copy of mmdvmhost for quick comapre)

      Example: $(basename $0) -X 2-bmei
      Will copy current mmdvmhost, dmrgateway, ...  into configs folder as 2-bmei
       If this profile already exists use append -O to confirm overwriting

       $(basename $0) -s 0 or
       $(basename $0) -s ipsc or
       $(basename $0) -s 0-ipsc
      Will restore thefiles from the stored profile ... and restart
```

```
Usage: swstopstart [stop|start|restart]

      stop  stop pistar mmdvm services
      start start pistar services
      restart   converts start to restart of pistar services

```

# setNextion

  will create sym link from a Nextion tft file to the configs directory

```
Usage: setNextion [ -h|-v|-l] [-s 32|35 -t B|E -m S|D]"

	-l list screens"
     	-s 35 -t B|E -m S|D"
     	-h  This help text"
     	-v   version"

Example: setNextion -s 35 -t B -m S

	Need to specify -s screensize 32 (3.2) or 35 (3.5)"
              	-t  type is B basic or E enhanced"
   	           -m  mode is D dualhat or S singlehat"
     Currently little or no checking"
```

This file can then be loaded via the upload Nextion button on screen.



There will be lots of documentation here: https://github.com/sgtsmall/Pi-Star_switcher/tree/master/docs (oneday)

## Support


ideas and questions can be handled on the https://vk2bv.org website soon

## Videos

Maybe

## Contributing

Contributions are welcome and encouraged.  You can contribute in many ways:

* Documentation updates and corrections.
* How-To guides - received help?  help others!
* Bug fixes.
* New features.
* Telling us your ideas and suggestions.

Next place is the github issue tracker:

https://github.com/sgtsmall/Pi-Star_switcher/issues

Before creating new issues please check to see if there is an existing one, search first otherwise you waste peoples time when they could be coding instead!
