#!/bin/bash
# show all the mac-address on the network.
fing -r 1 --silent | grep 'HW Address' | awk '{print $3}' | sed 's/://g'
