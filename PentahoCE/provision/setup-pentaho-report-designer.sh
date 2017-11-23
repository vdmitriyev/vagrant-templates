#!/bin/bash

#
# Pentaho Report Designer - Download, unzip and move the folder to "/opt"
#

PRD="prd-ce-7.1.0.0-12.zip"
PRD_URL="https://sourceforge.net/projects/pentaho/files/Report%20Designer/7.1/"

if [ ! -f /vagrant/downloads/$PRD ]; then
    echo "Downloading Pentaho Report Designer ($PRD)"
	mkdir -p /vagrant/downloads/
	wget -q $PRD_URL/$PRD -P /vagrant/downloads/
fi

echo "Installing/unzipping Pentaho Report Designer ($PRD)"

mkdir -p /vagrant/installed/opt/pentaho/
unzip -q /vagrant/downloads/$PRD -d /vagrant/installed/opt/pentaho/

echo "Configuring Pentaho Report Designer"

# Permission check
chmod +x /vagrant/installed/opt/pentaho/report-designer/*.sh