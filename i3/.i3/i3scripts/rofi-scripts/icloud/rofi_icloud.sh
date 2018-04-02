#!/bin/bash

function gen_webpage()
{
$HOME/.python-env/pyicloud/bin/python3 $HOME/.i3/i3scripts/rofi-scripts/icloud/icloud_play_sound.py
}

DEVICE=$( (gen_webpage)  | rofi -dmenu -p "IPHONE:")

if [ -n "${DEVICE}" ]
then
  $HOME/.python-env/pyicloud/bin/python3 $HOME/.i3/i3scripts/rofi-scripts/icloud/icloud_play_sound.py --device "${DEVICE}"
fi
