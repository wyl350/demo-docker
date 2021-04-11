## yum命令如何改为本地源安装软件

https://blog.csdn.net/a755199443/article/details/98966426

1 挂载linux镜像
虚拟机先在CD/DVD选项使用linux系统镜像
然后使用命令,将cdrom设备挂载到/mnt目录(每次重启后都需要重新挂载)

mount /dev/cdrom /mnt

2 修改repo配置文件
进入/etc/yum.repos.d目录(本文示范时使用的时CentOS系统)
备份CentOS-Base.repo文件
修改CentOS-Base.repo文件

cd /etc/yum.repos.d
cp CentOS-Base.repo CentOS-Base.repo.bak
vi CentOS-Base.repo

利用命令dG删除全部内容


新增内容为

[base]
name=local
baseurl=file:///mnt
gpgcheck=1
enable=1


3 重置yum
注意:这步一定不能忘
命令为:

yum clean all
yum makecache


## linux 修改 yum 为阿里云源

https://www.cnblogs.com/yg_zhang/p/9250051.html

为了加快yum的下载速度，我们可以讲yum源指向阿里云的资源。

操作方法：

1. 备份系统的yum源

mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup

或者： mv CentOS-Base.repo CentOS-Base.repo.backup



2. 下载阿里的源

 wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo



3. 运行yum makecache生成缓存

4. vi /etc/yum.repos.d/CentOS-Base.repo 查看更改。








