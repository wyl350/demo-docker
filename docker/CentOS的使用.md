## CentOS 7 的使用

官网网址： https://www.centos.org/


### 安装

CentOS是免费版，推荐在官网上直接下载，

下载镜像地址： https://www.centos.org/download/

官网有阿里云的镜像地址清单： 
进入阿里云后可以下载 minimal 版本和 everything 版本

DVD ISO：普通光盘完整安装版镜像，可离线安装到计算机硬盘上，包含大量的常用软件，一般选择这种镜像类型即可。

Everything ISO：包含了完整安装版的内容，并对其进行补充，集成了所 有软件。

Minimal ISO：这个版本为精简版的镜像，可以安装一个基本的CentOS系 统，包含了可启动系统基本所需的最小安装包。



CentOS Linux和CentOS Stream 的区别：
CentOS Stream

Centos Stream是一个滚动发布的Linux发行版，它介于Fedora Linux的上游开发和RHEL的下游开发之间而存在。你可以把CentOS Streams当成是用来体验最新红帽系Linux特性的一个版本，尝鲜使用。

CentOS Linux

CentOS Linux 就是普通使用的CentOS的系统了，如果追求稳定性，和正式使用，日常使用，还是强力推荐使用这个的。


Ubuntu跟CentOS的区别
CentOS

​ CentOS是RedHat的社区版本, 可以兼容RedHat的RPM安装包, 一般用作服务器, 预安装的也都是服务器的内容。除了没有RedHat服务外（反正要钱的咱也不会买）, 用起来与RedHat相差不大。包管理一般用rpm或者yum来管理。

Ubuntu

​ Ubuntu是基于Debian发行版和GNOME桌面环境, 也有KDE版本, 属于较流行的发行版, 它强化了图形方面的功能, 有面向一般用户的桌面版本, 也有服务器版本。因为其桌面版本比较漂亮, 有较多多媒体方面的软件和ubuntu软件中心的支持, 对一般用户也还算好用, 所以较流行。其服务器版本也就没什么好说了, 都差不太多。包管理一般用apt-get。

使用场景选取

​ 如果要做服务器, 当然选CentOS, 或者Ubuntu Server版。如果用做桌面系统, 那就用ubuntu desktop了。


### 网络配置

**DNS:** 
vim   /etc/resolv.conf
nameserver 192.168.0.1
nameserver 8.8.8.8
nameserver 8.8.4.4

这个肯定是修改DNS的文件，好像有重启刷新的嫌疑。


**配置网关**
新安装的电脑默认是采用的是 dhcp 服务自动配置。

route add default gw 192.168.1.1 dev eno*   : 临时修改网关

vim  /etc/sysconfig/network
NETWORKING=yes #表示系统是否使用网络，一般设置为yes。如果设为no，则不能使用网络。

HOSTNAME=centos #设置本机的主机名，这里设置的主机名要和/etc/hosts中设置的主机名对应

GATEWAY=192.168.1.1 #设置本机连接的网关的IP地址。

**配置ip地址**
vim  /etc/sysconfig/network-scripts/ifcfg-eno*
HWADDR=00:0C:29:8D:24:73
 TYPE=Ethernet
 BOOTPROTO=static  #启用静态IP地址
 DEFROUTE=yes
 PEERDNS=yes
 PEERROUTES=yes
 IPV4_FAILURE_FATAL=no
 IPV6INIT=yes
 IPV6_AUTOCONF=yes
 IPV6_DEFROUTE=yes
 IPV6_PEERDNS=yes
 IPV6_PEERROUTES=yes
 IPV6_FAILURE_FATAL=no
 NAME=eno16777736
 UUID=ae0965e7-22b9-45aa-8ec9-3f0a20a85d11
 ONBOOT=yes  #开启自动启用网络连接
 IPADDR0=192.168.21.128  #设置IP地址
 PREFIXO0=24  #设置子网掩码
 GATEWAY0=192.168.21.2  #设置网关
 DNS1=8.8.8.8  #设置主DNS
 DNS2=8.8.4.4  #设置备DNS
 :wq!  #保存退出

