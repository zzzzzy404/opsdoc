#!/bin/bash

# docker 安装
# 1.移除原有docker相关软件
sudo yum remove docker \
    docker-client \
    docker-client-latest \
    docker-common \
    docker-latest \
    docker-latest-logrotate \
    docker-logrotate \
    docker-engine
# 2.移除原有docker数据
if [ -d "/var/lib/docker" ]; then

    echo "是否删除原docker数据目录 /var/lib/docker:"
    select var in yes no exited; do
        break
    done

    echo "You have selected $var ;"
    sudo rm -rf /var/lib/docker/
fi

# 3.安装docker
# 3.1 repositity install
if [test -z "$(yum list installed | grep "yum-utils")"]; then
    sudo yum install -y yum-utils
fi

sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# 安装 latest 版本
sudo yum install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
# 安装docker后，不会启动docker，创建了一个docker组（没有用户）