#!/bin/bash

java -Dconfig.file=/vagrant/configs/openscoring/reference.conf -jar /opt/openscoring/openscoring-server/target/server-executable-1.3-SNAPSHOT.jar --port 8787 &