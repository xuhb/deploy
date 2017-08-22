#!/bin/bash
VERSION=$1
BASE_PATH=$(cd `dirname -- $0`; cd ../../; pwd)
#cd ./files/campass

#git clone git@git.open01.com:api/campass.git ./files/campass

#if [ $# -ne 2 ]
#then
#      echo "arguments error!"
#      exit 1
#else
      deploy_path="$BASE_PATH/files/campass"
      if [ ! -d "$deploy_path" ]
      then
              project_path="git@git.open01.com:api/campass.git"
              git clone $project_path $deploy_path
              cd $deploy_path
              git checkout test
              git checkout $1
              source ~/.bashrc
              sudo mvn clean install
      else
              cd $deploy_path
               git pull
               git checkout $1
              source ~/.bashrc
               mvn clean install
      fi
#fi

