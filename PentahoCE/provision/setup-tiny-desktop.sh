#!/bin/bash

echo "Installing tiny and lightweight GUI desktop on Ubuntu (optional)"

# install xfce and virtualbox additions
sudo apt-get install -y xfce4 virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11

# Permit anyone to start the GUI
sudo sed -i 's/allowed_users=.*$/allowed_users=anybody/' /etc/X11/Xwrapper.config