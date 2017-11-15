## About

Installing "Apama CE 10.1".

## Running Apama via comman line

* Use scripts that are in "apama-scripts" on your host or in /vagrant/apama-scripts/ at your VM
* Start correlation
```
cd /opt/softwareag/Apama/bin
. apama_env
correlation
```
* Inject monitors / events
```
. /opt/softwareag/Apama/bin/apama_env
/opt/softwareag/Apama/bin/engine_inject /vagrant/apama-scripts/dummySecurityEvents.mon
/opt/softwareag/Apama/bin/engine_inject /vagrant/apama-scripts/dummySecurityEventsMonitor.mon
/opt/softwareag/Apama/bin/engine_inject /vagrant/apama-scripts/dummySecurityEventsGeneratorMonitor.mon
```
* Delete monitors
```
/opt/softwareag/Apama/bin/engine_delete com.apama.security.Security;
/opt/softwareag/Apama/bin/engine_delete com.apama.security.SecurityEventsGenerator
```
* Sending events
```
/opt/softwareag/Apama/bin/engine_send /vagrant/apama-scripts/dummySecurityEventsSend.evt
```

## Materials

* [Using Apama from the Linux Command Line](https://www.youtube.com/watch?v=hin-u-Hip4E)
