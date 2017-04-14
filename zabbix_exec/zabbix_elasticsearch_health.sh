#!/bin/bash

ARG=$1
PORT=$2

if [ $ARG = "status" ];then
  ST=$(curl -s "127.0.0.1:${PORT}/_cat/health?v"|tail -1|awk '{print $4}')
  if [ $ST = "green" ];then
    echo 0
  fi
  if [ $ST = "yellow" ];then
    echo 1
  fi
  if [ $ST = "red" ];then
    echo 2
  fi
fi

if [ $ARG = "node.total" ];then
  NUM=$(curl -s "127.0.0.1:${PORT}/_cat/health?v"|tail -1|awk '{print $5}')
  echo $NUM
fi

if [ $ARG = "node.data" ];then
  NUM=$(curl -s "127.0.0.1:${PORT}/_cat/health?v"|tail -1|awk '{print $6}')
  echo $NUM
fi

if [ $ARG = "shards" ];then
  NUM=$(curl -s "127.0.0.1:${PORT}/_cat/health?v"|tail -1|awk '{print $7}')
  echo $NUM
fi

if [ $ARG = "pri" ];then
  NUM=$(curl -s "127.0.0.1:${PORT}/_cat/health?v"|tail -1|awk '{print $8}')
  echo $NUM
fi

if [ $ARG = "relo" ];then
  NUM=$(curl -s "127.0.0.1:${PORT}/_cat/health?v"|tail -1|awk '{print $9}')
  echo $NUM
fi

if [ $ARG = "init" ];then
  NUM=$(curl -s "127.0.0.1:${PORT}/_cat/health?v"|tail -1|awk '{print $10}')
  echo $NUM
fi

if [ $ARG = "unassign" ];then
  NUM=$(curl -s "127.0.0.1:${PORT}/_cat/health?v"|tail -1|awk '{print $11}')
  echo $NUM
fi

if [ $ARG = "pending_tasks" ];then
  NUM=$(curl -s "127.0.0.1:${PORT}/_cat/health?v"|tail -1|awk '{print $12}')
  echo $NUM
fi

if [ $ARG = "max_task_wait_time" ];then
  NUM=$(curl -s "127.0.0.1:${PORT}/_cat/health?v"|tail -1|awk '{print $13}')
  if [ $NUM = '-' ];then
    echo 0
  else
    echo $NUM
  fi
fi

if [ $ARG = "active_shards_percent" ];then
  NUM=$(curl -s "127.0.0.1:${PORT}/_cat/health?v"|tail -1|awk '{print $14}'|cut -d '%' -f1)
  echo $NUM
fi
