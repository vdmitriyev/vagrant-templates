#!/bin/bash

# Prepearing setup
echo "Installing 'openscoring'"

cd /opt/
git clone https://github.com/openscoring/openscoring.git

echo "Building 'openscoring' with maven"
cd /opt/openscoring/
mvn clean install

echo "Add proper configurations to the 'openscoring'"
# mv /opt/openscoring/openscoring-service/target/classes/reference.conf /opt/openscoring/openscoring-service/target/classes/reference.conf-default
# cp /vagrant/configs/openscoring/reference.conf /opt/openscoring/openscoring-service/target/classes/

# Install the service into systemd
echo "Add the 'openscoring' to the systemd services"
cp /vagrant/configs/openscoring-server.service /etc/systemd/system/

echo "Enabling autostart of the 'openscoring' as the service"
systemctl enable openscoring-server.service

chown -R ubuntu:ubuntu /opt/
echo "Finish installation of the 'openscoring'"

