#!/bin/bash
if [[ $(ps aux | grep 'mpg123 -vC http://50.7.96.138:8115/stream' | grep -v grep)  == '' ]]
then
mpg123 -vC http://50.7.96.138:8115/stream > /dev/null 2>&1 &
else
kill -9 $(pgrep mpg123)
fi
