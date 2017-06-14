#!/bin/bash
PACKAGE_MANAGER="apt"
#{{{Cloning github
mkdir -p /home/public/dotfiles
chmod 777 /home/public
git clone https://github.com/niranjanshr13/dotfiles.git /home/public/
#}}}
#{{{ Application List
Installation(){
	curl \
	docker.io \
	git \
	htop \
	i3 \
	irrsi \
	mpv \
	mutt \
	nohup \
	pactl \
	patool \
	pinta \
	python3 \
	python3-pip \
	ranger \
	ranger \
	rdesktop \
	redshift \
	reptyr \
	scrot \
	scrot \
	sqlite3 \
	sqlitebrowser \
	ssh \
	vim \
	xbacklight \
	xsel \
	xterm \
    byobu \
    chromium-browser \
    feh \
    ffmpeg \
    freerdp-x11 \
    xorg \
    zsh \
}
#}}}
#{{{ Installing Package
for PACKAGE_MANAGER in Installation()
do
sudo apt install -y $PACKAGE_MANAGER
done
#}}}
#{{{ Rclone
curl http://downloads.rclone.org/rclone-current-linux-amd64.zip > /tmp/rclone.zip
unzip /tmp/rclone.zip -d /tmp/rclone
chmod a+x /tmp/rclone/rclone
mv /tmp/rclone /bin/rclone
#}}}#}}}#}}}
#{{{ Installing Cheat-Sheet
sudo pip3 install cheat
mkdir /tmp/cheatsheet/
mv /usr/local/lib/python3.5/dist-packages/cheat/cheatsheets/__* /tmp/cheatsheet/
rm /usr/local/lib/python3.5/dist-packages/cheat/cheatsheets/*
mv /tmp/cheatsheet/* /usr/local/lib/python3.5/dist-packages/cheat/cheatsheets/
#}}}
#{{{ python3 module
sudo pip3 install \
	qutebrowser \
#	praw \
	instagram-scraper \
#	flick_api	\
#	temp-mail \
	rainbowstream \
#	pyopt \
	pip \
	qrcode
#	fbchat 
#}}}
#{{{ Installing Youtube-dl
sudo wget https://yt-dl.org/latest/youtube-dl -O /usr/local/bin/youtube-dl
sudo chmod a+x /usr/local/bin/youtube-dl
sudo youtube-dl hash -r
sudo youtube-dl -U
#}}}
#{{{ Docker Config
sudo groupadd docker
sudo gpasswd -a ${USER} docker
# sudo usermod -aG docker $USER
#}}}}
#{{{ install keybase
#curl -O https://dist.keybase.io/linux/deb/keybase-latest-amd64.deb && sudo dpkg -i keybase-latest-amd64.deb && rm keybase-latest-amd64.deb
#}}}
#{{{ install ripme.jar
# wget http://rarchives.com/ripme.jar -0 ~/.custom_shortcut/app/ripme.jar
#}}}
#{{{ Installing npm softwares
#curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
#}}}
#{{{ Installing npm module
#sudo npm install -g \
	#xlyrics \
	#clitr \
	#hma-proxy-scraper \
	#tumblr-downloader \
	#peerflix \
	#torrentflix
#}}}
#{{{ Installing GIST
# sudo gem install gist
#}}}
#{{{Changing grub timeout.
# sudo sed -i 's/GRUB_TIMEOUT=10/GRUB_TIMEOUT=3/g' /etc/default/grub
# grub-mkconfig -o /boot/grub/grub.cfg
#}}}
#{{{Adblock in the system
#curl -s http://winhelp2002.mvps.org/hosts.txt > /tmp/adblock/host_file_block
#curl -s http://adaway.org/hosts.txt >> /tmp/adblock/host_file_block
#curl -s https://www.malwaredomainlist.com/hostslist/hosts.txt >> /tmp/adblock/host_file_block
#curl -s https://raw.githubusercontent.com/StevenBlack/hosts/master/data/StevenBlack/hosts >> /tmp/adblock/host_file_block
#sed -i 's/127.0.0.1/0.0.0.0/g' /tmp/adblock/host_file_block
#sudo cat ~/host_file_block >> /etc/hosts
#rm /tmp/adblock/host_file_block
#}}}
#{{{ Git Project following
# ====================
# https://github.com/rohanpai/Robinhood
#}}}
#{{{ List all installed app
# sudo dpkg --get-selections
#}}}
#{{{ List all installed python module
# import pip
# pip.get_installed_distributions
#}}}
