#!/bin/bash

echo "Installing GUI desktop on Ubuntu (optional)"

# apt-get install --no-install-recommends ubuntu-desktop
apt-get install ubuntu-desktop

# required to run PDI on ubuntu
apt-get -y install libwebkitgtk-1.0-0