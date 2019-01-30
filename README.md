# Home Assistant

[Running docker](https://github.com/sjorsjes/docker-setup) on a Mac mini with Ubuntu server 18.04 LTS  
Current Home Assistant version: 0.86.3

# Custom installations using [ESPHome](https://esphomelib.com/index.html) (Yaml)

## Multisensor
* Download the docker image `$ docker pull ottowinter/esphomeyaml`
* Create a file <config file>.yaml **OR**
* ... run the wizard `$ docker run --rm -v ${PWD}:/config -it ottowinter/esphomeyaml <config file>.yaml wizard`
* Compile based on the config file `$ docker run --rm -v ${PWD}:/config -it ottowinter/esphomeyaml <config file>.yaml compile`
* Download and run the [ESPHome Flasher](https://github.com/esphome/ESPHome-Flasher/releases)
* Select the com port and select `..\<sensor name>\.pioenvs\<sensor name>\firmware.bin`
* Add the device as ESPHome integration to Home Assistant

## Upgrade Sonoff Basics to ESPHome
* Follow the steps above, except for the part running the ESPHome Flasher
* Access the Sonoff in the browser, select _Firmware Upgrade_
* Upload `..\<sensor name>\.pioenvs\<sensor name>\firmware.bin`
* After a while you'll get _Upload Successful_ and the web interface will not be working anymore
* Add the device as ESPHome integration to Home Assistant