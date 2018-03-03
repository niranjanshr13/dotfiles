#!/bin/bash
echo $(amixer get Master | grep -E -o '[0-9]{1,3}?%' | head -1 | sed 's/%//g' && echo -e "\e[91m $(amixer get Master | tail -1 | awk {'print $6'} | sed 's/\[//g' | sed 's/\]//g')") | sed 's/ //g'
