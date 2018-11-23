#!/bin/bash

java -Dconfig.file=/vagrant/configs/openscoring/reference.conf -jar /opt/openscoring/openscoring-server/target/openscoring-server-executable-1.4-SNAPSHOT.jar --port 8787 &