#I am using this bash code on real hardware. If you need VMware tools go to https://github.com/ibuetler/alpine-linux-setup

#!/bin/ash

apk add curl wget socat nmap net-tools setxkbmap sudo xrandr bash zsh dbus dbus-x11
setup-xorg-base dbus-x11
apk add plasma sddm sddm-kcm kde-applications
apk add mesa-gl glib feh fish firefox-esr vlc accountsservice
apk add xf86-video-vesa

# add user
adduser robert
mkdir -p /home/robert/wallpaper
mkdir -p /home/robert/.config/i3

# user setup robert
cp ./robert/wallpaper/compass.jpg /home/robert/wallpaper/compass.jpg
cp ./robert/.config/i3/config /home/robert/.config/i3/config
cp ./robert/.profile /home/robert/.profile
mkdir -p /home/robert/.scripts
cp ./robert/login-script.sh /home/robert/.scripts/login-script.sh
chown -R robert:robert /home/robert

# add robert to sudoers
cat ./robert/sudoers >> /etc/sudoers

# greeter background
echo "background=/home/robert/wallpaper/compass.jpg" >> /etc/lightdm/lightdm-gtk-greeter.conf

# set background image in accountsservice
cp ./robert/robert /var/lib/AccountsService/users
chown root:root /var/lib/AccountsService/users/robert

# give robert write access to /opt dir
chown robert:robert /opt



