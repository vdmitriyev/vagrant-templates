#!/bin/bash

# Install Apama CE 10.1
echo "Download and install Apama CE (v10.1)"

apamace=apama_10.1.0.1_amd64_linux.zip
apamacefolder=apama_10.1.0.1_amd64_linux

if [ ! -f "$apamace" ]; then
    echo "Downloading Apama CE installer. This may take more than a few minutes."
	wget -q -o /dev/null - https://downloads.apamacommunity.com/apama/10.1.0.1/"$apamace"
else
	echo "Apama CE is already downloaded."
fi

if [ -f "$apamace" ];  then
	unzip "$apamace"
else
	echo "ERROR: Apama CE installer was not found."
fi