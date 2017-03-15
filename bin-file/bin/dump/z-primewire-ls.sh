#!/bin/bash
tvlist=$(curl -s 'www.primewire.ag/?tv' | grep 'index_item index_item_ie' | sed 's/<div class="index_item index_item_ie"><a href="\///g' | sed "s/-online-free.*//g" | sed 's/watch-//g' | sed 's/-/ /g' | sed 's/ .*//g')
for tv_list in $tvlist
do
tv_name=$(curl -s "http://www.primewire.ag/watch-$tv_list" | grep '<title>Watch' | sed 's/<title>Watch //g' | sed 's/ Online.*//g' | sed 's/(.*//g')
last_episode=$(curl -s "http://www.primewire.ag/watch-$tv_list" | grep 'tv_episode_item' | sed 's/<div class="tv_episode_item"> <a href="\/tv-//g'  | sed 's/-.*\/season/-season/g' | sed 's/".*name">//g'  | sed 's/<\/span>//g' | tail -1 | sed 's/  //g' | cut -d '-' -f2- | sed 's/-/ /g' | sed 's/season /S/g' | sed 's/ episode /E/g' | sed 's/  //g')
echo "$tv_name""
        $last_episode"
done
