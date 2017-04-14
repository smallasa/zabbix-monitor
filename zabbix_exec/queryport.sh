#!/bin/bash
port_array=(`netstat -tnl|egrep -i "$1"|awk {'print $4'}|awk -F':' '{if ($NF~/^[0-9]*$/) print $NF}'|sort |uniq 2>/dev/null`)
length=${#port_array[@]}
printf "{\n"
printf "  \"data\":[\n"
for ((i=0;i<$length;i++));do
  printf "    {\n"
  printf "      \"{#TCP_PORT}\":\"${port_array[$i]}\"\n"
  printf "    }"
  if [ $i -lt $[$length-1] ];then
    printf ',\n'
  fi
done
printf  "\n  ]\n"
printf "}\n"
