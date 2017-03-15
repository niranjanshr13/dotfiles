#!/bin/bash
#-------This script is meant to check tv schedule and it depends upon tvguide.com---------------------------------------

#creates today date { only month and day }
today_date=$(date "+%b %d")
tv_list='tv-list.txt'
#tvlist=for loop "Just a counting loop"
#Help page if nothing is in parameter
if [[ "$@" = "" ]]
then
echo "Type 'all'		:	For all the tv-list"
echo "Type 'number / name'	:	For specific tv"
echo "Type 'today'	:	to get today's only tv show"
else

#this will show all tv-show
if [[ "$@" = "all" ]]
then
echo "today		:	$today_date"
for tvlist in $(cat $tv_list | grep -o ":.*" | sed 's/://g')
do
tv_date=$(curl -s -L www.tvguide.com/tvshows/$tvlist/ | grep 'tvobject-right-rail-airing-date-date' | uniq | sed 's/\t//g' | grep -o ">.*<" | sed 's/<//g' | sed 's/>//g')
tv_name=$(cat $tv_list | grep $tvlist | sed 's/:.*//g')
echo ""$tv_name"	:	"$tv_date""
done

else

#this will show the movie by name or number
if [[ "$@" != "all" ]] && [[ "$@" != ""	]] && [[ "$@" != "today" ]]
then
echo "today		:	$today_date"
for tvlist in $(cat $tv_list | grep "$@" | grep -o ":.*" | sed 's/://g')
do
tv_date=$(curl -s -L www.tvguide.com/tvshows/$tvlist/ | grep 'tvobject-right-rail-airing-date-date' | uniq | sed 's/\t//g' | grep -o ">.*<" | sed 's/<//g' | sed 's/>//g')
tv_name=$(cat $tv_list | grep $tvlist | sed 's/:.*//g')
echo ""$tv_name"	:	"$tv_date""
done

else

#this will show tv show that are schedule to play today.
if [[ "$@" == "today" ]]
then
echo "today		:	$today_date"
for tvlist in $(cat $tv_list | grep -o ":.*" | sed 's/://g')
do
tv_date=$(curl -s -L www.tvguide.com/tvshows/$tvlist/ | grep 'tvobject-right-rail-airing-date-date' | uniq | sed 's/\t//g' | grep -o ">.*<" | sed 's/<//g' | sed 's/>//g')
tv_name=$(cat $tv_list | grep $tvlist | sed 's/:.*//g')
if [ "$today_date" == "$tv_date" ]
then
echo ""$tv_name"	:	"$tv_date""
fi
done

fi
fi
fi
fi
