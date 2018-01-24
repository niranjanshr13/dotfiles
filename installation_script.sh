#!/bin/bash
echo "hdd partition for ext4"
read hdd
echo "root password"
read rootPassword
echo "create username"
read userName 
echo "username password"
read userPass
echo "hostname"
read hostname

# setting up the drive.
# might want to change into btrfs.
echo -e "o\nn\np\n1\n\n\nw" | fdisk /dev/$hdd && 
mkfs.ext4 /dev/$hdd\1 && 
mount /dev/$hdd\1 /mnt && 
#mkdir -p /mnt/home && 
pacstrap /mnt base base-devel vim && 
genfstab '/mnt' > '/mnt/etc/fstab' &&

# locale
echo 'en_US.UTF-8 UTF-8' > /etc/locale.gen &&
arch-chroot /mnt /bin/bash -c '/bin/sh locale-gen' &&
echo 'LANG=en_US.UTF-8' > /etc/locale.conf &&

# Time
ln -s /usr/share/zoneinfo/America/New_York /etc/localtime &&
arch-chroot /mnt /bin/bash -c '/bin/sh hwclock --systohc --utc' &&

# root passwd
arch-chroot /mnt /bin/bash -c "echo "root:$rootPassword" | chpasswd  && useradd -m -d /home/$userName $userName && echo "$userName:$userPass" | chpasswd" &&

# sudoer
# echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> '/etc/sudoers'

# hostname
echo "$hostname" > '/mnt/etc/hostname' &&

# installing dhcpd
pacstrap /mnt dhcpd &&

# enabling dhcpd
arch-chroot /mnt /bin/bash -c 'systemctl enable dhcpcd' &&

# grub stuff
pacstrap /mnt grub os-prober &&
arch-chroot /mnt /bin/bash -c ' grub-install /dev/sda && grub-mkconfig -o /boot/grub/grub.cfg' &&
#arch-chroot /mnt /bin/bash -c 'pacman -S grub os-prober && grub-install /dev/sda && grub-mkconfig -o /boot/grub/grub.cfg' &&

# installing X
pacstrap /mnt xorg i3 pulseaudio-alsa &&

# installing packages.
pacstrap /mnt 	firefox \
				mpv \
				mutt \
				htop \
				feh \
				rofi \
				curl \
				wget \
				aria2 \
				redshift \
				openssh \
				irssi \
				rdesktop \
				scrot \
				xsel \
				pinta \
				sqlitebrowser \
				reptyr \
				docker \
				tmux \
				dosfstools \
				stow \ 
				pactl \
				xbacklight \
    			zsh \
				ffmpeg
    #byobu \
    #chromium-browser \
#    freerdp-x11 \

# Setting up the ranger
pacstrap /mnt ranger w3
ranger --copy-config=scope
bash /home/$USER/.config/ranger/scope.sh # fix this.

# installing python3
pacstrap /mnt python3
curl https://bootstrap.pypa.io/get-pip.py >> /mnt/tmp/get-pip.py
arch-chroot /mnt /bin/bash -c 'python3 /tmp/get-pip.py'

# installing cheat
arch-chroot /mnt /bin/bash -c 'sudo pip3 install cheat'
rm $(ls /mnt/usr/local/lib/python3.5/dist-packages/cheat/cheatsheets/ | grep -v '__')

sudo pip3 install \
#   qutebrowser \
#   praw \
#   instagram-scraper \
#   flick_api   \
#   temp-mail \
    rainbowstream \
#   pyopt \
    qrcode
#   fbchat

# Installing Youtube-dl
sudo wget https://yt-dl.org/latest/youtube-dl -O /usr/local/bin/youtube-dl
sudo chmod a+x /usr/local/bin/youtube-dl
sudo youtube-dl hash -r
sudo youtube-dl -U

# installing rclone
yaorut -Sy rclone 

# tagging file.
yaourt -S tmsu

npm install -g cliflix
yaourt -S stream2chromecast
pacman -S renameutils

# python virtual-env, because something package conflict.
pip3 install virtualenv

# its for the pyicloud
mkdir -p /home/$userName/.python-env/pyicloud
virtualenv /home/$userName/.python-env/pyicloud
source /home/$userName/.python-env/pyicloud/bin/activate
pip3 install pyicloud
deactivate

# install r-markdown
# install luks-crypt

sed -i 's/GRUB_TIMEOUT=10/GRUB_TIMEOUT=3/g' /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg

# Docker Config
sudo groupadd docker
sudo gpasswd -a ${USER} docker
# sudo usermod -aG docker $USER

#{{{Cloning github
mkdir -p /home/public/dotfiles
chmod 777 /home/public
$PACKAGE_MANAGER git
git clone https://github.com/niranjanshr13/dotfiles.git /home/public/
#}}}
#{{{ install keybase
#curl -O https://dist.keybase.io/linux/deb/keybase-latest-amd64.deb && sudo dpkg -i keybase-latest-amd64.deb && rm keybase-latest-amd64.deb
#}}}
#{{{ Installing npm softwares
#curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
#}}}
#{{{ Installing GIST
# sudo gem install gist
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
#{{{ List all installed python module
# import pip
# pip.get_installed_distributions
#}}}


# note:
not completed or checked in the new machine
remove yaourt, install pacaur {security concern}
check on the new machine or vm
