#!/bin/sh -eux

export DEBIAN_FRONTEND=noninteractive

apt-get update -y
apt-get upgrade -y
apt-get install -y \
            silversearcher-ag \
            curl \
            pkg-config \
            gcc \
            make \
            vim \
            dumb-init

apt-get install -y \
            tcl
