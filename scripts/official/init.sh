#!/bin/bash
#BASE_PATH=$(cd `dirname -- $0`; pwd)
rm -rf ./files/official
git clone git@git.open01.com:app/open01\.com.git  ./files/official
cd ./files/official

git checkout $VERSION

