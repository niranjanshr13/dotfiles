#{{{ Bash history
	HISTSIZE=100
	HISTFILESIZE=100
#}}}
#{{{Export
#export CHEATPATH="$CHEATPATH:/path/dir"
#}}}
#{{{ Normal Aliases
alias gimp='pinta'
alias bd='cd ../'
alias c='cd'
alias cc='chrome'			
alias chrome='chromium-browser > /dev/null'						
alias cls='clear'                                                                               
alias cs='clear'
alias csl='clear'                                                                               
alias cx='chmod +x'	
alias df='df -h'
alias egrep='egrep --color=auto'
alias eog='feh'						
alias feh='feh --scale-down'							
alias ff='firefox'				
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias l='ls -CF'
alias l='ls'
alias la='ls -a --color=auto'
alias ll='ls -alF'
alias ls='ls --color=auto'
alias lsa='ls -a'
alias mk='mkdir'
alias mplayer='mpv'
alias nano='vim'                                                                            
alias nload='nload -u M'
alias nn='vim'										
alias q='exit'
alias qq='exit'			
alias rm='trash-put'
alias rr='ranger'									
alias sl='ls'                                                                                   
alias ss='startx'
alias vv='vim'										
alias yt='youtube-dl'										
alias z-gist-list='gist --list'                                        
alias z-git-add='git add'
alias z-git-commit='git commit'
alias z-git-push='git push'
alias z-git-stat='git status'
alias z-kill-chrome='kill -9 $(ps aux  | grep chromium | grep -v 'grep' | awk '{ print $2 }')'
alias z-loop='while : ; do $@ ; done'
alias z-nload='nload -u M'
alias z-peerflix="peerflix "$@" -v -r"                                                          ## peerflix module
alias z-reboot='init 6'										
alias z-screenshot='scrot'                                                    
alias z-shutdown='init 0'								
alias z-src-refresh='source ~/.zshrc'                                
alias z-unzip='patool extract'							
alias z-webcam='guvcview'
alias z-xclip='xclip -i -sel clip'                                    
alias zct='cd /tmp/'
alias zo-fb='chrome "facebook.com" > /dev/null 2>&1 & '
alias zo='xdg-open'		                                   
alias zz='source ~/.zshrc'					
#}}}
#{{{ Redshift
z-redshift() {
	xbacklight -inc 100
	xbacklight -dec 97
	redshift -b 0.7 2>&1 /dev/null &
}
#}}} 
#{{{ Is website down  
z-down4me() {
checker=$(curl -s "isup.me/$1" | grep 'class="domain"' | grep -o ".*<a" | sed 's/  //g' | sed 's/<a//g')
if [ "$checker" != "" ]
then
echo "$checker"
else
echo 'Internet is down'
fi
}
#}}}
#{{{ Battery Status
z-batt-stat() {
	echo "Computer is currently $(cat /sys/class/power_supply/BAT1/status)"
	echo "$(cat /sys/class/power_supply/BAT1/capacity)% Battery Level"
}
#}}}
#{{{ Fixing the wifi
zpp() {
	sudo rfkill unblock all
}
#}}}
#{{{ Network Information
z-myip () {
echo "curl -s 'ipinfo.io'"
echo "Internal IP = $(ifconfig | perl -nle'/dr:(\S+)/ && print $1' | grep -v 127.0.0.1 | sed ':a;N;$!ba;s/\n/, /g')"
echo "Gateway     = $(ip route show | awk '$3 ~ /^[1-9]+/ {print $3;}')"
echo "Mac Address = $(ifconfig -a | grep HWaddr | awk '{print $5 }' | sed ':a;N;$!ba;s/\n/, /g' )"
}
#}}}
#{{{ Send to Pastebin
z-pastebin() {
	echo "$@" | curl -s -F "f:1=<-" http://ix.io
}
#}}}
#{{{ Searching Mac-Address by Scanning Network 
zn-scan-network() {
	# show all the mac-address on the network.
	fing -r 1 --silent | grep 'HW Address' | awk '{print $3}' | sed 's/://g'
}
#}}}
#{{{ find instagram follower
zn-instagram-follower-count() {
curl -s http://socialblade.com/instagram/user/$1 | grep '<div class="stats-top-data-content" style="font-size: 0.9em;">' | head -1 | grep -o '>.*' | sed 's/>//g' | sed 's/\/div//g' | sed 's/<//g' | sed 's/,//g'
}
#}}}
#{{{ Hacking Password Collection
zn-word() {
mkdir -p /tmp/password/
curl -s 'https://wiki.skullsecurity.org/Passwords' | grep txt.bz2 | grep -o "http.*.bz2" | sed "s/>.*//g" | sed 's/"//g' > /tmp/password/list
aria2c -s16 -x16 -j5 -i /tmp/password/list -d /tmp/password/
bunzip2 -c /tmp/password/*.bz2 > /tmp/password/wordlist
rm /tmp/password/list
rm /tmp/password/*.bz2
cat /tmp/password/* | sort | uniq > /tmp/password/finished.lst
rm /tmp/password/wordlist
}
#}}}
#{{{ffmpeg alias
#{{{ Select 1 frame out of every 10 frames
	alias z-ffmpeg-extract-one-frame='ffmpeg -i $1 -vf "select=not(mod(n\,10))" -vsync vfr -q:v 2 img_%03d.jpg'
#}}}
#{{{ ffmpeg combine image and make it a video
z-ffmpeg_comb_vid_img() {
# $1 = image
# $2 = mp3
# $3 = output.mp4
ffmpeg -loop 1 -i $1 -i $2 -shortest -c:v libx264 -c:a copy $3
}
#}}}
#}}}
#{{{ config Files
z-cfg-vim-snippet-py() {
	nano $HOME/.vim/bundle/vim-snippets/snippets/python.snippets
}

z-cfg-docker() {
	nano $HOME/.docker.alias
}

z-cfg-vim(){
	nano $HOME/.vimrc
}

z-cfg-bash(){
	nano $HOMER/.bashrc
}

z-cfg-i3(){
	nano $HOME/.i3/config
}

z-cfg-ranger(){
	nano $HOME/.config/ranger/rc.conf 	
}

z-cfg-crontab(){
	nano /etc/crontab
}

z-cfg-rclocal(){
	nano /etc/rc.local
}

z-cfg-Xresources(){
	nano ~/.Xresources
}
# }}}
#{{{ Pinging
zp() {
	if [[ "$1" == "" ]]
	then
	ping 8.8.8.8
	else
	ping 192.168.0.$1
	fi
}
#}}}
#{{{ Send sms from Email
z-sms-2-phone(){
	z-smtp.gmail.py $PHONE_EMAIL_USER $PHONE_EMAIL_PASS $PHONE_EMAIL_TO $1
}
#}}}
#{{{ Rclone
z-rclone-list(){
	rclone listremotes
}
z-rclone-available-size(){
	rclone size $1 
}
#}}}
#{{{ Reptyr
z-reptyr(){
	reptyr
}
#}}}
#{{{ Docker Aliases
z-dock-run-rm(){
	docker stop $(docker ps | awk {'print $3'})
	docker rmi -f $(docker ps | awk {'print $3'})
}
z-dock-stop-rm(){
	docker rm $(docker ps -qa --no-trunc --filter "status=exited")
}
z-x11-reload() {
	# Things todo: if X11 apps doesn't work in docker.
	export DISPLAY=":0.0"
	xhost +$USER
	xhost +
}
z-dock-selenium_ffox(){
        docker run -it --rm \
        -e DISPLAY=$DISPLAY \
        -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
        niranjanshr13/selenium_firefox \
        /bin/bash
}
z-dock-selenium_pantomjs() {
        docker run -it \
        niranjanshr13/selenium_phantomjs \
        /bin/bash
}
z-dock-jdownloader() {
# https://github.com/PlusMinus0/headless-jd2-docker
        docker run -d --name jdownloader-headless \
        -v /config/jd2:/opt/JDownloader/cfg \
        -v /home/user/Downloads:/root/Downloads \
        plusminus/jdownloader2-headless
}
z-dock-python3() {
        docker run -it --rm \
        python:3.3.6-slim \
        /bin/bash
}
z-dock-pyautogui() {
        docker run -it --rm \
        -e DISPLAY=$DISPLAY \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        niranjanshr13/python3_pyautogui \
        /bin/bash
}
z-dock-images(){
	docker images
}
z-dock-psa(){
	docker ps -a
}
# }}}
#{{{ Play primewire video from cmd
z-primewire(){
# https://pypi.python.org/pypi/primewire/1.0.2
# pip3 install primewire
## Example:
	# primewire Fargo --season 1 --episode 1
	# primewire John Wick
	primewire $@ | grep -i openload | head -1  | xargs youtube-dl -g | xargs mpv -fs 
}
#}}}
#{{{ Send primewire to phone from autoremote
z-send-primewire(){
	primewireLink=$(primewire $@ | grep -i openload | head -1 | xargs youtube-dl -g)
	curl -sI "http://autoremotejoaomgcd.appspot.com/sendmessage?key=$AUTOREMOTE_ONEPLUS_ONE_KEY&message=play=:=$primewireLink" > /dev/null 2>&1
}
#}}}
#{{{ Send primewire to tv from autoremote
z-send-primewire-tv(){
	 primewireLink=$(primewire $@ | grep -i openload | head -1 | xargs youtube-dl -g)
	curl -sI "http://autoremotejoaomgcd.appspot.com/sendmessage?key=$AUTOREMOTE_TV&message=play=:=$primewireLink" > /dev/null 2>&1
}
#}}}
#{{{ Send any online video to tv by youtube-dl
z-send-tv(){
	urlLink=$(youtube-dl -g $@)
	curl -sI "http://autoremotejoaomgcd.appspot.com/sendmessage?key=$AUTOREMOTE_TV&message=play=:="$urlLink"" > /dev/null 2>&1
}
#}}}
#{{{ Remote access
z-rdp-aws(){
	rdesktop -g 1920x1040 \ 
	$AWS_WINDOWS_ONE_IP \
	-u "Administrator" \
	-p $AWS_WINDOWS_PASSWORD \
	-P -z 2> /dev/null &
}

z-ssh-aws-one() {
        ssh -i $SSH_AWS_ONE_KEY $SSH_AWS_ONE_IP
}

z-rdp-college() {
        rdesktop \
        -g 1920x1040 \
        "$COLLEGE_RDP_WEBSITE" \
        -u "$COLLEGE_USERNAME" \
        -p $COLLEGE_PASSWORD \
        -P -z 2>/dev/null &
}
#}}}
#{{{ Fixing Xresources on Xterm
z-xrdb() {
	xrdb ~/.Xresources
}
#}}}
#{{{ Youtube-dl Aliases
#{{{List Youtube-dl support link
	alias z-youtubedl-ls='youtube-dl --list-extractors'
	z-down-safaribooks(){
	youtube-dl -u $SAFARI_EMAIL -p $SAFARI_PASSWORD -o '%(playlist_index)s. %(title)s.%(ext)s' $@
	}
#}}}
#{{{ Download Safaribooks
    z-down-safaribooks(){
    youtube-dl -u $SAFARI_EMAIL -p $SAFARI_PASSWORD -o '%(playlist_index)s. %(title)s.%(ext)s' $@
    }
#}}}
#}}}
