## About

Installing "Apama CE 10.1".

## Running Apama via comman line

* Use scripts that are in "apama-scripts" on your host or in /vagrant/apama-scripts/ at your VM
* Start correlator
```

# 1 variant
cd /opt/softwareag/Apama/bin
. apama_env
correlator

# 2 variant
. /opt/softwareag/Apama/bin/apama_env
/opt/softwareag/Apama/bin/correlator
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
* Sending events on by one
```
/opt/softwareag/Apama/bin/engine_send /vagrant/apama-scripts/dummySecurityEventsSend.evt
```
* Monitoring events out of the correlator
```
. /opt/softwareag/Apama/bin/apama_env
/opt/softwareag/Apama/bin/engine_receive
```

## Materials

* [Using Apama from the Linux Command Line](https://www.youtube.com/watch?v=hin-u-Hip4E)
    + Following aricle could be used in order to automated installation on Linux systems -> [Headless and non-interactive Apama Installations](http://www.apamacommunity.com/headless-and-non-interactive-apama-installations/)
