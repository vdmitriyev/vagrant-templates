#!/bin/bash

# Install PostgreSQL
echo "Perform some extra configuration for the PostgreSQL"

#
# Enable remote connetion
#

# change listen address 
sed -i s/"#listen_addresses = 'localhost'"/"#listen_addresses = '*'"/g /etc/postgresql/9.5/main/postgresql.conf

# enable remote access
sed -i s/"#listen_addresses = 'localhost'"/"listen_addresses = '*'"/g /etc/postgresql/9.5/main/postgresql.conf
# revert back
# sed -i s/"listen_addresses = '*'"/"#listen_addresses = 'localhost'"/g /etc/postgresql/9.5/main/postgresql.conf

# Change a detail in pg_hba.conf
sed -i s/"host    all             all             127.0.0.1/32            md5"/"host    all             all             0.0.0.0/0            md5"/g /etc/postgresql/9.5/main/pg_hba.conf
# revert back
# sed -i s/"host    all             all             0.0.0.0/0            md5"/"host    all             all             127.0.0.1/32            md5"/g /etc/postgresql/9.5/main/pg_hba.conf