FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

WORKDIR /tmp

COPY scripts .

RUN set -eux \
        && chmod +x *.sh \
        && ./env.sh \
        && ./dependencies.sh \
        && ./install.sh \
        && ./env.sh \
        && ./cleanup.sh \
        && rm -rf *.sh

COPY scripts /lab

WORKDIR /lab


ENTRYPOINT ["/usr/bin/dumb-init", "--"]
