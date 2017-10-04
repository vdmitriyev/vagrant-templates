#!/usr/bin/env python3

__author__      = "Viktor Dmitriyev"
__version__     = "1.1"
__date__        = "04.10.2017"
__description__ = "Some test with Kafka."

"""
NOTES:
    - Multithreaded version of the similar example can be found here - https://github.com/dpkp/kafka-python/blob/master/example.py
"""

import uuid
import time

from kafka import KafkaProducer

def producer():
    VAGRANT_KAFKA_SERVERS =['10.30.3.201:9092', '10.30.3.202:9092', '10.30.3.203:9092']
    #VAGRANT_KAFKA_SERVERS =['10.30.3.201:9092']
    producer = KafkaProducer(bootstrap_servers = VAGRANT_KAFKA_SERVERS)
    for _ in range(100):
        msg = 'Message to the be sent. UUID: {0}'.format(uuid.uuid4())
        print ('BEGIN SENDING')
        print ('MSG: {0}'.format(msg))
        producer.send('python-test-topic', msg)
        time.sleep(2)
        print ('END SENDING')

def main():
    producer()

if __name__ == '__main__':
    main()
