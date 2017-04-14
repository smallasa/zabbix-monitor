#!/bin/bash

export JAVA_HOME=/mnt/app/java
export JRE_HOME=${JAVA_HOME}/jre
export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
export PATH=${PATH}:${JAVA_HOME}/bin

ARG=$1

ZKIP=$(cat /mnt/app/kafka/config/server.properties|grep -w zookeeper.connect|awk -F \= '{print $2}')

if [ $ARG = "topics" ];then
  NUM=$(/mnt/app/kafka/bin/kafka-topics.sh --zookeeper $ZKIP --list|grep -v offsets|wc -l)
  echo $NUM
fi
