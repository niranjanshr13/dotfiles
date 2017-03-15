#!/bin/bash
while :
do
fswebcam -r 1024x768 /tmp/image.jpg
ln /tmp/image.jpg /var/www/html/image.jpg
sleep 60
done
