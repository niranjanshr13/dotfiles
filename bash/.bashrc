#{{{ Bash history
HISTSIZE=10000
HISTFILESIZE=10000
#}}}
#{{{ bash autocompletion
if [ -f /etc/bash_completion ]; then
 . /etc/bash_completion
fi
#}}}
#{{{Export
#export CHEATPATH="$CHEATPATH:/path/dir"
export BROWSER='firefox'
export MYHOME='/home/z'
export EDITOR='nvim'
export PLAYER='mpv --geometry=-0-0 --autofit=30%'
export IMAGE='feh --no-menus -q -g 640x480 $@ &'
alias zx='/h*/s*/e* && exit'
source $ANOTHER_EXPORT
#}}}
#{{{ Aliases
## changing dir.
alias bd='cd ../'
alias z='cd ../'
alias cdf='cd /home/dotfiles/'
alias ct='cd /tmp/'
alias cm='cd /mnt/'

## application
alias C='cal -y'
alias x=xterm
alias M='offlineimap'
alias P=$PLAYER
alias V=nano
alias b=$BROWSER
alias cal='cal -y'
alias chrome='google-chrome > /dev/null'
alias clipx='xclip -i -sel clip'
alias du='du -sh'
alias eog=$IMAGE
alias extract='patool extract'
alias feh=$IMAGE
alias ff=$BROWSER
alias ffmpeg-extract-one-frame='ffmpeg -i $1 -vf "select=not(mod(n\,10))" -vsync vfr -q:v 2 img_%03d.jpg' ## Select 1 frame out of every 10 frames
alias fgrep='fgrep --color=auto'
alias gimp='pinta'
alias gist-list='gist --list'
alias git-add='git add'
alias git-commit='git commit'
alias git-push='git push'
alias git-stat='git status'
alias h='htop'
alias m='mutt'
alias mp3=$PLAYER
alias mpg=$PLAYER
alias mplayer=$PLAYER
alias mpv=$PLAYER
alias n='nload -u M'
alias nano='$EDITOR'
alias nc='ncdu'
alias du='du -sh'
alias nload='nload -u M'
alias nn='$EDITOR'
alias play-cliflix='cliflix'
alias py='python3'
alias q='exit'
alias qq='exit'
alias r='ranger'
alias rmdx='find . -type d -empty -delete'
alias rmx='trash-put'
alias sndrec='arecord $1'
alias stat-sync='watch grep -e Dirty: -e Writeback: /proc/meminfo'
alias top='htop'
alias v='$EDITOR'
alias vim='$EDITOR'
alias vv='$EDITOR'
alias yt='youtube-dl'
alias z-webcam='guvcview'
alias zo='xdg-open'

# ffmpeg combine image and make it a video
# $1 = image
# $2 = mp3
# $3 = output.mp4
#alias ffmpeg_comb_vid_img='ffmpeg -loop 1 -i $1 -i $2 -shortest -c:v libx264 -c:a copy $3'

## other stuff
alias shutdown='shutdown now'
alias s='sync'
alias p='pwd'
alias c='clear'
alias cclipboard='greenclip clear'
alias cls='clear'
alias csl='clear'
alias cx='chmod +x'
alias df='df -h'
alias egrep='egrep --color=auto'
alias mk='mkdir'
alias batt-stat='cat /sys/class/power_supply/BAT1/capacity' 	## battery stat
alias bulkrename='qmv -f do -e $EDITOR' 						## bulk renaming, remember to save it
alias chrome-send='stream2chromecast -devicename SHIELD'
alias grep='grep --color=auto'
alias ipa='curl -s "ipinfo.io/ip"' 								## ip addresses.
alias pastebin='echo "$@" | curl -s -F "f:1=<-" http://ix.io' 	## Send it to pastebin
alias scan-network='sudo nmap -sP -n 192.168.0.1/24' 			## Scanning the network
alias screenshot='scrot'
alias shutdown='shutdown now'
alias ss='startx'
alias zpp='sudo rfkill unblock all' 							## unlocking all the devices.
alias pass-gen='head /dev/urandom | sha512sum | cut -c 1-10' 	## password generator.
alias xrdb='xrdb $MYHOME/.Xresources' 								## fixing Xresources on Xterm
alias night-mode='xbacklight -inc 100 && xbacklight -dec 97 && redshift -b 0.7 2>&1 /dev/null &' 	## redshift 
#alias network-fix='sudo ip link set $NICCARD down && sudo systemctl restart netctl@$ESSID.service' 	## fixing network
alias network-fix='sudo ip link set $NICCARD down && sudo systemctl stop netctl@$ESSID.service' 	## fixing network

## config file.
alias cfg-Xresources='$EDITOR $MYHOME/.Xresources'
alias cfg-bash='$EDITOR $MYHOME/.bashrc && source $MYHOME/.bashrc'
alias cfg-crontab='$EDITOR /etc/crontab'
alias cfg-env='$EDITOR /etc/environment'
alias cfg-hist='$EDITOR $HOME/.zsh_history'
alias cfg-i3-block='$EDITOR $MYHOME/.i3/i3block.conf'
alias cfg-i3='$EDITOR $MYHOME/.i3/config'
alias cfg-mutt='$EDITOR $MYHOME/.muttrc'
alias cfg-nvim='$EDITOR $MYHOME/.config/nvim/init.vim'
alias cfg-offlineimap='$EDITOR $HOME/.offlineimaprc'
alias cfg-ranger-ext='$EDITOR $MYHOME/.config/ranger/rifle.conf'
alias cfg-ranger='$EDITOR $MYHOME/.config/ranger/rc.conf'
alias cfg-rclocal='$EDITOR /etc/rc.local'
alias cfg-rclone='$EDITOR $MYHOME/.config/rclone/rclone.conf'
alias cfg-tmux='$EDITOR $MYHOME/.tmux.conf'
alias cfg-vim-snippet-py='$EDITOR $MYHOME/.vim/bundle/vim-snippets/snippets/python.snippets'
alias cfg-zsh='$EDITOR $MYHOME/.zshrc'

