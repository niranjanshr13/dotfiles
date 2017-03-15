#!/bin/bash
for a in $(seq 70 186)
do
rpi-rf_send -p $a -t 1 xxxxxxx -g xx
done

