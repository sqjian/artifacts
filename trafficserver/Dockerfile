FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

WORKDIR /lab

COPY scripts .

RUN set -eux \
        && chmod +x *.sh \
        && ./dependencies.sh \
        && ./ats8.sh \
        && ./env.sh \
        && ./cleanup.sh \
        && rm -rf *.sh
        
WORKDIR /opt/ats

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
