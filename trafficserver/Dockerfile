FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

WORKDIR /tmp

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

CMD ["start-stop-daemon", "--start --make-pidfile  --pidfile /opt/ats --exec /var/run/trafficserver.pid DAEMON=/opt/ats/bin/traffic_manager"]