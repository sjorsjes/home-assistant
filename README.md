# Home-Assistant

[![Build Status](https://travis-ci.org/sjorsjes/home-assistant.svg?branch=master)](https://travis-ci.org/sjorsjes/home-assistant)

Current Version: 0.58.1  
Raspberry PI 3 Model B  
Raspbian Jessie 8.0

# Setup
## Installation
* Install [Hass.io](https://home-assistant.io/hassio/installation/)

## Install addons
**SSH Server**
```
{
  "authorized_keys": [],
  "password": <password>
}
```

**Duck DNS**
```
{
  "lets_encrypt": {
    "accept_terms": true,
    "certfile": "fullchain.pem",
    "keyfile": "privkey.pem"
  },
  "token": "<token>",
  "domains": [
    "<domain>"
  ],
  "seconds": 300
}
```

**Maria DB**
```
{
  "databases": [
    "homeassistant"
  ],
  "logins": [
    {
      "username": "hass",
      "host": "%",
      "password": "<password>"
    }
  ],
  "rights": [
    {
      "username": "hass",
      "host": "%",
      "database": "homeassistant",
      "grant": "ALL PRIVILEGES ON"
    }
  ]
}
```

**Samba share**
```
{
  "workgroup": "WORKGROUP",
  "name": "hassio",
  "guest": true,
  "map": {
    "config": true,
    "addons": true,
    "ssl": false,
    "share": true,
    "backup": true
  },
  "username": "<username>",
  "password": "<password>",
  "interface": "eth0"
}
```
