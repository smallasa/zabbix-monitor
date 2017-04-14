#!/bin/bash

ARG=$1
PORT=$2

IP=$(cat /mnt/app/zookeeper/conf/zoo.cfg |grep clientPortAddress|awk -F \= '{print $2}')

if [ $ARG = "ruok" ];then
  ST=$(echo $ARG | nc $IP $PORT)
  if [ $ST = "imok" ];then
    echo 0
  else
    echo 1
  fi
fi

if [ $ARG = "zk_avg_latency" ];then
  NUM=$(echo mntr | nc $IP $PORT|grep $ARG|awk '{print $2}')
  echo $NUM
fi

if [ $ARG = "zk_max_latency" ];then
  NUM=$(echo mntr | nc $IP $PORT|grep $ARG|awk '{print $2}')
  echo $NUM
fi

if [ $ARG = "zk_min_latency" ];then
  NUM=$(echo mntr | nc $IP $PORT|grep $ARG|awk '{print $2}')
  echo $NUM
fi

if [ $ARG = "zk_packets_received" ];then
  NUM=$(echo mntr | nc $IP $PORT|grep $ARG|awk '{print $2}')
  echo $NUM
fi

if [ $ARG = "zk_packets_sent" ];then
  NUM=$(echo mntr | nc $IP $PORT|grep $ARG|awk '{print $2}')
  echo $NUM
fi

if [ $ARG = "zk_num_alive_connections" ];then
  NUM=$(echo mntr | nc $IP $PORT|grep $ARG|awk '{print $2}')
  echo $NUM
fi

if [ $ARG = "zk_outstanding_requests" ];then
  NUM=$(echo mntr | nc $IP $PORT|grep $ARG|awk '{print $2}')
  echo $NUM
fi

if [ $ARG = "zk_server_state" ];then
  NUM=$(echo mntr | nc $IP $PORT|grep $ARG|awk '{print $2}')
  echo $NUM
fi

if [ $ARG = "zk_znode_count" ];then
  NUM=$(echo mntr | nc $IP $PORT|grep $ARG|awk '{print $2}')
  echo $NUM
fi

if [ $ARG = "zk_watch_count" ];then
  NUM=$(echo mntr | nc $IP $PORT|grep $ARG|awk '{print $2}')
  echo $NUM
fi

if [ $ARG = "zk_ephemerals_count" ];then
  NUM=$(echo mntr | nc $IP $PORT|grep $ARG|awk '{print $2}')
  echo $NUM
fi

if [ $ARG = "zk_approximate_data_size" ];then
  NUM=$(echo mntr | nc $IP $PORT|grep $ARG|awk '{print $2}')
  echo $NUM
fi

if [ $ARG = "zk_open_file_descriptor_count" ];then
  NUM=$(echo mntr | nc $IP $PORT|grep $ARG|awk '{print $2}')
  echo $NUM
fi

if [ $ARG = "zk_max_file_descriptor_count" ];then
  NUM=$(echo mntr | nc $IP $PORT|grep $ARG|awk '{print $2}')
  echo $NUM
fi

if [ $ARG = "zk_followers" ];then
  NUM=$(echo mntr | nc $IP $PORT|grep $ARG|awk '{print $2}')
  echo $NUM
fi

if [ $ARG = "zk_synced_followers" ];then
  NUM=$(echo mntr | nc $IP $PORT|grep $ARG|awk '{print $2}')
  echo $NUM
fi

if [ $ARG = "zk_pending_syncs" ];then
  NUM=$(echo mntr | nc $IP $PORT|grep $ARG|awk '{print $2}')
  echo $NUM
fi
