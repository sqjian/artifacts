#!/usr/bin/env bash

set -eu

redis_host=$(jq -r '.standalone.addr'  config.json)
redis_ports=$(jq -r ' .standalone.ports | .[]'  config.json)

for redis_port in ${redis_ports[*]}
do
    redis_dir=${PWD}/conf/redis_standalone/${redis_port}
    redis_conf=${redis_dir}/redis.conf
    pushd ${redis_dir} > /dev/null
    echo "starting redis_server for ${redis_host}:${redis_port} ${redis_conf}"
    redis-server ${redis_conf}
    popd > /dev/null
done
