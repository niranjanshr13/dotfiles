#!/bin/bash

function func()
{
echo facebook.com
}


WORKSPACE=$( (echo empty; func)  | rofi -dmenu -p "Sel func:")

if [ x"empty" = x"${WORKSPACE}" ]
then
    i3_test.sh
elif [ -n "${WORKSPACE}" ]
then
		firefox "${WORKSPACE}"
fi
