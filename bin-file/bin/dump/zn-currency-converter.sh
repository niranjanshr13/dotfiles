#!/bin/bash
echo 'Amount'
read amount
echo 'convert from'
read 'convertfrom'
echo 'convert to'
read 'convertto'
curl -s "http://www.google.com/finance/converter?a=$amount&from=$convertfrom&to=$convertto" | sed '/res/!d;s/<[^>]*>//g';
