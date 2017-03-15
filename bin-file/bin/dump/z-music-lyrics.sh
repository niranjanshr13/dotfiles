#!/bin/bash
if [[ "$@" != "" ]]
then
cleaning_parameter=$(echo "$@" | sed 's/ /+/g')
curl='curl -s -A "iMacAppStore/1.0.1 (Macintosh; U; Intel Mac OS X 10.6.7; en) AppleWebKit/533.20.25"'
find_song=$($curl "http://search.azlyrics.com/search.php?q=$cleaning_parameter" | grep '1. <' | grep -o "http.*.html")
$curl "$find_song" | html2text -ascii | sed '/^$/N;/^\n$/D' | grep -v '/#' | sed  -e 's/ /\#/g' | sed '/^\s*$/d' | tr '\r\n' ' ' | sed 's/.*Print//g' | sed 's/Submit_Corrections.*//g'| tr ' ' '\n'  | sed 's/\#/ /g' | less
else
echo 'Type song name.'
fi
