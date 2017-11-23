#!/bin/bash

#
# Pentaho Data Integration - Download, unzip and move the folder to "/opt"
#

PDI="pdi-ce-7.1.0.0-12.zip"
PDI_URL="https://sourceforge.net/projects/pentaho/files/Data%20Integration/7.1/"

if [ ! -f /vagrant/downloads/$PDI ]; then
    echo "Downloading Pentaho Data Integration ($PDI)"
	mkdir -p /vagrant/downloads/
	wget -q $PDI_URL/$PDI -P /vagrant/downloads/
fi

echo "Installing/unzipping Pentaho Data Integration ($PDI)"

mkdir -p /opt/pentaho/

# Extract for server usage
unzip -q /vagrant/downloads/$PDI -d /opt/pentaho/

# Extract for server host
unzip -q /vagrant/downloads/$PDI -d /vagrant/downloads/

echo "Configuring Pentaho Data Integration"

# Permission check
chmod +x /opt/pentaho/data-integration/*.sh

# Less Java resources consumption
sed -i s/"-Xms1024m -Xmx2048m -XX:MaxPermSize=256m"/"-Xms768m -Xmx1536m -XX:MaxPermSize=256m"/g /opt/pentaho/data-integration/spoon.sh