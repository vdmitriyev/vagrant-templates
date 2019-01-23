#!/bin/bash

# Fix DNS (Ubuntu 16.04 LTS)
rm /etc/resolv.conf
ln -s ../run/resolvconf/resolv.conf /etc/resolv.conf
resolvconf -u

# Update cache
apt-get update -y

# Upgrade packages
apt-get upgrade -y

# Install dependencies
apt-get install unzip -y
apt-get install dos2unix -y
apt-get install htop -y
apt-get install mc -y

# Just in case host is a windows system
dos2unix /vagrant/provision/*.sh
# dos2unix /vagrant/configs/*.sh