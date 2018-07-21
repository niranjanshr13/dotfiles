#!/bin/bash

SCREEN_SIZE=$(xrandr | grep '*' | awk {'print $1'})
BATT_INFO=$(cat /sys/class/power_supply/BAT1/status | cut -c 1):$(acpi -b | grep -P -o '\d+%')

convert -size "$SCREEN_SIZE" xc:Black -gravity South -weight 700 -pointsize 200 -fill blue -annotate 0 "$BATT_INFO" oil.jpg
