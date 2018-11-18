# Pi-Star_switcher
Scripts to manage switching between multiple profiles in Pi-Star
Originally developed to support Nextion touch screen change.
Lots to do
Relies on functionality of NextionDriver by ON7LDS

0.9.8rc4 19Nov18

## HotSpots tested

* Raspi
  * "JumboSpot"
  * MMDVM_HS_Dual_Hat "1.0"
  * MMDVM_HS_Dual_Hat "1.3"

* Nano


## Screens tested

* Basic
  * 400x320 3.2

* Enhanced
  * 400x320 3.2


## Additional Features

switcher also has additional features not found in other better programs!.

* added script swstopstart to stop and start and restart services. don't run stop from Nextion
* Folder Nextion contains a sample tft
* it also has the nextion.py function to try and load the tft to the screen
* and a set of steak knives
* ok so not realy that last bit.

## Installation

See: https://github.com/sgtsmall/Pi-Star_switcher/tree/master/docs/Installation.md

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
This can be used with the nextion.py function
e.g.

```
cd Nextion
swstopstart stop
python nextion.py SwitcherD_32_Enhanced.txt /dev/USB0
swstopstart start
```





There will be lots of documentation here: https://github.com/sgtsmall/Pi-Star_switcher/tree/master/docs (oneday)

## Support

ideas and questions can be handled on the https://vk2bv.org website soon

## Videos

Maybe

## Configuration Tool


The source for it is here:

https://github.com/sgtsmall/Pi-Star_switcher/etc/placeholderforconfigurationtool

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

## Developers

Please refer to the development section in the coming soon


## Pi_Star switcher Releases
https://github.com/sgtsmall/Pi-Star_switcher/releases
