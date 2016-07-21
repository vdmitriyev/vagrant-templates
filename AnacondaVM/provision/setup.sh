#!/bin/bash
echo "Provisioning virtual machine..."

# Anaconda

echo "Trying to install Anaconda"
anaconda=Anaconda-2.3.0-Linux-x86_64.sh

if [ ! -f "$anaconda" ]; then
    echo "Downloading Anaconda installer. This may take more than a few minutes."
	wget -q -o /dev/null - http://repo.continuum.io/archive/Anaconda2-4.1.1-Linux-x86_64.sh
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
		conda create --name analysis python=2
	else
		# for anaconda
		PATH=/opt/anaconda/bin:$PATH
		echo "Anaconda is already installed"
	fi
else
	echo "ERROR: Anaconda installer is not found"
fi

# Jupyter
#

# Always good ideas to update apt-get before installing anything
sudo apt-get update

# Git
echo "Installing Git"
apt-get install git -y > /dev/null

# JDK
echo "Installing Java JDK"
sudo apt-get install default-jdk -y > /dev/null

# Ant
echo "Installing Ant"
apt-get install ant1.7 -y > /dev/null

# Lua
# apt-get install lua5.1

# Compiler and headers
apt-get install gcc make build-essential linux-headers-$(uname -r)

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

cd /home
chown -R vagrant:vagrant /vagrant
echo "Finished provisioning."