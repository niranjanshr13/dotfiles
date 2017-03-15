#!/bin/bash
# Script is created by @niranjanshr13
# This script will show all the cryptocurrency with its value in USD.
allcurrency=$(curl -s 'https://coinmarketcap.com/all/views/all/' | grep '<a href="/currencies/' | grep -v '\#' | grep -v '</li>'  | sed 's/  //g' | sed 's/<a href="\/currencies\///g' | sed 's/\/.*//g' | sort | uniq)
for list in $allcurrency
do
coin=$(curl -s "https://coinmarketcap.com/currencies/$list/" | grep '<span class="text-large">' | sed 's/\/span.*//g' | sed 's/<span class="text-large">\$//g' | sed 's/ //g' | sed 's/<//g')
if [ "$coin" != "" ]
then
echo "$list=$coin"
fi
done
