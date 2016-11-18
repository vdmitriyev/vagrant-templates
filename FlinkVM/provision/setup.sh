#!/bin/bash
echo "Provisioning virtual machine..."

# Always good ideas to update apt-get before installing anything
sudo apt-get update

# Some utilities
sudo apt-get install -y software-properties-common
sudo apt-get install -y python-software-properties
sudo apt-get install -y python-pip python-dev

# Compiler and headers
apt-get install -y gcc make build-essential linux-headers-$(uname -r)

# Ansible
echo "Installing ansible"
# Adding ansible PPA
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt-get update
sudo apt-get install ansible -y

cd /home
chown -R vagrant:vagrant /vagrant

echo "Finished provisioning."