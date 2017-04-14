#!/bin/bash

PORT=$1
KEY_HIT=$(/mnt/app/redis/bin/redis-cli -s /mnt/data/redis/${PORT}/redis.sock info |grep keyspace_hits|awk -F \: '{print $NF}')
KEY_MISS=$(/mnt/app/redis/bin/redis-cli -s /mnt/data/redis/${PORT}/redis.sock info |grep keyspace_misses|awk -F \: '{print $NF}')

SUM=$(echo|awk "{printf($KEY_HIT + $KEY_MISS )}")

if [ $SUM -eq 0 ];then
  echo 0
  exit 0
fi

HIT_RATE=$(echo|awk -v a=$KEY_HIT -v b=$SUM '{printf("%.2f",a/b*100)}')
echo $HIT_RATE
