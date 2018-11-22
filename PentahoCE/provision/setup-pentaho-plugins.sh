#!/bin/bash

#
# Pentaho CE Plugins - Download, unzip and move the folder to "/opt"
#

# Details about the plugin can be found here - http://www.pivot4j.org/pentaho.html
 
PENTAHO_PLUGIN_PIVOT4J="pivot4j-pentaho-1.0-SNAPSHOT-plugin.zip"
PENTAHO_URL="http://ci.greencatsoft.com/job/Pivot4J/lastSuccessfulBuild/artifact/pivot4j-pentaho/target/"

if [ ! -f /vagrant/downloads/plugins/$PENTAHO_PLUGIN_PIVOT4J ]; then
    echo "Downloading Pentaho Plugin ($PENTAHO_PLUGIN_PIVOT4J)"
	mkdir -p /vagrant/downloads/plugins/
	wget -q $PENTAHO_URL/$PENTAHO_PLUGIN_PIVOT4J -P /vagrant/downloads/plugins/
fi

echo "Installing Pentaho Plugin ($PENTAHO_PLUGIN_PIVOT4J)"
unzip -q /vagrant/downloads/plugins/$PENTAHO_PLUGIN_PIVOT4J -d /opt/pentaho/pentaho-server/pentaho-solutions/system/