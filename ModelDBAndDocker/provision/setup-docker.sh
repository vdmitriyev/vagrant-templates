#!/bin/bash

# Based on the following article
# - https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04
echo "Install docker on the VM"

apt install -y apt-transport-https ca-certificates curl software-properties-common
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
apt update
apt-cache policy docker-ce
apt install -y docker-ce
systemctl status docker