## ls stuff
alias l='ls -CF'
alias la='ls -a --color=auto'
alias ll='ls -alF'
alias ls='ls --color=auto'
alias lsa='ls -a'
alias sl='ls'
alias lsl='ls -lh'

## sources stuff
alias R='source $MYHOME/.zshrc && source $MYHOME/.bashrc'
alias src-refresh='source $MYHOME/.zshrc && source $MYHOME/.bashrc'
alias zz='source $MYHOME/.zshrc && source $MYHOME/.bashrc'

## remote access
alias aws-rdp='rdesktop -g 1920x1040 $aws_windows_one_ip -u "administrator" -p $aws_windows_password -p -z 2> /dev/null &'
alias aws-ssh='ssh -i $ssh_aws_one_key $ssh_aws_one_ip'
alias college-rdp='rdesktop -g 1920x1040 "$college_rdp_website" -u "$college_username" -p $college_password -p -z 2>/dev/null &'

# Docker Aliases
alias dock-run-rm='docker stop $(docker ps | awk {'print $3'}) && docker rmi -f $(docker ps | awk {'print $3'})'
alias dock-stop-rm='docker rm $(docker ps -qa --no-trunc --filter "status=exited")'
alias dock-x11-reload='export DISPLAY=":0.0" && xhost +$USER && xhost +' ##  if X11 apps doesn't work in docker.
alias dock-selenium_ffox='docker run -it --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix:rw niranjanshr13/selenium_firefox /bin/bash'
alias dock-selenium_pantomjs='docker run -it niranjanshr13/selenium_phantomjs /bin/bash'
alias dock-facebook-messenger='docker run -it niranjanshr13/selenium_phantomjs /bin/bash'
alias dock-jdownloader='docker run -d --name jdownloader-headless -v /config/jd2:/opt/JDownloader/cfg -v /home/user/Downloads:/root/Downloads plusminus/jdownloader2-headless'
alias dock-python3='docker run -it --rm python:3.3.6-slim /bin/bash'
alias dock-pyautogui='docker run -it --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix niranjanshr13/python3_pyautogui /bin/bash'
alias dock-images='docker images'
alias dock-psa='docker ps -a'

## Youtube-dl Aliases
alias ytdl-ls='youtube-dl --list-extractors' 				## List Youtube-dl support link
alias ytdl-url='youtube-dl -g' 								## print url
alias ytdl-safaribooks='youtube-dl -u $SAFARI_EMAIL -p $SAFARI_PASSWORD -o "%(playlist_index)s. %(title)s.%(ext)s" $@}' 	## Downloading safaribooks videos.


# Pinging
zp() {
  if [[ "$1" == "" ]]
  then
    ping 8.8.8.8
  else
    ping 192.168.0.$1
  fi
}

Timage() {
  W3MIMGDISPLAY="/usr/lib/w3m/w3mimgdisplay"
  FILENAME=$1
  FONTH=14 # Size of one terminal row
  FONTW=8  # Size of one terminal column
  COLUMNS=`tput cols`
  LINES=`tput lines`
read width height <<< `echo -e "5;$FILENAME" | $W3MIMGDISPLAY`
  max_width=$(($FONTW * $COLUMNS))
  max_height=$(($FONTH * $(($LINES - 2)))) # substract one line for prompt
if test $width -gt $max_width
then
  height=$(($height * $max_width / $width))
  width=$max_width
fi
if test $height -gt $max_height
then
  width=$(($width * $max_height / $height))
  height=$max_height
fi
  w3m_command="0;1;0;0;$width;$height;;;;;$FILENAME\n4;\n3;"
  tput cup $(($height/$FONTH)) 0
echo -e $w3m_command|$W3MIMGDISPLAY
}
#}}}
#{{{ Send sms from Email
alias sms-2-phone='z-smtp.gmail.py $PHONE_EMAIL_USER $PHONE_EMAIL_PASS $PHONE_EMAIL_TO $1'
#}}}
#{{{ Play primewire video from cmd
# https://pypi.python.org/pypi/primewire/1.0.2
# pip3 install primewire
## Example:
	# primewire Fargo --season 1 --episode 1
	# primewire John Wick
alias play-primewire="primewire $@ | grep -i openload | head -1  | xargs youtube-dl -g | xargs $PLAYER -fs"
#}}}
#{{{ Android Automation -> Send primewire to tv from autoremote
# alias play-send-primewire-tv='primewireLink=$(primewire $@ | grep -i openload | head -1 | xargs youtube-dl -g) && curl -sI "http://autoremotejoaomgcd.appspot.com/sendmessage?key=$AUTOREMOTE_TV&message=play=:=$primewireLink"'

## Send any online video to tv by youtube-dl
alias play-send-tv='curl -sI "http://autoremotejoaomgcd.appspot.com/sendmessage?key=$AUTOREMOTE_TV&message=play=:="$(youtube-dl -g $@)"'
#}}}
#{{{ create dummy webcam
# ffmpeg -re -i $1 -f v4l2 /dev/video2D
#}}}
#{{{ Tmux on startup
#if command -v tmux>/dev/null; then
#  [[ ! $TERM =~ xterm ]] && [ -z $TMUX ] && exec tmux
#fi
#}}}
#set -o vi
