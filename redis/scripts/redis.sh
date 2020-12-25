#!/usr/bin/env bash

redis_conf()
{
    redis_host=$1
    redis_port=$2
    redis_dir=${PWD}/redis_cluster/$redis_port
    redis_conf=${redis_dir}/redis.conf
    redis_pid=${redis_dir}/redis.pid
    redis_cluster=${redis_dir}/redis_cluster.conf
    echo "starting redis_server for $redis_host:$redis_port"

    mkdir -p ${redis_dir}
    echo "port ${redis_port}" >>${redis_conf}
    echo "bind ${redis_host}" >>${redis_conf}
    echo "daemonize yes" >>${redis_conf}
    echo "pidfile ${redis_pid}" >>${redis_conf}
    echo "cluster-enabled yes" >>${redis_conf}
    echo "cluster-config-file ${redis_cluster}" >>${redis_conf}
    echo "cluster-node-timeout 15000" >>${redis_conf}
    echo "appendonly yes" >>${redis_conf}

    cd ${redis_dir}
    redis-server ${redis_conf}
    cd -
}

killall -9 redis-server
rm -rf redis_cluster

set -eu

redis_host='0.0.0.0'
redis_set=''

for redis_port in {6379..6384}
do
	redis_conf ${redis_host} ${redis_port}
	redis_set="${redis_set} ${redis_host}:${redis_port}"
done

redis_set=$(echo ${redis_set} | sed 's/^,//g')
echo ${redis_set}

redis-cli --verbose --cluster create --cluster-replicas 1 ${redis_set}
