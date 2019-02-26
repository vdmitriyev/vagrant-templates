#!/bin/bash

java -Dconfig.file=/vagrant/configs/openscoring/reference.conf -jar /opt/openscoring/openscoring-server/target/openscoring-server-executable-2.0-SNAPSHOT.jar --port 8787 &