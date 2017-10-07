## About

Installing "Pentaho CE". Current configuration is based on the repository [vagrant-pentaho-biserver-5](https://github.com/lricardo/vagrant-pentaho-biserver-5)

## Feature set

* Ubuntu 16.04.1 LTS
* PostgreSQL 9.5 (without extensions loaded)
* Pentaho BI Server 5.0.1
* Oracle JDK 6
* Add-on: Systemd unit for automatic startup of pentaho

## Configuration

Change **Vagrantfile** as you wish, in the provider settings to configure the number of CPUs and the amount for RAM.
By default, this machine uses 2 cores and 2 GB of RAM (the minimum recommended).

## Usage

* Download files of this folder
* Navigate into the cloned folder
* Run cmd *vagrant up*

By default, you can access *Pentaho User Console* by accessing [http://localhost:8080](http://localhost:8080). To login, use *admin* as username and *password* as password. Don't push enter, click in the login button!
