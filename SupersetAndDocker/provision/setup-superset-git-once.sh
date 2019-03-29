#!/bin/bash

# Prepearing setup
echo "Get 'Apache Superset' git repository"

# clone into sync folder of vagrant (potential problmes with symlinks)
# mkdir /vagrant/downloads/
# cd /vagrant/downloads/
# git clone https://github.com/apache/incubator-superset/
# cd /vagrant/downloads/incubator-superset/contrib/docker/
# dos2unix *.sh

# move git repository into non-sync vagrant folder
# "vargant: symlinks" problems - https://github.com/yarnpkg/yarn/issues/4908

mkdir /opt
cd /opt
git clone https://github.com/apache/incubator-superset/

# owner of the files should be changed, otherwise there are problems inside docker container
chown -r vagrant:vagrant /opt/incubator-superset

cd /opt/incubator-superset/contrib/docker/
dos2unix *.sh

# prefix with SUPERSET_LOAD_EXAMPLES=yes to load examples:
docker-compose run --rm superset ./docker-init.sh

# you can run this command every time you need to start superset now:
# docker-compose up