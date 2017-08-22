#!/bin/bash

if [[ $(docker ps -a | grep {{CONTAINER_NAME}}) != '' ]]; then
  docker rm -f {{CONTAINER_NAME}};
fi

docker run --name {{CONTAINER_NAME}} -d -e UMASK=0022 --hostname={{ansible_nodename}} -v /home/hadoop/uper:/home/hadoop/uploader -v /home/hadoop/upload:/home/hadoop/upload -p {{PORT}}:5000 {{IMAGE_NAME}}:{{IMAGE_VERSION}}
