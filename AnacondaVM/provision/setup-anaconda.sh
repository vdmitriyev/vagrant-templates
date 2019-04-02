#!/bin/bash

echo "Trying to install Anaconda"
# anaconda=Anaconda-2.3.0-Linux-x86_64.sh
# anaconda=Anaconda3-5.0.1-Linux-x86.sh
anaconda=Anaconda3-2018.12-Linux-x86_64.sh


if [ ! -f "$anaconda" ]; then
    echo "Downloading Anaconda installer. This may take more than a few minutes."
	wget -q -o /dev/null - https://repo.anaconda.com/archive/"$anaconda"
else
	echo "Anaconda is already downloaded."
fi

if [ -f "$anaconda" ];  then
	if [ ! -d "/opt/anaconda/" ]; then
		chmod +x "$anaconda"
		./"$anaconda" -b -p /opt/anaconda
		
		# for anaconda
		PATH=/opt/anaconda/bin:$PATH
		echo "Anaconda was installed."
		
		echo "PATH=/opt/anaconda/bin:\$PATH" >> /home/vagrant/.bashrc
		echo "PATH was set in .bashrc"
		# conda create --name analysis python=2
		conda create --name analysis python=3
	else
		# for anaconda
		PATH=/opt/anaconda/bin:$PATH
		echo "Anaconda is already installed"
	fi
else
	echo "ERROR: Anaconda installer is not found"
fi

# jupyter notebook --generate-config

echo "Finish to install Anaconda"

# Reloading bash 
echo "Reloading .bashrc"
source /home/vagrant/.bashrc