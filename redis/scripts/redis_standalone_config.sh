#!/usr/bin/env bash

redis_standalone_config()
{
    redis_host=$1
    redis_port=$2
    redis_data=$3
    redis_passwd=$4
    redis_dir=${PWD}/conf/redis_standalone/$redis_port
    redis_conf=${redis_dir}/redis.conf
    redis_pid=${redis_dir}/redis.pid

    echo "creating redis_server standalone config for $redis_host:$redis_port"

    if [ ! -d "${redis_dir}" ]; then
      mkdir -p ${redis_dir}
    fi

    echo "port ${redis_port}" >>${redis_conf}
    echo "bind ${redis_host}" >>${redis_conf}
    echo "daemonize no" >>${redis_conf}
    echo "pidfile ${redis_pid}" >>${redis_conf}
    echo "appendonly yes" >>${redis_conf}
    echo "appendfsync always" >>${redis_conf}
    echo "appendfilename ${redis_port}.appendonly.aof" >>${redis_conf}
    echo "protected-mode no" >>${redis_conf}

    if [ ! -d "${redis_data}/persistent" ]; then
      mkdir -p ${redis_data}/persistent
    fi

    echo "dir ${redis_data}/persistent" >>${redis_conf}
    echo "requirepass ${redis_passwd}" >>${redis_conf}

    echo "creating redis_server supervisor standalone config for $redis_host:$redis_port"
    echo "[program:redis-${redis_host}-${redis_port}]" >>/etc/supervisor/conf.d/redis.${redis_port}.conf
    echo "command=redis-server redis.conf" >>/etc/supervisor/conf.d/redis.${redis_port}.conf
    echo "directory=${redis_dir}" >>/etc/supervisor/conf.d/redis.${redis_port}.conf
    echo "autostart=true" >>/etc/supervisor/conf.d/redis.${redis_port}.conf
    echo "startsecs=3" >>/etc/supervisor/conf.d/redis.${redis_port}.conf
}

# rm old config files
rm -rf redis_standalone_config

set -eu

redis_host=$(jq -r '.standalone.addr'  config.json)
redis_ports=$(jq -r ' .standalone.ports | .[]'  config.json)
redis_data=$(jq -r '.standalone.data'  config.json)
redis_passwd=$(jq -r '.standalone.requirepass'  config.json)

if [ ! -d "${redis_data}" ]; then
  mkdir -p ${redis_data}
fi

for redis_port in ${redis_ports[*]}
do
	redis_standalone_config ${redis_host} ${redis_port} ${redis_data} ${redis_passwd}
done
