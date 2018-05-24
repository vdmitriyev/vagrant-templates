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

## Config

* Max file size by datapusher
* Opening configuration file
```
docker exec -it datapusher /bin/bash
apt-get nano
nano /usr/src/app/deployment/datapusher_settings.py
```
* Adding following line
```
MAX_CONTENT_LENGTH = 100*1014*1024 # 100x1Mb maximum size
```
* Max file size by CKAN
* Opening configuration file
```
docker exec -u root -it ckan /bin/bash
apt-get nano
nano /etc/ckan/production.ini
```
* Change following lines
```
## Storage Settings

#ckan.storage_path = /var/lib/ckan
ckan.max_resource_size = 1000 #1000MB
# ckan.max_image_size = 500 #500MB (overkill for an image...)
```

## Docker

* Login as a root (to check who you are use `id` inside docker)
```
docker exec -u root -it ckan /bin/bash
```

### Usage

* Read the documentation provided
    + [Main Documentation](http://docs.ckan.org/en/latest/contents.html)
    + [Sysadmin guide](http://docs.ckan.org/en/latest/sysadmin-guide.html)
* Also CKAN extension could be used in order to extend functionality of the platform
    + [CKAN Extensions](http://extensions.ckan.org/)
* Create user with sysadmin privileges (docker containers must run)
```
docker exec -it ckan /bin/bash
ckan-paster --plugin=ckan sysadmin add <USER> email=<USER>@localhost name=<USER> -c /etc/ckan/production.ini
```

