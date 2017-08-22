#!/bin/bash

if [[ $(docker ps -a | grep registry) != '' ]]; then
  docker rm -f {{CONTAINER_NAME}};
fi

docker run \
  --name {{CONTAINER_NAME}} \
  -d \
  -v /opt/registry:/var/lib/registry \
  -p {{DOCKER_REGISTRY_PORT}}:5000 \
  --restart=always \
  registry
