#!/bin/bash

if [[ $(docker ps -a | grep {{CONTAINER_NAME}}) != '' ]]; then
  docker rm -f {{CONTAINER_NAME}};
fi

docker run \
  --name {{CONTAINER_NAME}} \
  -d \
  -p 8400:8400 -p 8500:8500/tcp -p 8600:53/udp \
  -v ~/consul/data:/consul/data \
  {{IMAGE_NAME}}:{{IMAGE_VERSION}}
