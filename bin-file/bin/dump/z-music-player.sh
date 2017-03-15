#!/bin/bash
CURLS='curl -s'
player='mpg123 -Cq'
if [ "$($CURLS http://ipinfo.io/ip)" = '' ] | [[ "$@" = '' ]]
then
echo 'Looks like internet is down'
echo 'type song name 	=	It will play in mpg123'
else
convert_space_to_plus=$(echo "$@" | sed 's/ /+/g')
getting_music_website=$($CURLS mp3miner.com/mp3songs/"$convert_space_to_plus" | grep 'track-title' | head -2 | tail -1 | sed 's/<div class="track-title"><a href="//g' | sed 's/">.*//g' | sed 's/\t//g')
if [[ "$getting_music_website" =~ 'sourcemp3' ]]
then
$player $($CURLS "$getting_music_website" | grep '<div class="player" data-play="1"' | grep -o "http.*.mp3")
else
$player $($CURLS  http://mp3miner.com/$getting_music_website | grep 'song-audio' | grep -o "http.*preload" | sed 's/" preload//g')
fi
fi
