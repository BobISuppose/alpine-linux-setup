#Using ibuetlers alpine-linux-setup bash code for my alpine setup. https://github.com/ibuetler/alpine-linux-setup

#!/bin/ash

rc-service dbus start
rc-update add dbus

rc-service lightdm start
rc-update add lightdm

rc-service docker start
rc-update add docker boot


