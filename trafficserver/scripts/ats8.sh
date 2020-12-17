#!/bin/sh -eux

export DEBIAN_FRONTEND=noninteractive

ats=http://www-eu.apache.org/dist/trafficserver/trafficserver-8.1.1.tar.bz2

export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
locale-gen en_US.UTF-8
dpkg-reconfigure locales

# Install TrafficServer
# https://trafficserver.apache.org/downloads
# http://www-eu.apache.org/dist/trafficserver
mkdir /tmp/trafficserver
cd /tmp/trafficserver
curl -L ${ats} | tar -xj --strip-components 1
./configure --prefix=/opt/ats
make
make install
cd /opt/ats
bin/traffic_server -R 1
