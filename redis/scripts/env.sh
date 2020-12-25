#!/bin/sh -eux


export DEBIAN_FRONTEND=noninteractive

tee /etc/motd <<- 'EOF'
-------------------------------------
   / \__
  (    @\___
  /         O
 /   (_____/
/_____/   U

This system is built by the sqjian
-------------------------------------
EOF

tee -a /etc/profile.d/ps1.sh <<-'EOF'
PS1="docker=>${PS1}"
EOF

tee -a /etc/profile.d/alias.sh <<-'EOF'
# shellcheck shell=sh
alias python='python3'
EOF

tee -a /etc/bash.bashrc <<-'END'
[ ! -z "$TERM" -a -r /etc/motd ] && cat /etc/motd
END

tee /etc/apt/sources.list <<- 'EOF'
deb http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse

deb http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse

deb http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse

deb http://mirrors.aliyun.com/ubuntu/ focal-proposed main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ focal-proposed main restricted universe multiverse

deb http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse
EOF
