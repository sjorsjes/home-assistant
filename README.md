# Home-Assistant
Current Version: 0.28.2  
Running on a Raspberry PI 1 Model B

## Setup

### Samba share
* ```sudo apt-get install samba```
* ```sudo nano /etc/samba/smb.conf```
* Add/Edit the rules below under the "Share Definitions" section
* ```
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

### Info & Tips
* http://www.bruhautomation.com/single-post/2016/07/25/Part-1-Raspberry-Pi-Setup-and-Installing-Home-Assistant
