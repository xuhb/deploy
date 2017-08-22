# 目录结构

* bin - deploy 执行文件目录
* docker_files  - DockFile 存放目录
* applications  - 应用相关配置文件
* scripts - 应用相关脚本文件
* roles  - ansible 应用配置文件
* deploy.yml - ansible 部署文件
* hosts - ansible 目标主机配置文件

# 部署方法
```
bin/deploy 应用名称 版本号
```

## Nginx
```
bin/deploy nginx 1.0.0 [此版本号为手动指定]
```

## campass 朗录
```
bin/deploy campass 1.0.0 [此版本号为合并到master分支打的tags]
```

## account 开户管理系统
```
bin/deploy account 1.0.0 [此版本号为合并到master分支打的tags]
```

## official 官网
```
bin/deploy official 1.0.0 [此版本号为合并到master分支打的tags]
```

# 服务器列表
1. 172.17.90.1 跳板机
2. 172.17.90.2 docker镜像服务器+gitlab+ansible
3. 172.17.90.3 消息队列(redis+rabbitmq)
4. 172.17.90.4 hadoop+spark
5. 172.17.90.5 hadoop+zk+spark
6. 172.17.90.6 hadoop+zk+spark
7. 172.17.90.7 hadoop+zk+spark+hive+hive_mysql+大数据相关脚本
8. 172.17.90.8 docker(nginx+tomcat[campass\官网\开户管理\task定时任务程序]+R画图)
9. 172.17.90.9 docker(nginx+tomcat[campass\官网\开户管理])+mysql
10. 172.17.90.10 es+logstash
11. 172.17.90.11 es+logstash
12. 172.17.90.12 flume+kafka
13. 172.17.90.13 flume+kafka
