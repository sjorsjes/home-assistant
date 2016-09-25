# Home-Assistant
Current Version: 0.28.2  
Running on a Raspberry PI 1 Model B

## Setup
### Installation
[Raspberry Pi All-In-One Installer](https://home-assistant.io/getting-started/installation-raspberry-pi-all-in-one/)

### USB
[Set a persistant USB name](http://www.domoticz.com/wiki/PersistentUSBDevices)

### Samba share
* ```sudo apt-get install samba```
* ```sudo nano /etc/samba/smb.conf```
* Add/Edit the rules below under the "Share Definitions" section
```
[home assistent]
path = /home/hass/.homeassistant
comment = No comment
browsable = yes
read only = no
valid users =
writable = yes
guest ok = yes
public = yes
create mask = 0777
directory mask = 0777
force user = root
force create mode = 0777
force directory mode = 0777
hosts allow =
```
* ```sudo smbpasswd -a pi```
* ```sudo service smbd restart```

### Publish to Github
```cd /home/hass/.homeassistant```
```git commit -a```
```git push```