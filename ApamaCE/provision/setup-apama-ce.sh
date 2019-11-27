#!/bin/bash

# Prepearing setup
echo "Preparing Apama CE (v10.5) setup"

mkdir /opt/softwareag/
chown -R ubuntu:ubuntu /opt/softwareag/

mkdir /vagrant/downloads/
cd /vagrant/downloads/

# Install Apama CE 
echo "Download and install Apama CE"

apamace=apama_10.5.0.2_amd64_linux.zip	
apamacefolder=apama_10.5.0.2_amd64_linux

if [ ! -f "$apamace" ]; then
    echo "Downloading Apama CE installer. This may take more than a few minutes."
	wget -q -o /dev/null - https://downloads.apamacommunity.com/apama/10.5.0.2/"$apamace"
else
	echo "Apama CE is already downloaded."
fi

if [ -f "$apamace" ];  then
	unzip -q "$apamace"
else
	echo "ERROR: Apama CE installer was not found."
fi

echo "User ./install for further actions (under 'ubuntu' user or sudo/root (not recommender by Apama)), because sag installation utility requires intensive interaction."