#!/usr/bin/env bash

redis='http://download.redis.io/redis-stable.tar.gz'

if [ ! -d "/tmp/tmux" ]; then
    mkdir -p /tmp/redis
fi

cd /tmp/redis
curl -L ${redis} | tar -zx --strip-components 1
make
make install
