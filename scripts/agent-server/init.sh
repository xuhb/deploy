#!/bin/bash
VERSION=$1

rm -rf ./files/agent-server

git clone git@git.open01.com:data/agent.git --depth=1 ./files/agent
git checkout $VERSION

mv ./files/agent/server ./files/agent-server
rm -rf ./files/agent
