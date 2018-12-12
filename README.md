# Home Assistant

Ubuntu server 18.04 LTS on a Mac mini 2011  
Current Home Assistant version: 0.83.3

# Custom installations

## Sonoff
* [Download](https://github.com/arendst/Sonoff-Tasmota) the latest firmware
* Follow the [getting started guide](https://github.com/arendst/Sonoff-Tasmota/wiki/Prerequisite)

## ESP8266
### Multisensor settings

| Tools         | Type                            |
| ------------- | ------------------------------- |
| Board         | `NodeMCU 1.0 (ESP-12E Module)`  |
| CPU Freq      | `80 MHz`                        |
| Flash size    | `4M (3M SPIFFS)`                |
| Upload speed  | `115200`                        |
| Port          | `<select corresponding sensor>` |

### SONOFF settings

| Tools         | Type                            |
| ------------- | ------------------------------- |
| Board         | `Generic ESP 8266 Module`  |
| CPU Freq      | `80 MHz`                        |
| Flash size    | `4M (3M SPIFFS)`                |
| Upload speed  | `115200`                        |
| Port          | `<select corresponding sensor>` |