#!/bin/bash
echo "Provisioning virtual machine..."

# Anaconda
echo "Installing anaconda"
anaconda=Anaconda-2.3.0-Linux-x86_64.sh

if [ ! -f "$anaconda" ]; then
    echo "Downloading Anaconda installer. This may take more than a few minutes."
	wget -q -o /dev/null - https://3230d63b5fc54e62148e-c95ac804525aac4b6dba79b00b39d1d3.ssl.cf1.rackcdn.com/Anaconda-2.3.0-Linux-x86_64.sh
else
	echo "Already downloaded."
fi

if [ -f "$anaconda" ];  then

	chmod +x "$anaconda"
	./"$anaconda" -b -p /opt/anaconda
	
	# For anaconda
	PATH=/opt/anaconda/bin:$PATH
	echo "Anaconda installed and path set."
else
	echo "ERROR: Anaconda installer is not found"
fi

echo "Finished provisioning."