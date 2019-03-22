#!/bin/bash

# Fix DNS
# rm /etc/resolv.conf
# ln -s ../run/resolvconf/resolv.conf /etc/resolv.conf
# resolvconf -u

# Fix DNS (Ubuntu 18.04 LTS) (just in case)
# https://bugs.launchpad.net/ubuntu/+source/systemd/+bug/1624320
# 	- https://bugs.launchpad.net/ubuntu/+source/systemd/+bug/1624320/comments/38
# rm -f /etc/resolv.conf
# ln -s /run/systemd/resolve/resolv.conf /etc/resolv.conf
# sudo nano /etc/systemd/resolved.conf
# sed -i s/"#DNS="/"DNS=8.8.8.8"/g /etc/systemd/resolved.conf
# sed -i s/"#FallbackDNS="/"FallbackDNS=8.8.4.4"/g /etc/systemd/resolved.conf
# service systemd-resolved restart

# Update cache
apt-get update

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