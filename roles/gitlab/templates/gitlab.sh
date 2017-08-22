#!/bin/bash

if [[ $(docker ps -a | grep "gitlab") != '' ]]; then
  docker rm -f gitlab;
fi

docker run --detach \
  --hostname {{ansible_default_ipv4.address}} \
  --env GITLAB_OMNIBUS_CONFIG="external_url 'http://{{ansible_default_ipv4.address}}'" \
  --publish 443:443 --publish {{NGINX_PORT}}:80 --publish {{SSH_PORT}}:22 \
  --name gitlab \
  --restart always \
  --volume /srv/gitlab/config:/etc/gitlab \
  --volume /srv/gitlab/logs:/var/log/gitlab \
  --volume /srv/gitlab/data:/var/opt/gitlab \
  gitlab/gitlab-ce:latest
