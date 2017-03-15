import os
import time
import RPi.GPIO as io
io.setmode(io.BCM)

door_sensor = 2
sensorTrigger = True

io.setup(door_sensor, io.IN, pull_up_down=io.PUD_UP)

# function for the door opening
def door_open():
    print("Door Open")
    os.system('bash door_off.sh')

# function for the door closing
def door_close():
    print("Door Close")
    os.system('bash door_on.sh')

while True:
    if io.input(door_sensor): # if door is opened
        if (sensorTrigger):
            door_open() # fire GA code
            sensorTrigger = False # make sure it doesn't fire again
    if not io.input(door_sensor): # if door is closed
        if not (sensorTrigger):
            door_close() # fire GA code
            sensorTrigger = True # make sure it does
