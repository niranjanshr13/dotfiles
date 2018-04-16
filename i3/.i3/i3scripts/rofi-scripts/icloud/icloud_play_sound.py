#!/usr/bin/python3

# this code is meant for me, it play sound even it is the silent mode. (find the phone)
from os import environ
from pyicloud import PyiCloudService
import argparse

def firstTask():
    # variable's
    userName = getenv('ICLOUD_USERNAME')
    passWord = getenv('ICLOUD_PASSWORD')
    # login user.
    L = PyiCloudService(userName,passWord)
    # search devices.
    device = L.devices
    for x in range(len(dict(device))):
        print(str(device[x]))
    return device

def playSound(device, cmd):
    for x in range(len(dict(device))):
        if cmd in str(device[x]):
            device[x].play_sound()

parser = argparse.ArgumentParser(description="Description")
parser.add_argument('--device', type=str, help="Specify the Devices", required=False)
cmds = parser.parse_args()

firstTaskRun = firstTask()

if cmds.device:
    playSound(firstTaskRun, cmds.device)
