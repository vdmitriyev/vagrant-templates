## About

Installing "Pentaho Server 7.1". Current configuration is based on the repository [vagrant-pentaho-biserver-5](https://github.com/lricardo/vagrant-pentaho-biserver-5)

## Feature set

* Ubuntu 16.04.1 LTS
* PostgreSQL 9.5 (without extensions loaded)
* Pentaho BI Server 7.1.0
* Pentaho Data Integration 7.1.0 (only with GUI enabled in Vagrant configs)
* Oracle JDK 8
* Add-on: Systemd unit for automatic startup of pentaho

## Configuration

Change **Vagrantfile** as you wish, in the provider settings to configure the number of CPUs and the amount for RAM.
By default, this machine uses 2 cores and 2 GB of RAM (the minimum recommended). Note that also DEFAULT "start-pentaho.sh" **MUST** be adapter to the performance of your VM.

## Usage

* Download files of this folder
* Navigate into the cloned folder
* Run cmd *vagrant up*

By default, you can access *Pentaho User Console* by accessing [http://localhost:8080](http://localhost:8080). To login, use *admin* as username and *password* as password. Don't push enter, click in the login button!

## Usage with GUI

* Remove comments from the provision within GUI relevant configurations
* Change password of the default user in case you cannot log into
```sudo passwd ubuntu```
* Start
```sudo startxfce4&```

## Useful Notes for Managing Pentaho Sever 7.1 CE

* Change memory parameters in the start file for VM to the "... -Xms768m -Xmx2048m -XX:MaxPermSize=128m ..."
    -```sudo nano /opt/pentaho/pentaho-server/start-pentaho.sh```
* See whether Pentaho is running:
    - ```cat /opt/pentaho/pentaho-server/tomcat/logs/catalina.out```
* Article [Best Practices - Tomcat Performance Tuning for Pentaho](https://support.pentaho.com/hc/en-us/articles/210448223-Best-Practices-Tomcat-Performance-Tuning-for-Pentaho)
