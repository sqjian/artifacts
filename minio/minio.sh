#!/usr/bin/env bash

docker run --restart=always -d -p 9000:9000 \
  -e "MINIO_ACCESS_KEY=12345678" \
  -e "MINIO_SECRET_KEY=12345678" \
  registry.cn-hangzhou.aliyuncs.com/sqjian/artifacts:minio server /data
