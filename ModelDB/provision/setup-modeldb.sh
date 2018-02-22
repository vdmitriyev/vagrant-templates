#!/bin/bash

# Prepearing setup
echo "Installing dependencies of the 'modelDB'"

# apt-get update
apt-get install commons-lang3
apt-get install -y wget
apt-get install -y unzip zip
# apt-get install -y git
apt-get install -y software-properties-common
# add-apt-repository ppa:webupd8team/java
# apt-get update
# apt-get install -y openjdk-8-jdk
apt-get install -y sqlite
# apt-get install -y maven
apt-get install -y bzip2
apt-get install -y automake bison flex g++ git libevent-dev libssl-dev libtool make pkg-config
apt-get install nodejs
apt-get install -y mongodb
apt-get install -y mongodb-org

echo "Creating testuser for 'modelDB'"
useradd -d /home/testuser -m testuser

echo "Downloading dependencies for the 'modelDB'"

mkdir /home/testuser/
mkdir /home/testuser/modeldb/
mkdir /home/testuser/modeldb/dependencies
cd /home/testuser/modeldb/dependencies

#
# thrift

thrift=thrift-0.9.3.tar.gz
thriftDir=thrift-0.9.3
if [ ! -f "$thrift" ]; then
    echo "Downloading thrift installer. This may take more than a few minutes ..."
    wget -q -o /dev/null - http://apache.mesi.com.ar/thrift/0.9.3/"$thrift"
else
    echo "thrift is already downloaded."
fi

if [ -f "$thrift" ];  then
    tar -xvzf "$thrift"
    echo "Building thrift"
    cd "$thriftDir"
    ./configure
    make
    ln -s /home/testuser/modeldb/dependencies/"$thriftDir"/compiler/cpp/thrift /usr/local/bin/thrift
    # cd ..
    # cd ..
    echo "thrift was build"
else
    echo "ERROR: thrift installer was not found."
fi

#
# sbt
#
sbt=sbt-0.13.13.tgz
sbtVersion=0.13.13
if [ ! -f "$sbt" ]; then
    echo "Downloading sbt installer. This may take more than a few minutes ..."
    wget -q -o /dev/null - https://dl.bintray.com/sbt/native-packages/sbt/"$sbtVersion"/"$sbt"
else
    echo "sbt is already downloaded."
fi

if [ -f "$sbt" ];  then
    tar -xvzf "$sbt"
else
    echo "ERROR: sbt installer was not found."
fi

#
# sparkhadoop
#
sparkhadoop=spark-2.0.1-bin-hadoop2.7.tgz
if [ ! -f "$sparkhadoop" ]; then
    echo "Downloading sparkhadoop installer. This may take more than a few minutes ..."
    wget -q -o /dev/null - http://d3kbcqa49mib13.cloudfront.net/"$sparkhadoop"
else
    echo "sparkhadoop is already downloaded."
fi

if [ -f "$sparkhadoop" ];  then
    tar -xvzf "$sparkhadoop"
else
    echo "ERROR: sparkhadoop installer was not found."
fi

#
# anaconda
#
anaconda=Anaconda2-4.2.0-Linux-x86_64.sh
if [ ! -f "$anaconda" ]; then
    echo "Downloading anaconda installer. This may take more than a few minutes ..."
    wget -q -o /dev/null - https://repo.continuum.io/archive/"$anaconda"
else
    echo "anaconda is already downloaded."
fi

if [ -f "$anaconda" ];  then
    chmod 777 "$anaconda"
else
    echo "ERROR: anaconda installer was not found."
fi

#
# zeppelin
#
zeppelin=zeppelin-0.7.3-bin-all.tgz
zeppelinDir=zeppelin-0.7.3-bin-all

if [ ! -f "$zeppelin" ]; then
    echo "Downloading zeppelin installer. This may take more than a few minutes ..."
    wget -q -o /dev/null - http://apache.lauf-forum.at/zeppelin/zeppelin-0.7.3/"$zeppelin"
else
    echo "zeppelin is already downloaded."
fi

if [ -f "$zeppelin" ];  then
    tar -xvzf "$zeppelin"
    mv "$zeppelinDir" zeppelin
    cp ./zeppelin/conf/zeppelin-site.xml.template ./zeppelin/conf/zeppelin-site.xml
    sed -i -e 's/  <value>8080<\/value>/  <value>8082<\/value>/g' ./zeppelin/conf/zeppelin-site.xml

    echo "Create a sample Zeppelin notebook"
    wget https://archive.ics.uci.edu/ml/machine-learning-databases/adult/adult.data
    mkdir ./zeppelin/notebook/2C44QSZC4
    wget https://raw.githubusercontent.com/mitdbg/modeldb-notebooks/master/scala/ModelDBSample.json -O ./zeppelin/notebook/2C44QSZC4/note.json
else
    echo "ERROR: anaconda installer was not found."
fi


echo "Set PATH variable"

PATH=/root/anaconda2/:$PATH
PATH=/home/testuser/modeldb/dependencies/spark-2.0.1-bin-hadoop2.7/bin:$PATH
PATH=/home/testuser/modeldb/dependencies/sbt-launcher-packaging-0.13.13/bin:$PATH
PATH=/home/testuser/modeldb/dependencies/thrift-0.9.3:$PATH

echo "Building 'modeldb'"

cd /home/testuser/modeldb/
git clone https://github.com/mitdbg/modeldb.git
cd /home/testuser/modeldb/modeldb/server/codegen
./gen_sqlite.sh
cd /home/testuser/modeldb/modeldb/server/
./start_server.sh &
cd /home/testuser/modeldb/modeldb/client/scala/libs/spark.ml
./build_client.sh &

echo "Finish installing 'modeldb'"
