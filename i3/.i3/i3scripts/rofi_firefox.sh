#!/bin/bash

function gen_webpage()
{
echo \
	coinmarketcap.com \
	cryptocompare.com \
	facebook.com \
	feedly.com \
	gmail.com \
	news.ycombinator.com \
	reddit.com \
	reddit.com/r/jokes \
	yahoo.com \
	youtube.com \
	| sed 's/ /\n/g'
}

WEBPAGE=$( (echo google.com;gen_webpage)  | rofi -dmenu -p "WWW:")

if [ -n "${WEBPAGE}" ]
then
		firefox "${WEBPAGE}"
fi
