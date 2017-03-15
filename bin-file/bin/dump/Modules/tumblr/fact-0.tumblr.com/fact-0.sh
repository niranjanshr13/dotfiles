#!/bin/bash
date=$(date '+%b %d, %l:%M%p')
fact=$(curl -s 'www.google.com/search?biw=1920&bih=945&q=i%27m+feeling+curious&gws_rd=ssl' -A "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/534.30 (KHTML, like Gecko) Chrome/12.0.742.112 Safari/534.30"  | grep GQSfLE1fUrA | grep -o 'GQSfLE1fUrA.*</div><div class="_LSh">' | sed 's/GQSfLE1fUrA">//g' | sed 's/<\/div><div class="_LSh">//g')
#echo $fact
python "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"/fact-0.py "fact of $date" "$fact"
