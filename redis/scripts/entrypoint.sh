#!/usr/bin/env bash

init_redis_cluster()
{
  ./init_redis_cluster.sh
}

init_redis_standalone()
{
  ./redis_standalone.sh
}

supervisord --nodaemon