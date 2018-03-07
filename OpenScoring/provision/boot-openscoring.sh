#!/bin/bash

# Auto start on boot
echo "Auto start the 'openscoring' service on VM boot"
systemctl start openscoring-server.service