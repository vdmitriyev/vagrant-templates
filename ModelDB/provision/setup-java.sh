#!/bin/bash

# Install Oracle Java 8
echo "Download and install Oracle Java 8"
add-apt-repository ppa:webupd8team/java
apt-get update

# Disable prompting
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
apt-get install oracle-java8-installer -y
export JAVA_HOME=/usr/lib/jvm/java-8-oracle