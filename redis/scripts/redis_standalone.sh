#!/usr/bin/env bash

redis_standalone()
{
    redis_host=$1
    redis_port=$2
    redis_dir=${PWD}/redis_standalone/$redis_port
    redis_conf=${redis_dir}/redis.conf
    redis_pid=${redis_dir}/redis.pid
    echo "starting redis_server for $redis_host:$redis_port"

    mkdir -p ${redis_dir}
    echo "port ${redis_port}" >>${redis_conf}
    echo "bind ${redis_host}" >>${redis_conf}
    echo "daemonize no" >>${redis_conf}
    echo "pidfile ${redis_pid}" >>${redis_conf}
    echo "appendonly yes" >>${redis_conf}
    echo "protected-mode no" >>${redis_conf}
    
    cd ${redis_dir}
    redis-server ${redis_conf}
    cd -
}

killall -9 redis-server
rm -rf redis_standalone

set -eu

redis_host='0.0.0.0'

for redis_port in 6379
do
	redis_standalone ${redis_host} ${redis_port}
done
