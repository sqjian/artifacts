#!/usr/bin/env bash

./redis_cluster_config.sh
./expect.sh

./redis_standalone_config.sh
./start_redis_standalone_config.sh