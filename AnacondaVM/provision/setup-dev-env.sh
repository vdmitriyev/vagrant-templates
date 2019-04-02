#!/bin/bash

echo "Install some utilities"

# Some utilities
apt-get install software-properties-common -y
apt-get install python-software-properties -y

# Compiler and headers
apt-get install gcc make build-essential linux-headers-$(uname -r)

# Prepearing setup
echo "Install git"
apt-get install git-core -y

# echo "Installing maven."
# apt-get install maven -y

# Ant
# echo "Installing Ant"
# apt-get install ant1.7 -y > /dev/null

# Lua
# echo "Installing lua"
# apt-get install lua5.1


#
# MANUL WAY
#
# mkdir /opt/
# mkdir -p /opt/maven/
# chown -R ubuntu:ubuntu /opt/

# wget -O "/opt/maven/apache-maven-3.3.9-bin.tar.gz" http://www-eu.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz
# tar -xvzf /opt/maven/apache-maven-3.3.9-bin.tar.gz -C /opt/maven/

# export M2_HOME=/opt/maven/apache-maven-3.3.9/
# export PATH=${M2_HOME}/bin:${PATH}