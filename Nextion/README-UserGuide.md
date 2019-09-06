
# User Guide for the supplied screen templates

## The current screens generally support the following:

- MMDVM Dual or Single hot spots.
- Designed to operate in conjunction with ON7LDS Nextion Driver to support buttons
- Originally designed around switching between different profiles (ie IPSC, BrandMeister, YSF etc.) and restarting MMDVM.
 	- Use the standard web page to configure your settings then store the profile using the switcher screen.
	- configure different settings and store in a different profile.
	- use the touch screen to switch profiles.
	- sometimes after updates from pi-star new params are created. Just check settings and overwrite your profile storage.
- PiStar tends to automatically update its user base from time to time.
	- The update users button will force an update from the main locations for both pi-star and on7lds extended data.
- Loading new screen templates after updates.
- Reboot of Pi.
- Missing screens
	- POCSAG
	- xXxX



## Basic screens

### Pi-Star switcher functions


![Pi-Star_switcher Menu](images/pss-menu.png?raw=true "Menu Screen")

Menu page is generally reached by tapping in the area of the top centre icon of pages or the Menu button on some pages. From here choose other pages to go to.


![Pi-Star_switcher Switcher](images/pss-switcher.png?raw=true "Switcher Screen")

Switcher screen allows selection of profiles to load or store. As well as updating the user data.
- *Stat* button tries to determine which profile is active.
- *List* button looks for list of stored profiles
- *upd* button (overwrite set) will get and install latest version of Pi-Star switcher software from cloud.
- *0*, *1*, *2*, *3* - are storage locations. Currently they store with the labels 0-ipsc, 1-dmrg, 2-bmei, 3-ysfg. but these have no implication as to what can be stored. Future version should make labels configurable.




![Pi-Star_switcher Overwriting](images/pss-overwrite_protection.png?raw=true "protection from overwriting")

If you just press one of the store buttons or update button, it will return an error.

![Pi-Star_switcher Overwrite button](images/pss-overwrite.png?raw=true "overwrite button")

Toggle the overwrite protection by pressing over write once (turns red)
then you can select your overwritng function.


![Pi-Star_switcher Store a config](images/pss-storeconfig.png?raw=true "Store a Config")

In this examples the current values of the profile are stored in profile 0-ipsc.

![Pi-Star_switcher System Page 2](images/pss-system2.png?raw=true "System Page 2")


System 2 page has -
- Poweroff
- Reboot  
- Upload Nextion Screens
- Update users
- Restart MMDVMHost
- System Date - used to check that we are talking to Host


### specific to sample pages

![Pi-Star_switcher System Page 1](images/pss-system1.png?raw=true "System Page 1")

System 1 Page Generally has 3 or 4 fields

- AutoSwitch  -This enables switching between MMDVM and Info Page (currently disabled to stabilise the other screens hopefully back soon, the counter was a temperature variable that seems to have been removed from frequent update at Pi-Star end)
- DMR 2 - This view is a list view of stations very good during larger nets
- Extdata - Use the Extended data from on7lds nextiondriver

- Refresh bar - some pages still have the autoswitch refresh bar this is a slider with actually 5 positions to set how quickly MMDVM and Info Pages swap around.

Note that the autoswitch only operates when there is no traffic, as soon as traffic occurs that page is switched to and on return the counters start again.


Placeholders

![Pi-Star_switcher MMDVM](images/pss-menu.png?raw=true "Menu Screen")

![Pi-Star_switcher DMR1](images/pss-menu.png?raw=true "Menu Screen")

![Pi-Star_switcher DMR2](images/pss-menu.png?raw=true "Menu Screen")

![Pi-Star_switcher DStar](images/pss-menu.png?raw=true "Menu Screen")

![Pi-Star_switcher P25](images/pss-menu.png?raw=true "Menu Screen")

![Pi-Star_switcher Fusion](images/pss-menu.png?raw=true "Menu Screen")
