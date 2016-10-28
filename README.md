# Home-Assistant
Current Version: 0.31.1  
Running on a Raspberry PI 1 Model B  
Raspbian Jessie 8.0

## Setup
### Installation
[Raspberry Pi All-In-One Installer](https://home-assistant.io/getting-started/installation-raspberry-pi-all-in-one/)

### USB
[Set a persistant USB name](http://www.domoticz.com/wiki/PersistentUSBDevices)

### Samba share
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

### Install MySQL DB
```$ sudo apt-get update && sudo apt-get upgrade```  
```$ sudo apt-get install mysql-server && sudo apt-get install mysql-client```  
```$ sudo apt-get install libmysqlclient-dev```  
```$ sudo apt-get install python-dev python3-dev```  
```$ mysql -uroot -p```  
```$ CREATE DATABASE dbname;```  
```$ CREATE USER 'dbuser'@'localhost' IDENTIFIED BY 'password';```  
```$ GRANT ALL PRIVILEGES ON dbname.* TO 'dbuser'@'localhost';```  
```$ FLUSH PRIVILEGES;```  

**Test if user works:**  
```$ mysql -udbuser dbname -p```

**Switch to HASS env**  
```$ ssh pi@your_raspberry_pi_ip```  
```$ sudo su -s /bin/bash hass```  
```$ source /srv/hass/hass_venv/bin/activate```  
```$ pip3 install --upgrade mysqlclient```  

**Add to configuration.yaml**  
```yaml
recorder:
  db_url: mysql://dbuser:password@localhost/dbname
```

### LetEncrypt
[Guide](https://home-assistant.io/blog/2015/12/13/setup-encryption-using-lets-encrypt/)

#### Renew Certificate
```$ ./certbot-auto renew --quiet --no-self-upgrade --standalone \ --standalone-supported-challenges http-01```

* Creation date 30-09-2016
* Renewal date 29-12-2016

### Publish to Github
```$ cd /home/hass/.homeassistant```  
```$ git commit -a```  
```$ git push```