#!/bin/bash

if [[ $(docker ps -a | grep {{CONTAINER_NAME}}) != '' ]]; then
  docker rm -f {{CONTAINER_NAME}};
fi

docker run --name {{CONTAINER_NAME}} -d -e NODE_ENV=production -v ~/{{hosts}}/public:/app/public -p {{PORT}}:3000 {{IMAGE_NAME}}:{{IMAGE_VERSION}}
