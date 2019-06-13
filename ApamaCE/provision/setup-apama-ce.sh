#!/bin/bash

# Prepearing setup
echo "Preparing Apama CE (v10.1) setup"

mkdir /opt/softwareag/
chown -R ubuntu:ubuntu /opt/softwareag/

# Install Apama CE 10.1
echo "Download and install Apama CE (v10.3)"

apamace=apama_10.3.1.1_amd64_linux.zip	
apamacefolder=apama_10.3.1.1_amd64_linux

if [ ! -f "$apamace" ]; then
    echo "Downloading Apama CE installer. This may take more than a few minutes."
	wget -q -o /dev/null - https://downloads.apamacommunity.com/apama/10.3.1.1/"$apamace"
else
	echo "Apama CE is already downloaded."
fi

if [ -f "$apamace" ];  then
	unzip -q "$apamace"
else
	echo "ERROR: Apama CE installer was not found."
fi

echo "User ./install for further actions, because sag installation utility requires intensive interaction."