#!/bin/bash

# Prepearing setup
echo "Get 'Apache Superset' git repository"

mkdir /vagrant/downloads/
cd /vagrant/downloads/
git clone https://github.com/apache/incubator-superset/

cd /vagrant/downloads/incubator-superset/contrib/docker/
dos2unix *.sh

# prefix with SUPERSET_LOAD_EXAMPLES=yes to load examples:
docker-compose run --rm superset ./docker-init.sh

# you can run this command every time you need to start superset now:
# docker-compose up