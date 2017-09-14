#!/usr/bin/env python3

__author__      = "Viktor Dmitriyev"
__version__     = "1.0"
__date__        = "14.09.2017"
__description__ = "Some test with Kafka."

from kafka import KafkaProducer

def producer():
    #VAGRANT_KAFKA_SERVERS =['10.30.3.10:9092', '10.30.3.20:9092', '10.30.3.30:9092']
    VAGRANT_KAFKA_SERVERS =['10.30.3.10:9092']
    producer = KafkaProducer(bootstrap_servers = VAGRANT_KAFKA_SERVERS)
    for _ in range(100):
        print ('Begin sending something')
        producer.send('bla', b'some_message_bytes')
        print ('End sending something')

def main():
    producer()

if __name__ == '__main__':
    main()
