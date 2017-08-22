#!/bin/bash

if [[ $(docker ps -a | grep {{CONTAINER_NAME}}) != '' ]]; then
  docker rm -f {{CONTAINER_NAME}};
fi

docker run \
  --name {{CONTAINER_NAME}} \
  --net=host \
  --volume=/var/run/docker.sock:/tmp/docker.sock \
  -d \
  {{IMAGE_NAME}}:{{IMAGE_VERSION}} \
  consul://{{CONSUL_HOST}}:{{CONSUL_PORT}}
