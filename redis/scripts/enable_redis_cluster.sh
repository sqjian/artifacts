#!/usr/bin/env bash

set -eu

redis_host=$(jq -r '.cluster.addr'  config.json)
redis_ports=$(jq -r ' .cluster.ports | .[]'  config.json)
redis_passwd=$(jq -r '.cluster.requirepass'  config.json)

redis_set=''

for redis_port in ${redis_ports[*]}
do
	redis_set="${redis_set} ${redis_host}:${redis_port}"
done

redis_set=$(echo ${redis_set} | sed 's/^,//g')
echo ${redis_set}

redis-cli -a ${redis_passwd} --verbose --cluster create --cluster-replicas 1 ${redis_set}
