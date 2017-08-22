#!/bin/bash

if [[ $(docker ps -a | grep {{CONTAINER_NAME}}) != '' ]]; then
  docker rm -f {{CONTAINER_NAME}};
fi

docker run --name {{CONTAINER_NAME}} -d -e UMASK=0022  --hostname={{ansible_nodename}} -v ~/{{hosts}}/logs:/usr/local/tomcat/logs/ -v /home/uploadfile:/home/uploadfile -p {{PORT}}:8080 {{IMAGE_NAME}}:{{IMAGE_VERSION}}
