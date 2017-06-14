# Home-Assistant
Current Version: 0.46  
Running on a Raspberry PI 3 Model B  
Raspbian Jessie 8.0

# Setup
## Installation
* Install Raspbian Jessie (lite)
* ```$ sudo raspi-config```
  * Update Locale/Timezone
  * Change password
  * Expand filesystem
* ```$ sudo apt-get update```
* ```$ sudo apt-get dist-upgrade```
* ```$ sudo reboot```
* [Run the All-In-One Installer](https://home-assistant.io/docs/installation/raspberry-pi-all-in-one/) *(takes ~2 hours on a PI 3)*
  
## USB
[Set a persistant USB name](http://www.domoticz.com/wiki/PersistentUSBDevices)

## Samba share
```$ sudo apt-get install samba```  
```$ sudo nano /etc/samba/smb.conf```  

Add/Edit the rules below under the "Share Definitions" section  
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
```$ sudo smbpasswd -a pi```  
```$ sudo service smbd restart```

## Z-Wave network key
```$ sudo nano /srv/hass/src/open-zwave-control-panel/config/options.xml```  
Uncomment the network key:  
```<Option name="NetworkKey" value="0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F 0x10" />```  
And add the unique key

## Install MySQL DB
```$ sudo apt-get update && sudo apt-get upgrade```  
```$ sudo apt install mysql-server mysql-client libmysqlclient-dev python-dev python3-dev```  
```$ mysql -u root -p```  
```$ CREATE DATABASE dbname;```  
```$ CREATE USER 'dbuser'@'localhost' IDENTIFIED BY 'password';```  
```$ GRANT ALL PRIVILEGES ON dbname.* TO 'dbuser'@'localhost';```  
```$ FLUSH PRIVILEGES;```  

**Test if user works:**  
```$ mysql -u dbuser dbname -p```

**Switch to HASS env**  
```$ ssh pi@your_raspberry_pi_ip```  
```$ sudo su -s /bin/bash hass```  
```$ source /srv/hass/hass_venv/bin/activate```  
```$ pip3 install --upgrade mysqlclient```  

**Troubleshooting**  
***Install mysqlclient***  
```$ ssh pi@your_raspberry_pi_ip```  
```$ pip3 install mysqlclient```  
  
***Mysql running?***  
```sudo service mysql status```  
```sudo service mysql start```  

**Add to configuration.yaml**  
```yaml
recorder:
  db_url: mysql://dbuser:password@localhost/dbname
```

## DuckDNS
* [Installation guide](https://www.duckdns.org/install.jsp?tab=pi)

## LetEncrypt
* [Installation guide](https://home-assistant.io/blog/2015/12/13/setup-encryption-using-lets-encrypt/)  
* After installation:  
  ```$ sudo chmod -R 777 /etc/letsencrypt/archive```  
  ```$ sudo chmod -R 777 /etc/letsencrypt/live```  
  ```$ sudo chmod -R 777 /etc/letsencrypt/renewal```
  
### Renew Certificate
```$ cd certbot```  
```$ sudo ./certbot-auto renew --standalone --no-self-upgrade --force-renewal --preferred-challenges http-01```  
```$ sudo reboot```
  
### Upgrade Lets Encrypt & Certificates
```$ cd certbot```  
```$ ./certbot-auto renew```
```$ sudo reboot```
  
### Check Validity
```$ openssl x509 -in /etc/letsencrypt/live/<domain>/fullchain.pem -text -noout | grep -A2 Validity```
  
# Z-Wave
## Upgrade Python Open Z-Wave
```$ sudo su -s /bin/bash hass```  
```$ source /srv/hass/hass_venv/bin/activate```  
```$ cd /srv/hass/src/python-openzwave/```  
```$ git pull```  
```$ make build```  
```$ make install```  
  
## Settings
* Greenwave wall sockets
  * timeout: 255
  
## Copy OZWCP config to HASS  
```$ sudo cp /srv/hass/src/open-zwave-control-panel/zwcfg_0xe268674f.xml /home/hass/.homeassistant/```  

# Floorplan
* Change floorplan in the illustrator file `www/custom_ui/floorplan/floorplan.ai`
* Save as svg
  * Fonts: convert to outline
  * Decimal places: 2

Sadly illustrator does not convert the id's correctly and we have to find and replace / check our nodes.
* Replace `_x5F__x5F_` with `__`
* Replace `_x5F_` with `_`

Some sensor may have an extra `_` at the end of the id, so be sure to check that


# Documentation
* https://objectpartners.com/2016/04/12/setting-up-the-raspberry-pi-3-for-home-assistant/
