#!/bin/bash
VERSION=$1

rm -rf ./files/tasks

git clone git@git.open01.com:api/tasks.git --depth=1 ./files/tasks
git checkout $VERSION

cd ./files/tasks
mvn clean install
