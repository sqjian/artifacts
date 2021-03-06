FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

WORKDIR /tmp

COPY scripts .

RUN set -eux \
        && chmod +x *.sh \
        && ./dependencies.sh \
        && ./install_redis.sh \
        && ./env.sh \
        && ./cleanup.sh \
        && rm -rf *.sh

RUN set -eux \
        && mkdir /etc/redis

COPY scripts/redis_cluster_config.sh /etc/redis
COPY scripts/start_redis_cluster.sh /etc/redis
COPY scripts/enable_redis_cluster.sh /etc/redis
COPY scripts/redis_standalone_config.sh /etc/redis
COPY scripts/start_redis_standalone.sh /etc/redis
COPY scripts/config.json /etc/redis
COPY scripts/entrypoint.sh /etc/redis

RUN set -eux \
        && chmod +x -R /etc/redis

WORKDIR /etc/redis

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["bash","-c","./entrypoint.sh"]