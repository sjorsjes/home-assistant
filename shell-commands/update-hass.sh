#!/bin/bash

# Stop HASS
sudo systemctl stop home-assistant.service

# Become user 'hass'
sudo su -s /bin/bash hass <<'EOF'
source /srv/hass/hass_venv/bin/activate
pip3 install --upgrade homeassistant
exit
EOF

# Start Home Assistant
sudo systemctl start home-assistant.service