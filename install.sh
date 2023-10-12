#!/bin/bash

echo "Installing network interface renamer Dependencies"
sudo apt-get update
# Install the required packages via apt-get
sudo apt-get -y install

cat << EOF > /etc/udev/rules.d/70-persistent-net.rules
SUBSYSTEM=="net", ACTION=="add", DRIVERS=="?*", ATTR{dev_id}=="0x0", ATTR{type}=="1", KERNEL=="eth0", NAME="eth1" 
SUBSYSTEM=="net", ACTION=="add", DRIVERS=="?*", ATTR{dev_id}=="0x0", ATTR{type}=="1", KERNEL=="usb0", NAME="eth0"
EOF

# If you need to differentiate install for armhf and i386 you can get 
#the variable like this DPKG_ARCH=`dpkg --print-architecture`
# Then use it to differentiate your install

#requred to end the plugin install
echo "plugininstallend"
