#!/bin/bash

if [ $# -gt 0 ]; then
    $HOME/kafka_2.10-0.9.0.1/bin/kafka-console-consumer.sh --from-beginning --topic $1 --zookeeper 10.30.3.101:2181,10.30.3.102:2181,10.30.3.103:2181
else
    echo "Usage: "$(basename $0)" <topic_name>"
fi

