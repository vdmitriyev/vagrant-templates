#!/bin/bash

#
# Install Oracle Java 8
#
# THIS SOLUTION IS NOT WORKING ANYMORE 
# because Oracle changed it's license 
# echo "Download and install Oracle Java 8"
# add-apt-repository ppa:webupd8team/java
# apt-get update
# Disable prompting
# echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
# echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
# apt-get install oracle-java8-installer -y
# export JAVA_HOME=/usr/lib/jvm/java-8-oracle

# echo "Install Open JDK 8"
apt-get install openjdk-8-jdk-headless -y