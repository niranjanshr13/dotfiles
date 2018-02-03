#!/bin/bash

function gen_webpage()
{
#echo \
#	yahoo.com \
#	youtube.com \
#	| sed 's/ /\n/g'

# thinking about retriving a firefox bookmark to rofi.. ( cool idea)
# cat /home/z/.i3/i3scripts/firefox.file

# a simple way, might need firefox to create a copy / a backup 1 day.
# using that backup.
dejsonlz4 ~/.mozilla/firefox/$FIREFOX_UID/bookmarkbackups/$(ls ~/.mozilla/firefox/$FIREFOX_UID/bookmarkbackups/ | tail -1) | sed 's/,/\n/g' | grep uri | grep -v iconuri |  sed 's/"uri":"//g' | sed 's/"}//g'

}

WEBPAGE=$( (echo google.com;gen_webpage)  | rofi -dmenu -p "WWW:")

if [ -n "${WEBPAGE}" ]
then
		firefox "${WEBPAGE}"
fi
