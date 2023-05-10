# 虚拟机centos7-minial init

<!-- 网络配置 -->
# 网络配置
## 连通网络
查看网卡
```
nmcli d
```  
vi /etc/sysconfig/network-scripts/ifcfg-ens33   
网卡多种配置  
dhcp
static
ONBOOT=yes  
重启网络
```
systemctl restart network
```

## ssh服务
<!-- ssh服务 -->
yum list installed | grep openssh-server  
yum install -y openssh-server  
systemctl start sshd

<!-- 工具安装 -->

yum install -y yum-utils net-tools

<!--  neovim -->
> 参考: https://github.com/neovim/neovim/wiki/Installing-Neovim#centos-8--rhel-8

yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm  
yum install openssh-server -y

<!-- 账号配置 -->
# 账号配置
## sudoers
```
chmod u+w /etc/sudoers
```
添加: zzhao   ALL=(ALL)       ALL
```
chomd u-w /etc/sudoers
```