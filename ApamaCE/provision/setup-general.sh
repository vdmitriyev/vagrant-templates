#!/bin/bash

# Fix DNS
rm /etc/resolv.conf
ln -s ../run/resolvconf/resolv.conf /etc/resolv.conf
resolvconf -u

# Update cache
apt-get update

# Upgrade packages
apt-get upgrade -y

# Install dependencies
apt-get install unzip -y
