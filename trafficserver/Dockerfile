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

ENV PIDFILE=/var/run/trafficserver.pid DAEMON=/opt/ats/bin/traffic_manager

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["start-stop-daemon", "--start --make-pidfile  --pidfile ${PIDFILE} --exec ${DAEMON}"]
