#!/bin/bash
# wordlist-gen can help for hacking password
mkdir -p /tmp/password/
curl -s 'https://wiki.skullsecurity.org/Passwords' | grep txt.bz2 | grep -o "http.*.bz2" | sed "s/>.*//g" | sed 's/"//g' > /tmp/password/list
aria2c -s16 -x16 -j5 -i /tmp/password/list -d /tmp/password/
bunzip2 -c /tmp/password/*.bz2 > /tmp/password/wordlist
rm /tmp/password/list
rm /tmp/password/*.bz2
cat /tmp/password/* | sort | uniq > /tmp/password/finished.lst
rm /tmp/password/wordlist
