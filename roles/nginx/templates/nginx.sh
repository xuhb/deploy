#!/bin/bash

if [[ $(docker ps -a | grep {{CONTAINER_NAME}}) != '' ]]; then
  docker rm -f {{CONTAINER_NAME}};
fi
docker run --name {{CONTAINER_NAME}} \
  -d \
  -v ~/{{hosts}}/logs:/var/log/nginx/ \
  -p {{HTTP_PORT}}:80 \
  -p {{HTTPS_PORT}}:443 \
  -p {{PIC_PORT}}:8000 \
  {{IMAGE_NAME}}:{{IMAGE_VERSION}}
