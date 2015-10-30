#!/bin/bash
echo "Provisioning virtual machine..."

# Anaconda

echo "Trying to install Anaconda"
anaconda=Anaconda-2.3.0-Linux-x86_64.sh

if [ ! -f "$anaconda" ]; then
    echo "Downloading Anaconda installer. This may take more than a few minutes."
	wget -q -o /dev/null - https://3230d63b5fc54e62148e-c95ac804525aac4b6dba79b00b39d1d3.ssl.cf1.rackcdn.com/Anaconda-2.3.0-Linux-x86_64.sh
else
	echo "Anaconda is already downloaded."
fi

if [ -f "$anaconda" ];  then
	if [ ! -d "/opt/anaconda/" ]; then
		chmod +x "$anaconda"
		./"$anaconda" -b -p /opt/anaconda
		
		# For anaconda
		PATH=/opt/anaconda/bin:$PATH
		echo "Anaconda was installed."
		
		echo "PATH=/opt/anaconda/bin:\$PATH" >> /home/vagrant/.bashrc
		echo "PATH was set in .bashrc"
		conda create --name analysis python=2
	else
		# For anaconda
		PATH=/opt/anaconda/bin:$PATH
		echo "Anaconda is already installed"
	fi
else
	echo "ERROR: Anaconda installer is not found"
fi

# Jupyter

# Git
echo "Installing Git"
apt-get install git -y > /dev/null

# Reloading bash 
echo "Reloading .bashrc"
source /home/vagrant/.bashrc

# Starting IPython Notebook
echo "Trying to start IPython Notebook"
notebook="/home/vagrant/ipython"
if [ -d "$notebook" ]; then
	ipython notebook --ip='*' --notebook-dir="$notebook" &
else
	echo "ERROR: IPython Notebook was not started."
	echo "INFO: Try to create folder $notebook"
fi

echo "Finished provisioning."