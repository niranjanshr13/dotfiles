#!/usr/bin/python3

# this code is meant for me, it play sound even it is the silent mode. (finding the phone)
from os import environ
from pyicloud import PyiCloudService

# variable's
userName = environ['ICLOUD_USERNAME']
passWord = environ['ICLOUD_PASSWORD']
myPhone = environ['ICLOUD_MY_PHONE']

# login user.
L = PyiCloudService(userName,passWord)

# search devices.
device = L.devices
for x in range(len(dict(device))):
    if myPhone in str(device[x]):
        phone = device[x]

phone.play_sound()
