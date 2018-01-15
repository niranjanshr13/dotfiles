#!/usr/bin/env python3
import os
from geopy.geocoders import Nominatim
from pyicloud import PyiCloudService

userName = os.environ['ICLOUD_USERNAME']
passWord = os.environ['ICLOUD_PASSWORD']

def deviceCount(device):
    devices = len(dict(device))
    return devices

def findLocation(device, devices):
    for x in range(devices):
        try:
            deviceName = str(device[x]).split(':')[1].replace(' ','')
            deviceLocation = device[x].location()
            if deviceLocation is not None: 
                deviceLatitude = deviceLocation['latitude']
                deviceLongitude = deviceLocation['longitude']
                coordination = deviceLatitude, deviceLongitude
                location = geolocator.reverse(coordination)
                houseNumber = location.raw['address']['house_number']
                road = location.raw['address']['road']
                neighbourhood = location.raw['address']['neighbourhood']
                postcode = location.raw['address']['postcode']
                #print(deviceName + ': ' + houseNumber + ', ' + road + ', ' + neighbourhood + ', ' + postcode)
                print(deviceName + ': ' + houseNumber + ', ' + road + ', ' + neighbourhood)
        except:
            pass


if __name__ == '__main__':
    L = PyiCloudService(userName,passWord)
    geolocator = Nominatim()
    device = L.devices
    devices = deviceCount(device)
    findLocation(device,devices)
