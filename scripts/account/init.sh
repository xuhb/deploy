#!/bin/bash
VERSION=$1

rm -rf ./files/account

git clone git@git.open01.com:api/account.git --depth=1 ./files/account
git checkout $VERSION

cd ./files/account
mvn clean install
