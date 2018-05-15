## About

Installing and starting [CKAN](https://github.com/ckan/ckan) for hosting open data. In this case special plugin for the docker compose is used - https://github.com/leighmcculloch/vagrant-docker-compose.

## Dependencies on a host machine

* vagrant
* git
* ```vagrant plugin install vagrant-docker-compose```

## Prepearing a host machine (also done automatically in provision)

```
mkdir downloads
cd downloads
git clone https://github.com/ckan/ckan.git
```

## Launch

* Run following command inside vagrant machine after VM starts in order to launch relevant services:
```
cd /vagrant/downloads/ckan/contrib/docker/
docker-compose up
```
* Access services via http://localhost:5000/


