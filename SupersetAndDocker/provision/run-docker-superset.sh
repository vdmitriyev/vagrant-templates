#!/bin/bash

# Prepearing setup
echo "Run 'Apache Superset' with docker"

#cd /vagrant/downloads/incubator-superset/contrib/docker/
cd /opt/incubator-superset/contrib/docker/

# prefix with SUPERSET_LOAD_EXAMPLES=yes to load examples:
# docker-compose run --rm superset ./docker-init.sh

# you can run this command everytime you need to start superset now:
docker-compose up