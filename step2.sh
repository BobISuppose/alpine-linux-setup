#I am using this bash code on real hardware. If you need VMware tools go to https://github.com/ibuetler/alpine-linux-setup

#!/bin/ash

apk add curl socat nmap net-tools build-base setxkbmap sudo xrandr bash termite zsh dbus dbus-x11
setup-xorg-base xfce4 xfce4-terminal lightdm dbus-x11
apk add open-vm-tools open-vm-tools-guestinfo open-vm-tools-deploypkg open-vm-tools-gtk
apk add lightdm-gtk-greeter i3wm i3status libxcb-dev i3lock xf86-video-vmware dmenu
apk add mesa-gl glib feh firefox-esr accountsservice openvpn
apk add docker docker-compose

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

# add user to docker
addgroup robert docker


# give robert write access to /opt dir
chown robert:robert /opt

# mkdir /opt/docker
mkdir -p /opt/docker
cp ./docker/* /opt/docker/
chown robert:robert /opt/docker


