#!/bin/bash

if [[ $(docker ps -a | grep {{CONTAINER_NAME}}) != '' ]]; then
  docker rm -f {{CONTAINER_NAME}};
fi

docker run --name {{CONTAINER_NAME}} -d  {{IMAGE_NAME}}:{{IMAGE_VERSION}}
