#!/bin/bash

if [[ $(docker ps -a | grep {{CONTAINER_NAME}}) != '' ]]; then
  docker rm -f {{CONTAINER_NAME}};
fi

docker run --name {{CONTAINER_NAME}} -d -v ~/{{hosts}}/logs:/usr/local/tomcat/logs/ -p {{PORT}}:8080 {{IMAGE_NAME}}:{{IMAGE_VERSION}}
