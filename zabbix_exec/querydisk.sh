#!/bin/bash
disk_array=(`cat /proc/diskstats|awk '{print $3}'`)
length=${#disk_array[@]}
printf "{\n"
printf "  \"data\":[\n"
for ((i=0;i<$length;i++));do
  printf "    {\n"
  printf "      \"{#DISK}\":\"${disk_array[$i]}\"\n"
  printf "    }"
  if [ $i -lt $[$length-1] ];then
    printf ',\n'
  fi
done
printf  "\n  ]\n"
printf "}\n"
