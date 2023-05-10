# 卸载 docker
sudo yum remove docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras
if [ -d "var/lib/docker"]; then
    echo "是否删除原docker数据目录 /var/lib/docker:"
    select var in yes no exited; do
        break
    done
    if $var = "yes"; then
        sudo rm -rf /var/lib/docker
    fi
    if $var = "exited"; then
        exit
    fi
fi

if [-d "/var/lib/containerd"]; then
    echo "是否删除原docker容器目录 /var/lib/containerd:"
    select var in yes no exited; do
        break
    done
    if $var = "yes"; then
        sudo rm -rf /var/lib/containerd
    fi
    if $var = "exited"; then
        exit
    fi
fi

echo "docker uninstall succeed"
