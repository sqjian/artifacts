#!/usr/bin/env bash

redis_cluster()
{
  ./redis_cluster_config.sh
}

redis_standalone()
{
  ./redis_standalone_config.sh
}

redis_standalone
redis_cluster

supervisord --nodaemon