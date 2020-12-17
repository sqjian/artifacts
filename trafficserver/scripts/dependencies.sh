#!/bin/sh -eux

export DEBIAN_FRONTEND=noninteractive

# tee /etc/apt/sources.list <<- 'EOF'
# deb http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse
# deb-src http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse

# deb http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse
# deb-src http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse

# deb http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse
# deb-src http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse

# deb http://mirrors.aliyun.com/ubuntu/ focal-proposed main restricted universe multiverse
# deb-src http://mirrors.aliyun.com/ubuntu/ focal-proposed main restricted universe multiverse

# deb http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse
# deb-src http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse
# EOF

apt-get update -y
apt-get upgrade -y
apt-get install -y \
            silversearcher-ag \
            bzip2 \
            curl \
            lua5.3 \
            pkg-config \
            libtool \
            gcc \
            make \
            vim \
            dumb-init

apt-get install -y \
            libssl-dev \
            libpcre3 \
            libpcre3-dev \
            libpcap-dev \
            flex \
            hwloc \
            libncurses5-dev \
            tcl \
            tcl-dev \
            libboost-dev