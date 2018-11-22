## About

Current vagrant configuration installs following software tools from Pentaho: Pentaho Server 7.1, Pentaho Data Integration 7.1, Pentaho Report Designer 7.1.

## Feature set

* Ubuntu 16.04.1 LTS
* PostgreSQL 9.5 (without extensions loaded)
* Pentaho BI Server 7.1.0
* Pentaho Data Integration 7.1.0 (only with GUI enabled in Vagrant configs or start from host OS)
* Pentaho Report Designer 7.1.0 (only with GUI enabled in Vagrant configs or start from host OS)
* Oracle JDK 8
* Add-on: Systemd unit for automatic startup of pentaho

## Configuration

Change **Vagrantfile** as you wish, in the provider settings to configure the number of CPUs and the amount for RAM.
By default, this machine uses 2 cores and 2 GB of RAM (the minimum recommended). Note that also DEFAULT "start-pentaho.sh" **MUST** be adapter to the performance of your VM.

## Usage on VM

* Download files of this folder
* Navigate into the cloned folder
* Run cmd *vagrant up*

By default, you can access *Pentaho User Console* by accessing [http://localhost:8080](http://localhost:8080). To login, use *admin* as username and *password* as password. Don't push enter, click in the login button!

## Usage with GUI on VM machine (minimalist)

* Enable GUI in Vagrant for VM
* Remove comments from the provision within GUI relevant configurations
* Change password of the default user in case you cannot log into
```sudo passwd ubuntu```
* Start within the virtualbox terminal
```sudo startxfce4&```

## Usage with GUI on VM machine (ubuntu)

* Provision using the "setup-ubuntu-desktop.sh" script
* Enable GUI in Vagrant for VM
* Change password of the default user in case you cannot log into
```sudo passwd ubuntu```
* Start as usual

## Usage on host machine (Windows)

* Make sure your host machine has Java installed and configured
* Navigate into "installed/opt/pentaho/"
* Navigate to the folder of the tool you want to use
* Start it as follows
    - Pentaho Server 7.1 (not configured by default)
        + already started on VM,
            + when not installed on VM, then use "start-pentaho.bat", here dependencies may be required
    - Pentaho Data Integration 7.1
        + spoon.bat
        + (in case of problmes) -> SpoonDebug.bat
    - Report Designer 7.1
        + report-designer.bat

## Useful Notes for Managing Pentaho Sever 7.1 CE

* See whether Pentaho is running:
    - [on host] ```cat /vagrant/installed/opt/pentaho/pentaho-server/tomcat/logs/catalina.out```
    - [on vm]   ```cat /opt/pentaho/pentaho-server/tomcat/logs/catalina.out```
* (optional, already done by provision) Change memory parameters in the start file for VM to the "... -Xms768m -Xmx2048m -XX:MaxPermSize=128m ..."
    - [on host] ```sudo nano /vagrant/installed/opt/pentaho/pentaho-server/start-pentaho.sh```
    - [on vm]   ```sudo nano /opt/pentaho/pentaho-server/start-pentaho.sh```
* Article [Best Practices - Tomcat Performance Tuning for Pentaho](https://support.pentaho.com/hc/en-us/articles/210448223-Best-Practices-Tomcat-Performance-Tuning-for-Pentaho)

## PostgreSQL

* pentaho_user/password

## Credits

Current configuration setup is partially is based on the repository [vagrant-pentaho-biserver-5](https://github.com/lricardo/vagrant-pentaho-biserver-5)
