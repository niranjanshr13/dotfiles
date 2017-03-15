#!/bin/bash
sudo apt install -y python3 python3-pip
sudo pip install rpi_rf
sudo pip3 install homeassistant
hass --open-ui
