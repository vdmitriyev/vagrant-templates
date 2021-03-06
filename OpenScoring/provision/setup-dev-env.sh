#!/bin/bash

#
# Preparing setup
#

echo "Install git"
apt-get install -y git-core

echo "Installing maven."
apt-get install -y maven

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