## 2020 Docker最新超详细版教程通俗易懂-加油，尾款人！

b站视频
2020 Docker最新超详细版教程通俗易懂-加油，尾款人！
学习交流群：603868433
资料V:1171736841
【公众号：编程资料分享】

### 介绍

虚拟化容器
一体化处理
完整的包中包含所有的需求环境

yum 安装 docker

go语言开发的开源容器项目。利用操作系统本身已有的机制和特性，

go语言 干净 高效

docker 虚拟操作环境 + 软件   docker 的运行是依托外部软件的。

Docker Server + 镜像  就可以到处执行

Docker 创建的运行环境是容器 == 镜像

官方网址： https//www.docker.com

镜像仓库地址： https://hub.docker.com/

让自己的应用程序 Docker 化。

### docker 具体特点

拿到模板，写时复制

可移植性

软件的任意组合

软件的版本控制

适用于微服务开发， 应用程序或者服务变现为一些列的内部互联的容器。从而使得分布式部署应用程序，扩展或调试应用程序都变得非常简单，当然，也是可以在一个容器中运行多个应用程序的。课件docker 对应用进行了拆分和组装。不过，docker 推荐单个容器只运行一个应用程序或者进程。

### Docker 架构  介绍一些重要的基础概念

Docker_Host : 宿主机
docker 启动的时候会在宿主机中启动一个进程， docker daemon  

docker daemon： 
这是docker 的守护进程 可以和宿主机做交互

Client ： 客户端
使用一些命令： 例如： 
docker build
docker pull
docker run
这些命令通过 client 发送给 daemon 由 daemon 进行解释和执行

images ：
由 daemon 来读取，进而组合形成容器 container

container： 
运行的具体打包的应用

Registry: 
保存很多的镜像文件 每个镜像文件就是一个文件 同时还有一个版本标签


### 安装docker

CentOS 

1. 为本地 yum 提供远程的 repo 信息

curl https://dowmload.docker.com/linux/centos/docker-ce.repo -o /etc/yum.repos.d/docker-ce.repo


1. 安装依赖

yum install -y https://download.docker.com/linux/fedora/30/x86_64/stable/Packages/containerd.io-1.2.6-3.3.fc30.x86_64.rpm

1. 安装docker-ce

yum install -y docker-ce

### 启动 docker

systemctl start docker
systemctl status docker
systemctl stop docker

docker info



### Docker 镜像操作

docker 镜像是有文件系统叠加而成，这是文件的一种存储方式，最低端是一个文件引导系统，即bootfs，像典型的linux的引导文件系统。
他是有一个自己的格式的，对应文件和结构形成相应的功能。
当一个容器启动以后，他将会被移动到内存中，而引导文件在引导结束之后会在内存中被删除。


分层：层次化的文件系统
我们自己写的代码
servlet
tomcat
jdk
基础镜像
bootfs引导文件


**搜索远程镜像：**
docker search mysql : 搜索远程库中对应的镜像信息 并展示到终端。 
当然在我的案例云的镜像中心也是可以搜索的。

仓库字段：
name： 
description：
starts：
off： ok 表示是否是官方的
automated ： 自动构建

**下载远程镜像**： 
docker pull mysql ： 这里默认下载的是最终的版本，版本信息是可以到官网dockerhub上面查看的


**查看本地镜像：**
docker images == docker image ls ： 展示本地所有的镜像

字段介绍： 
repository： 镜像名称
tag： 版本号
image id： 镜像id
created： 创建日期
size： 镜像大小


**删除镜像：**
首先应该定位镜像，才能删除镜像。定位的依据有： 
image id
repository + tag

docker rmi 定位信息 ： 当然删除的是这个镜像的个性信息，不是共性信息。

### 容器管理

可以把容器看成是一个简易版本的linux系统包括： 
root用户权限
进程空间
用户空间
网络空间

**创建容器：**
docker create -p 3360:3306 --name first_mysql -e MYSQL_ROOT_PASSWORD=root mysql:5.7.30


3360:3306  ： 宿主机端口：容器端口
--name first_mysql  : 容器名称
-e ；容器环境设置
--interactive  -i  提供一个交互模式
--tty -t  提供给一个伪终端
-v docker内的文件和宿主机进行映射



**查看容器：**
docker container ls
docker container ls -a
docker container ls -n 3  最近创建的三个
docker container ls -q 只是显示容器的id
docker container ls -s 显示容器的容量
docker container ls -l 显示最后创建的容器
docker container ls -f 显示格式化或者过滤的容器



**启动容器：**
定位标准就是容器的名字或者id
docker start 容器标识 ：docker start mysql


**启动容器：**
docker stop 容器标识 ：docker stop mysql

**强制杀死容器服务**
docker kill 容器标识 ：docker kill mysql

**创建并启动容器**
docker run 容器标识 ：docker run mysql
相当于 create + start

**暂停容器和恢复容器**
docker pause 容器标识
docker unpause 容器标识

**访问容器**
docker exec --help 
docker exec  -it mysql /bin/bash 

**查看容器日志**
docker logs 容器标识

**查看容器的进程**
docker top 容器标识

**查看容器的详情**
docker inspect 容器标识

**docker内部的数据和主机进行复制操作：**
docker copy 


**删除容器**
docker rm 容器标识



### docker file 管理

该看第 27 个了，这个开始就看不懂了。

