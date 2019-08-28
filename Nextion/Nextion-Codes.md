
# Programming notes for Nextion displays

 
## code types sent by MMDVMHost

page *XXX* - switch to page *XXX*

MMDVM.status=*n* - status code *n*

t*n*="*aaa*" - t variable string content *aaa*

t*n*=*nn* - t variable integer content *nn*

Additional instructions generally to Nextion controller independent of page.

- click S0,1 ("press event trigger for S0 button")
- sleep=*n* - 0 exit sleep, 1 enter sleep
- dim=*n* - Backlight level
- ussp=*n* - "no serial" sleep timer seconds
- thup=*1* - Auto Wake on Touch (0 - Off, 1 On)

page *X* can be page name or page index entry.

All 'MMDVM.status.val=*n*' also sends 'click S0,1'

'MMDVM.status.val=*n*'' is sent after it's data has been sent it is a flag to update the appropriate screen values.

## notes -
- several types of data are sent with font codes and colours, you can override these by assigning the value to a localvar va*x*=t*n* and then locally set the visibility of the t*n* field.
- TA Talker Alias data is sent by some radios on some networks so you usually end up with just the ID in this field.
[Roger VK3KYY detailed blog about Talker Alias](https://www.rogerclark.net/dmr-talker-alias/)
- The biggest problem at the moment is occasionally I miss the switch over from standby (Page 0) to DMR (page 1) or in my case one of 4 different DMR pages, from then on the data on the front screen may be mangled.
I am looking at adding extra logic, if page 0 sees a status value belonging somewhere else it will jump to that page. It should start picking things up from there.


### Extra Fields With on7lds nextiondriver

Callsign Name lookup uses

~~~
/usr/local/etc/groups.txt
/usr/local/etc/stripped.csv
~~~

MAXGROUPS (1500)
MAXUSERS(200000)

is currently coded, presumably he will look further if required.


I have written the script *swupdateuser* to refresh this data.

(Need to improve the group handling e.g. TG 5)

Additional codes

**MMDVM**
- page MMDVM
- t20 [MM]: CPU temp
- t21 : CPU freq
- t22 : system load
- t23 : %disk free
- cpuload : integer value of the system load in %
- t30 [MM] Hotspot RX frequency (from MMDVM.ini)
- t31 [MM] Hotspot location (from MMDVM.ini)
- t32 [MM] Hotspot TX frequency (from MMDVM.ini)
  - MMDVM.status.val=24

[MM] Note : these are now sent by MMDVMHost anyway

bco and pco are colour change values, this lets you set red/green etc.
#define bcoEN	1472
#define bcoDIS	25356
#define pcoEN	0
#define pcoDIS	46486

|Type|Net|DSTAR|DMR |YSF |P25 |spare|NXDN|
|----|---|-----|----|----|----|----|----|
|Mode|   | A1  | A2 | A3 | A4 | A5 | A6 |
|link| N0| N1  | N2 | N3 |N4  | N5 | N6 |

'A1.bco=%d'

 - MMDVM.status.val=24

A* and N* when showModesStatus is active



**DMR**
- t8.txt="%s",TGname //Slot 2
- t9.txt="%s",TGname //Slot 1

Slot 2

There is no logic here it will pull the field from the stripped.csv file.

- t13.txt="%s",users[user].data1  //Callsign
- t14.txt="%s",users[user].data2  //Name
- t15.txt="%s",users[user].data3  //City
- t16.txt="%s",users[user].data4  //State
- t17.txt="%s",users[user].data5  //(blank)
 - MMDVM.status.val=78

Slot 1

- t18.txt="%s",users[user].data1
- t19.txt="%s",users[user].data2
- t20.txt="%s",users[user].data3
- t21.txt="%s",users[user].data4
- t22.txt="%s",users[user].data5
 - MMDVM.status.val=68



**Startup**
- sleep=0
- page 0
- cls 0
- dim=100
- t0.txt="NextionDriver"
- t1.txt="%s"",NextionDriver_VERSION);
- t2.txt="Started"
- ussp=%d",sleepWhenInactive);
- thup=1
timed loop (180 seconds)
- t3.txt="%d %s"", start, ipaddr);
    else
- t3.txt="%d Waiting for network ..."", start);
- t3.txt="%s"", ipaddr);

**Termination**
- sleep=0
- ussp=0
- page 0
- cls 0
- dim=50
- t0.txt="NextionDriver"
- t1.txt="%s",NextionDriver_VERSION
- t2.txt="Stopped"

## Without on7lds nextiondriver (default)

Callsign Name lookup uses
~~~
/usr/local/etc/DMRids.dat
~~~

that should be updated from time to time by Pi-star "update".



**MMDVM**

- page MMDVM
 - MMDVM.status.val=1
- t0.txt="%s/%u", m_callsign, m_dmrid
- t4.txt="%s", m_callsign
- t5.txt="%u", m_dmrid
 - MMDVM.status.val=17

- t30.txt="%3.4f",m_fl_rxFrequency  // RX freq
 - MMDVM.status.val=20

- t32.txt="%3.4f",m_fl_txFrequency  // TX freq
 - MMDVM.status.val=21

- t20.txt="%2.1f %cF", val, 176
 - MMDVM.status.val=22

- t31.txt="%s", m_location  // location
 - MMDVM.status.val=23

- t1.txt="MMDVM IDLE"
 - MMDVM.status.val=11

- t3.txt="%s", m_ipaddress
 - MMDVM.status.val=16

Error

- page MMDVM
 - MMDVM.status.val=1
- t0.txt="%s", text
 - MMDVM.status.val=13
- t1.txt="ERROR"
 - MMDVM.status.val=14

Lockout

- page MMDVM
 - MMDVM.status.val=1
- t0.txt="LOCKOUT"
- MMDVM.status.val=15

Quit

- page MMDVM
 - MMDVM.status.val=1
- t3.txt="%s", m_ipaddress
 - MMDVM.status.val=16
- t0.txt="MMDVM STOPPED"
 - MMDVM.status.val=19

**DStar**

- page DSTAR
 - MMDVM.status.val=2
- t0.txt="%s %.8s/%4.4s", type, my1, my2
 - MMDVM.status.val=42
- t1.txt="%.8s", your
 - MMDVM.status.val=45
- t2.txt="via %.8s", reflector
 - MMDVM.status.val=46

DStar RSSI

- t3.txt="-%udBm", m_rssiAccum1 / DSTAR_RSSI_COUNT
 - MMDVM.status.val=47

DStar BER

- t4.txt="%.1f%%", m_berAccum1 / float(DSTAR_BER_COUNT)
 - MMDVM.status.val=48

DStar Clear

- t0.txt="Listening"
 - MMDVM.status.val=41
- t1.txt=""
- t2.txt=""
- t3.txt=""
- t4.txt=""


**DMR**

- page DMR
 - MMDVM.status.val=3

status codes

| TS | Listening | ID | TA | CallEnd | TG | RSSI | BER |
|---|---|---|---|---|---|---|---|
| 1 | 61 | 62 | 63 | 64 | 65 | 66 | 67 |
| 2 | 69 | 70 | 71 | 72 | 73 | 74 | 75 |

t variables

| TS | ID | TG | RSSI | BER |
|---|---|---|---|---|
| 1 | t0 | t1 | t4 | t6 |
| 2 | t2 | t3 | t5 | t7 |

t variables [extended nextiondriver]

| TS | TG | data1 | data2 | data3 | data4 | data5 |
|---|---|---|---|---|---|---|
| 1 | t9 | t18 | t19 | t20 | T21 | t22 |
| 2 | t8 | t13 | t14 | t15 | t16 | t17 |

- t0.pco=0
- t0.font=4
- t0.txt="1 Listening"
 - MMDVM.status.val=61

- t2.pco=0
- t2.font=4
- t2.txt="2 Listening"
 - MMDVM.status.val=69

- t0.txt="1 %s %s", type, src  //type is 'R'F or 'N'etwork
- t0.pco=0
- t0.font=4
 - MMDVM.status.val=70

- t1.txt="%s%s", group ? "TG" : ", dst
 - MMDVM.status.val=73

- t2.txt="2 %s %s", type, src
- t2.pco=0
- t2.font=4
 - MMDVM.status.val=62

- t3.txt="%s%s", group ? "TG" : ", dst
 - MMDVM.status.val=65

DMR RSSI

- t4.txt="-%udBm", m_rssiAccum1 / DMR_RSSI_COUNT
 - MMDVM.status.val=66
- t5.txt="-%udBm", m_rssiAccum2 / DMR_RSSI_COUNT
 - MMDVM.status.val=74

DMR TA    

- t0.pco=33808 //integers
 - MMDVM.status.val=64

- t2.pco=33808
 - MMDVM.status.val=72

- t0.txt="1 %s %s", type, talkerAlias
- t0.font=3 // code adjusts based on length
- t0.font=2
- t0.font=1
- t0.pco=1024"
 - MMDVM.status.val=63

- t2.txt="2 %s %s", type, talkerAlias
- t2.font=3
- t2.font=2
- t2.font=1
- t2.pco=1024"
  - MMDVM.status.val=71

DMR BER

- t6.txt="%.1f%%", m_berAccum1 / DMR_BER_COUNT
 - MMDVM.status.val=67

- t7.txt="%.1f%%", m_berAccum2 / DMR_BER_COUNT
 - MMDVM.status.val=75


DMR Clear

- t0.txt="1 Listening"
 - MMDVM.status.val=61
- t0.pco=0
- t0.font=4
- t1.txt=""
- t4.txt=""
- t6.txt=""

- t2.txt="2 Listening"
 - MMDVM.status.val=69
- t2.pco=0
- t2.font=4
- t3.txt=""
- t5.txt=""
- t7.txt=""


**YSF**

- page YSF
 - MMDVM.status.val=4

| Clear | Type | Dest | Origin | RSSI | BER |
|---|---|---|---|---|---|
| 81 | 82 | 83 | 84 | 85 | 86 |

- dim=%u", m_brightness
- t0.txt="%s %.10s", type, source
 - MMDVM.status.val=82

 - t1.txt="%.10s", dest
  - MMDVM.status.val=83
 - t2.txt="at %.10s", origin
  - MMDVM.status.val=84

Fusion RSSI

 - t3.txt="-%udBm", m_rssiAccum1 / YSF_RSSI_COUNT
 -  MMDVM.status.val=85

Fusion BER

- t4.txt="%.1f%%", m_berAccum1 / float(YSF_BER_COUNT)
 - MMDVM.status.val=86

Fusion Clear

- t0.txt="Listening"
 - MMDVM.status.val=81
- t1.txt=""
- t2.txt=""
- t3.txt=""
- t4.txt=""

**P25**

- page P25
 - MMDVM.status.val=5

 | Clear | Group | Dest | RSSI | BER |
 |---|---|---|---|---|
 | 101 | 102 | 103 | 104 | 105 |

- dim=%u", m_brightness
- t0.txt="%s %.10s", type, source
 - MMDVM.status.val=102

- t1.txt="%s%u", group ? "TG" : ", dest
 - MMDVM.status.val=103

P25 RSSI

- t2.txt="-%udBm", m_rssiAccum1 / P25_RSSI_COUNT
 - MMDVM.status.val=104

P25 BER

- t3.txt="%.1f%%", m_berAccum1 / float(P25_BER_COUNT)
 - MMDVM.status.val=105

P25 Clear

- t0.txt="Listening"
 - MMDVM.status.val=101
- t1.txt=""
- t2.txt=""
- t3.txt=""

**NXDN**

- page NXDN"
 - MMDVM.status.val=6

 | Clear | Type | Group | RSSI | BER |
 |---|---|---|---|---|
 | 121 | 122 | 123 | 124 | 125 |


- dim=%u", m_brightness
- t0.txt="%s %.10s", type, source
 - MMDVM.status.val=122
- t1.txt="%s%u", group ? "TG" : ", dest
 - MMDVM.status.val=123

NXDN RSSI

 - t2.txt="-%udBm", m_rssiAccum1 / NXDN_RSSI_COUNT
  - MMDVM.status.val=124

NXDN BER

- t3.txt="%.1f%%", m_berAccum1 / float(NXDN_BER_COUNT)
 - MMDVM.status.val=125

NXDN Clear

- t0.txt="Listening"
 - MMDVM.status.val=121
- t1.txt=""
- t2.txt=""
- t3.txt=""

**POCSAG**

- page POCSAG"
 - MMDVM.status.val=7

- dim=%u", m_brightness
- t0.txt="RIC: %u", ric
 - MMDVM.status.val=132
- t1.txt="%s", message
 - MMDVM.status.val=133

POCSAG Clear

- t0.txt="Waiting"
 - MMDVM.status.val=134
- t1.txt=""

**CW Ident**

- t1.txt="Sending CW Ident"
 - MMDVM.status.val=12

CW Clear

- t1.txt="MMDVM IDLE"
 - MMDVM.status.val=11


**Clock**
- t2.txt="%x %X", Time
