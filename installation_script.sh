#!/bin/bash
# $1 = device (/dev/sda)
# $2 = root password
# $3 = new user name
# $4 = new user passwd
# $5 = hostname

# setting up the drive.
fdisk /dev/$1 && 
mkfs.ext4 /dev/$1\1 && 
mount /dev/sda1 /mnt && 
mkdir -p /mnt/home && 
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
arch-chroot /mnt /bin/bash -c "echo "root:$2" | chpasswd  && useradd -m -d /home/$3 $3 && echo "$3:$4" | chpasswd" &&

# sudoer
# echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> '/etc/sudoers'

# hostname
echo "$5" > '/mnt/etc/hostname' &&

# enabling dhcpd
arch-chroot /mnt /bin/bash -c 'systemctl enable dhcpcd' &&

# grub stuff
pacstrap /mnt grub os-prober &&
arch-chroot /mnt /bin/bash -c ' grub-install /dev/sda && grub-mkconfig -o /boot/grub/grub.cfg' &&
#arch-chroot /mnt /bin/bash -c 'pacman -S grub os-prober && grub-install /dev/sda && grub-mkconfig -o /boot/grub/grub.cfg' &&

# installing yaourt
echo '
[archlinuxfr]
SigLevel = Never
Server = http://repo.archlinux.fr/$arch' >> '/mnt/etc/pacman.conf' &&
arch-chroot /mnt /bin/bash -c 'pacman -S yaourt --noconfirm' &&

# installing X
pacstrap /mnt xorg i3 pulseaudio-alsa &&

#-----
# need to fix.

# installing packages.
pacstrap /mnt firefox mpv mutt htop feh rofi curl wget aria2 redshift openssh irssi rdesktop scrot xsel pinta sqlitebrowser reptyr docker tmux dosfstools 
	stow \ 
    pactl \
    patool \
    xbacklight \
    #byobu \
    chromium-browser \
    #ffmpeg \
    freerdp-x11 \
	xterm \
    zsh \

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
#git clone 'https://github.com/Pat-Carter/stream2chromecast'