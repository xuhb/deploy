#!/bin/bash
VERSION=$1
BASE_PATH=$(cd `dirname -- $0`; cd ../../; pwd)

#git checkout $VERSION

deploy_path="$BASE_PATH/files/uploader"
if [ ! -d "$deploy_path" ]
then
  project_path="git@git.open01.com:data/uploader.git"
  git clone $project_path $deploy_path
else
  cd $deploy_path
   git pull
fi

