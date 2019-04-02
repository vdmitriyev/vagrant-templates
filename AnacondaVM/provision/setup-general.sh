#!/bin/bash

# Fix DNS:
#	-> check other vagrant files if needed


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