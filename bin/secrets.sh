#!/bin/bash

echo "latitude: dummy" >> $TRAVIS_BUILD_DIR/secrets.yaml
echo "longitude: dummy" >> $TRAVIS_BUILD_DIR/secrets.yaml

echo "api_password: dummy" >> $TRAVIS_BUILD_DIR/secrets.yaml
echo "ssl_certificate: ssl_cert.pem" >> $TRAVIS_BUILD_DIR/secrets.yaml
echo "ssl_key: ssl_key.pem" >> $TRAVIS_BUILD_DIR/secrets.yaml
echo "ssl_url: dummy" >> $TRAVIS_BUILD_DIR/secrets.yaml

echo "mysql: dummy" >> $TRAVIS_BUILD_DIR/secrets.yaml
echo "shell_update_hass: dummy" >> $TRAVIS_BUILD_DIR/secrets.yaml

echo "dryer_power_usage: dummy" >> $TRAVIS_BUILD_DIR/secrets.yaml
echo "livingroom_light: dummy" >> $TRAVIS_BUILD_DIR/secrets.yaml
echo "television_toggle: dummy" >> $TRAVIS_BUILD_DIR/secrets.yaml
echo "washingmachine_power_usage: dummy" >> $TRAVIS_BUILD_DIR/secrets.yaml
echo "backyard_light_toggle: dummy" >> $TRAVIS_BUILD_DIR/secrets.yaml
echo "dishwasher_power_usage: dummy" >> $TRAVIS_BUILD_DIR/secrets.yaml

echo "longitude: dummy" >> $TRAVIS_BUILD_DIR/secrets.yaml
echo "latitude: dummy" >> $TRAVIS_BUILD_DIR/secrets.yaml
echo "longitude: dummy" >> $TRAVIS_BUILD_DIR/secrets.yaml
echo "latitude: dummy" >> $TRAVIS_BUILD_DIR/secrets.yaml
echo "longitude: dummy" >> $TRAVIS_BUILD_DIR/secrets.yaml

touch "ssl_key.pem"
touch "ssl_cert.pem"