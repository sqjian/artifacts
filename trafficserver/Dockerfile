FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

WORKDIR /opt/scripts

COPY scripts .

RUN set -eux \
        && chmod +x *.sh \
        && ./dependencies.sh \
        && ./ats8.sh \
        && ./env.sh \
        && ./cleanup.sh
        
WORKDIR /opt/ats

ENTRYPOINT ["/opt/scripts/entrypoint.sh"]

CMD ["/opt/ats/bin/traffic_manager"]