我学会的参数：
TYPE="Ethernet"
PROXY_METHOD="none"
BROWSER_ONLY="no"
BOOTPROTO="dhcp"
DEFROUTE="yes"
IPV4_FAILURE_FATAL="no"
IPV6INIT="yes"
IPV6_AUTOCONF="yes"
IPV6_DEFROUTE="yes"
IPV6_FAILURE_FATAL="no"
IPV6_ADDR_GEN_MODE="stable-privacy"
NAME="ens33"
UUID="ebe28110-6309-4296-a2f2-0fc1d154c66b"
DEVICE="ens33"
ONBOOT="yes"

TYPE="Ethernet"
PROXY_METHOD="none"
BROWSER_ONLY="no"
BOOTPROTO="dhcp"
DEFROUTE="yes"
IPV4_FAILURE_FATAL="no"

**设置静态网址：**

TYPE=Ethernet
PROXY_METHOD="none"
BOOTPROTO=static  #启用静态IP地址
DEFROUTE=yes
PEERDNS=yes
PEERROUTES=yes

IPV6INIT="yes"
IPV6_AUTOCONF="yes"
IPV6_DEFROUTE="yes"
IPV6_FAILURE_FATAL="no"
IPV6_ADDR_GEN_MODE="stable-privacy"

NAME="ens33"
UUID="ebe28110-6309-4296-a2f2-0fc1d154c66b"
DEVICE="ens33"
ONBOOT="yes"  #开启自动启用网络连接
IPADDR0="192.168.0.254"  #设置IP地址
PREFIXO0="24"  #设置子网掩码
GATEWAY0="192.168.21.2"  #设置网关
DNS1="8.8.8.8"  #设置主DNS
DNS2="8.8.4.4"  #设置备DNS

**设置主机名为www**
vim /etc/hostname #编辑配置文件

www   #修改localhost.localdomain为www

vim /etc/hosts #编辑配置文件

127.0.0.1   localhost  www   #修改localhost.localdomain为www

**重新启动服务**
ip link set eth0 upi          # 开启网卡
ip link set eth0 down         # 关闭网卡
service network restart

**补充命令**
ip  [选项]  操作对象{link|addr|route...}

```bash
# ip link show                  # 显示网络接口信息
# ip link set eth0 upi          # 开启网卡
# ip link set eth0 down         # 关闭网卡
# ip link set eth0 promisc on   # 开启网卡的混合模式
# ip link set eth0 promisc offi # 关闭网卡的混个模式
# ip link set eth0 txqueuelen 1200    # 设置网卡队列长度
# ip link set eth0 mtu 1400     # 设置网卡最大传输单元
# ip addr show                  # 显示网卡IP信息
# ip addr add 192.168.0.1/24 dev eth0 # 设置eth0网卡IP地址192.168.0.1
# ip addr del 192.168.0.1/24 dev eth0 # 删除eth0网卡IP地址

# ip route list                 # 查看路由信息
# ip route add 192.168.4.0/24  via  192.168.0.254 dev eth0 # 设置192.168.4.0网段的网关为192.168.0.254,数据走eth0接口
# ip route add default via  192.168.0.254  dev eth0    # 设置默认网关为192.168.0.254
# ip route del 192.168.4.0/24    # 删除192.168.4.0网段的网关
# ip route del default    # 删除默认路由
```

### DNS 修改

systemctl restart network.service ： 这个重启命令并不好用

DNS 默认是受 网络管理器管理 管理
 cd /etc/NetworkManager/
修改内容为：
dns=none
不通过网络管理器管理

修改 vim   /etc/resolv.conf ,新增dns配置

#主DNS
nameserver 8.8.8.8
#备DNS
nameserver 8.8.4.4

### 