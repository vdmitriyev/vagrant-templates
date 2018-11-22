#!/bin/bash

# Install PostgreSQL
echo "Installing and configuring PosgreSQL"
apt-get install postgresql -y

# Change a detail in pg_hba.conf
sed -i s/"local   all             all                                     peer"/"local   all             all                                     trust"/g /etc/postgresql/9.5/main/pg_hba.conf

# Add future needed user
useradd pentaho_user

# Install PGAdmin (can be used later with GUI)
apt-get install pgadmin3

# Reload service
systemctl restart postgresql

