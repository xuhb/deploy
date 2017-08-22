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


## account 开户管理系统
```
bin/deploy account 1.0.0 [此版本号为合并到master分支打的tags]
```

## official 官网
```
bin/deploy official 1.0.0 [此版本号为合并到master分支打的tags]
```

# 服务器列表
