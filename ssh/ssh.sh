#!/usr/bin/env bash

set -eux

ssh_dir="/root/.ssh"
if [ ! -d "${ssh_dir}" ]; then
    mkdir -p ${ssh_dir}
    touch ${ssh_dir}/known_hosts
fi

dst="*.*.*.*"
ssh-keyscan ${dst} >> ~/.ssh/known_hosts
ssh -NF ssh.config root@${dst}