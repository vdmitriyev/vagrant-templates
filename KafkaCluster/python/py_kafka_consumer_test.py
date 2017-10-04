#!/usr/bin/env python3

__author__      = "Viktor Dmitriyev"
__version__     = "1.0"
__date__        = "04.10.2017"
__description__ = "Some test with Kafka Consumer in Python."

import time

from kafka import KafkaConsumer

def consume():
    VAGRANT_KAFKA_SERVERS =['10.30.3.201:9092', '10.30.3.202:9092', '10.30.3.203:9092']
    consumer = KafkaConsumer(bootstrap_servers=VAGRANT_KAFKA_SERVERS,
                             auto_offset_reset='earliest')
    consumer.subscribe(['python-test-topic'])

    for message in consumer:
        print ('BEGIN RECEIVING')
        print (message)
        time.sleep(2)
        print ('END RECEIVING')

def main():
    consume()

if __name__ == '__main__':
    main()
