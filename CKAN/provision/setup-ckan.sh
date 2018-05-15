#!/bin/bash

# create directory
mkdir -p /vagrant/downloads/
mkdir -p /vagrant/downloads/ckan

# git clone CKAN repository
git clone https://github.com/ckan/ckan.git /vagrant/downloads/ckan/

# copy ENV template config into a used ENV config
cp /vagrant/downloads/ckan/contrib/docker/.env.template /vagrant/downloads/ckan/contrib/docker/.env