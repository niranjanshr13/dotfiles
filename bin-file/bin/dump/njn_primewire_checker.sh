#!/bin/bash
# Variable
BROWSER='chromium-browser'

if [[ "$1" = '' ]] || [[ "$1" = 'help' ]]
then
echo "type 'list movie'		=		show all the movie"
echo "type play 'movie number'	=		play movie"
else	if [[ "$1" = 'list' ]] || [[ "$1" = 'ls' ]]
then
if [[ "$2" = 'movie' ]] || [[ "$2" = 'movies' ]]
	then
	listcontent=$(curl -s -L 'www.primewire.ag/index.php?sort=featured' | grep 'online-free" title="Watch' | grep -oP '"\K[^"\047]+(?=["\047])' | grep watch | sed 's/'-online-free'//g' | sed 's/\/watch-//g')
		for list in $listcontent
		do
		movie_uid=$(echo "$list" | cut -d'-' -f1)
		movie_name=$(echo "$list" | cut -d'-' -f2- | sed 's/-/ /g')
		quality_check_dvd=$(curl -s http://www.primewire.ag/watch-"$movie_uid" | grep quality_dvd | wc -l)
		quality_check_cam=$(curl -s http://www.primewire.ag/watch-"$movie_uid" | grep quality_cam | wc -l)
		quality_check_ts=$(curl -s http://www.primewire.ag/watch-"$movie_uid" | grep quality_ts | wc -l)
if [[ "$quality_check_dvd" > 2 ]] 
then
quality='✓'
else
	if [[ "$quality_check_cam" > 2 ]]
	then
	quality='✘'  
else
	if [[ "$quality_check_ts" > 2 ]]
	then 
	quality='✇'
	fi
fi
fi
echo ""$movie_uid"		=		"$movie_name" "$quality""
done
fi
fi
fi

if [[ "$1" = 'play' ]] 
then
if [[ "$2" -gt '1' ]]
then
echo $(curl -s www.primewire.ag/watch-"$2" | grep "watch-$2" | grep title | html2text | tail -1 | sed 's/_/ /g' )
	if [[ $(curl -s www.primewire.ag/watch-"$2") =~ 'cHJvbXB0ZmlsZS5jb20' ]]
	then
	video_unfilter_link=$(curl -s www.primewire.ag/watch-"$2" | grep "goto.php" | grep '=cHJvbXB0ZmlsZS5jb20' | sed 's/<a href="//g' | sed 's/".*//g')
	echo $video_unfilter_link
	video_filter_link=$(curl -sI "http://www.primewire.ag"$video_unfilter_link"" | grep 'Location:' | sed 's/Location: //g')
	mplayer $(youtube-dl -g "$video_filter_link")
	else
	link_validation=$(curl -s www.primewire.ag/watch-"$2" | grep '<title>')
if [[ $link_validation =~ 'LetMeWatchThis' ]]
then
echo "UID doesn't exist"
else
	$BROWSER www.primewire.ag/watch-"$2"
fi
fi
fi
fi

#video_unfilter_link=$(curl -s www.primewire.ag/watch-"$2" | grep "goto.php" | grep '=dmlkemkudHY' | sed 's/<a href="//g' | sed 's/".*//g')
#video_filter_link=$(curl -s "http://www.primewire.ag"$video_unfilter_link"" | grep 'noframes' | grep -o "http.*" | sed 's/<\/noframes>//g')
#vlc $(youtube-dl -g "$video_filter_link")
#fi
#else
#echo "type the uid"
#fi


# =dmlkemkudHY = vidzi
# things to do
# implemenent tv shows and the ways its season and episode is managed.
# put like list, play, search feature
