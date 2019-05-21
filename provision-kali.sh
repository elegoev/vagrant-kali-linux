#!/bin/bash

# install firewall tools
sudo apt-get install ufw -y
sudo apt-get install gufw -y

# # Install xrdp
sudo apt-get install -y xrdp
sudo cp /vagrant/km-00000807.ini /etc/xrdp/km-00000807.ini
sudo chmod 644 /etc/xrdp/km-00000807.ini

# # restart xrdp
sudo systemctl stop xrdp
sudo systemctl start xrdp

# set firewall
# sudo ufw disable
sudo ufw allow ssh
sudo ufw allow 3389

# set version
lsb_release -a | grep Release | awk '{print $2}' > /vagrant/version
