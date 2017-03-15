# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100
HISTFILESIZE=100

# =====
# Normal Aliases
alias ss='startx'
alias mplayer='mpv'
alias q='exit'
alias df='df -h'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -alF'
alias la='ls -a --color=auto'
alias l='ls -CF'
alias z-kill-chrome='kill -9 $(ps aux  | grep chromium | grep -v 'grep' | awk '{ print $2 }') '
alias bd='cd ../'
alias rm='trash-put'
alias mk='mkdir'										## mkdir alias
alias c='cd'											## cd alias
alias l='ls'                                                                                    ## ls aliases
alias cs='clear'										## clear terminal
alias sl='ls'                                                                                   ## alias for ls
alias cls='clear'                                                                               ## clear terminal
alias csl='clear'                                                                               ## Clear alias
alias nano='vim'                                                                            ## Customizing nano
alias vv='vim'											## alias vim
alias nn='vim'											## alias nano
alias zo='xdg-open'		                                                                ## use xdg-open command
alias z-screenshot='scrot'                                                                      ## take a screenshot
alias chrome='chromium-browser'									## alias for chromium-browser
alias z-gist-list='gist --list'                                                                 ## List all gist on the internet
alias z-xclip='xclip -i -sel clip'                                                              ## right way to use xclip
alias z-src-refresh='source ~/.zshrc'                                                           ## refresh source
alias zz='source ~/.zshrc'									## refresh source
alias eog='feh'											## aliases eog of feh
alias zo-fb='chrome "facebook.com" > /dev/null 2>&1 & '						## open facebook.com
alias ff='firefox'										## alias for firefox
alias cc='chrome'										## alias for chrome
alias qq='exit'											## alias for exit
alias cx='chmod +x'										## chmod executable.
alias z-unzip='patool extract'									## Extract from archieve
alias z-shutdown='init 0'									## Poweroff aliases
alias z-reboot='init 6'										## Reboot aliases
alias feh='feh --scale-down'									## Customizing feh
alias rr='ranger'										## ranger alias
alias yt='youtube-dl'										## Youtube-dl alias
alias z-loop='while : ; do $@ ; done'
alias z-git-push='git push'
alias z-git-commit='git commit'
alias z-git-stat='git status'
alias z-git-add='git add'
# =====
# Directory
alias zct='cd /tmp/'										## Shortcut to tmp 
# =====
alias z-peerflix="peerflix "$@" -v -r"                                                          ## peerflix module
# =====
z-redshift() {
	xbacklight -inc 100
	xbacklight -dec 97
	redshift -b 0.7 2>&1 /dev/null &
}
# =====
z-down4me() {
checker=$(curl -s "isup.me/$1" | grep 'class="domain"' | grep -o ".*<a" | sed 's/  //g' | sed 's/<a//g')
if [ "$checker" != "" ]
then
echo "$checker"
else
echo 'Internet is down'
fi
}
# ====
z-batt-stat() {
	echo "Computer is currently $(cat /sys/class/power_supply/BAT1/status)"
	echo "$(cat /sys/class/power_supply/BAT1/capacity)% Battery Level"
}
# ====
zpp() {
	sudo rfkill unblock all
}
# ====
z-myip () {
echo "curl -s 'ipinfo.io'"
echo "Internal IP = $(ifconfig | perl -nle'/dr:(\S+)/ && print $1' | grep -v 127.0.0.1 | sed ':a;N;$!ba;s/\n/, /g')"
echo "Gateway     = $(ip route show | awk '$3 ~ /^[1-9]+/ {print $3;}')"
echo "Mac Address = $(ifconfig -a | grep HWaddr | awk '{print $5 }' | sed ':a;N;$!ba;s/\n/, /g' )"
}
# ===
z-pastebin() {
if [[ "$@" = '' ]]
then
echo "type any argument to be in paste"
else
if [[ "$(curl -s  http://ipinfo.io/ip)" = '' ]]
then
echo "Internet Is down"
else
echo "$@" | curl -s -F "f:1=<-" http://ix.io
fi
fi
}
# ====
zn-scan-network() {
	# show all the mac-address on the network.
	fing -r 1 --silent | grep 'HW Address' | awk '{print $3}' | sed 's/://g'
}
# ====
zn-instagram-follower-count() {
curl -s http://socialblade.com/instagram/user/$1 | grep '<div class="stats-top-data-content" style="font-size: 0.9em;">' | head -1 | grep -o '>.*' | sed 's/>//g' | sed 's/\/div//g' | sed 's/<//g' | sed 's/,//g'
}
# ====

# Hacking
# -------
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

# --------

z-rdp-college() {
	rdesktop \
	-g 1920x1040 \
	"$COLLEGE_RDP_WEBSITE" \
	-u "$COLLEGE_USERNAME" \
	-p $COLLEGE_PASSWORD \
	-P -z 2>/dev/null &
}

z-ffmpeg_comb_vid_img() {
# $1 = image
# $2 = mp3
# $3 = output.mp4
ffmpeg -loop 1 -i $1 -i $2 -shortest -c:v libx264 -c:a copy $3
}


# Configuration Files
# -------------------
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
	nano ~/.bashrc
}

# -------------------

zp() {

if [[ "$1" == "" ]]
then
ping 8.8.8.8
else
ping 192.168.0.$1
fi
}



# server ssh
# ----------
z-ssh-aws-one() {
	ssh -i $SSH_AWS_ONE_KEY $SSH_AWS_ONE_IP
}



z-sms-2-phone(){
	z-smtp.gmail.py $PHONE_EMAIL_USER $PHONE_EMAIL_PASS $PHONE_EMAIL_TO $1
}




z-rclone-list(){
	rclone listremotes
}

z-rclone-available-size(){
	rclone size $1 
}



z-reptyr(){
	reptyr
}

z-dock-rmall(){
	docker stop $(docker ps | awk {'print $3'})
	docker rmi -f $(docker ps | awk {'print $3'})
}

z-primewire(){
# https://pypi.python.org/pypi/primewire/1.0.2
# pip3 install primewire
## Example:
	# primewire Fargo --season 1 --episode 1
	# primewire John Wick
	primewire $@ | grep -i openload | head -1  | xargs youtube-dl -g | xargs mpv -fs 
}

z-send-primewire(){
	primewireLink=$(primewire $@ | grep -i openload | head -1 | xargs youtube-dl -g)
	curl -sI "http://autoremotejoaomgcd.appspot.com/sendmessage?key=$AUTOREMOTE_ONEPLUS_ONE_KEY&message=play=:=$primewireLink" > /dev/null 2>&1
}

z-send-primewire-tv(){
	 primewireLink=$(primewire $@ | grep -i openload | head -1 | xargs youtube-dl -g)
	curl -sI "http://autoremotejoaomgcd.appspot.com/sendmessage?key=$AUTOREMOTE_TV&message=play=:=$primewireLink" > /dev/null 2>&1
}

z-send-tv(){
	urlLink=$(youtube-dl -g $@)
	curl -sI "http://autoremotejoaomgcd.appspot.com/sendmessage?key=$AUTOREMOTE_TV&message=play=:="$urlLink"" > /dev/null 2>&1
}


z-down-safaribooks(){
	youtube-dl -u $SAFARI_EMAIL -p $SAFARI_PASSWORD -o '%(playlist_index)s. %(title)s.%(ext)s' $@
}

z-rdp-aws(){
	rdesktop -g 1920x1040 $AWS_WINDOWS_ONE_IP -u "Administrator" -p $AWS_WINDOWS_PASSWORD -P -z 2> /dev/null &
}
