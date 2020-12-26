#!/usr/bin/env bash

init_redis_cluster()
{
  ./init_redis_cluster.sh
}

# if [[ $1 == '-cluster' ]];then
#         echo 'starting redis cluster...'
#         init_redis_cluster
# fi

echo 'starting redis cluster...'
init_redis_cluster

echo 'starting redis single...'
supervisord --nodaemon