## docker 
官网网址： https://docs.docker.com/get-started/overview/



## 

get.daocloud.io/toobox/


下载镜像的国内网址: http://get.daocloud.io/toolbox/

下载这个版本就可以了： DockerToolbox-19.03.1.exe    

安装过程：

第一个界面：
默认勾选的 help Docker improve Toolbox ,可以取消勾选
第二个界面：
一般情况下，应该勾选
1. docker compose for windows   编排docker 容器的一种技术，能够操作多个docker容器，让多个容器能够配合着使用。
1. virtualbox
1. Git for windows
这两项，当然已经安装过git 的，可以不选择勾选 git for windows
第三个界面：
默认勾选前三项，默认就好
第四个界面： 
安装即可。

安装完成后，修改快捷方式的 地址为： "C:\Program Files\Git\bin\bash.exe" --login -i "C:\Program Files\Docker Toolbox\start.sh"  这一步极其的重要。


## 2021年4月11日 我看的内容

b站： Docker最新版 通俗易懂，快速上手的Docker基础+进阶（零基础入门必备）学会Docker部署SpringBoot项目吃透Docker容器
uup： 全栈工程师嘟嘟

### 第五个视频

老师讲解如何 配置网络环境 老师的centos是最小安装版本的
这里有详细的介绍如何 配置 cnetos 的网络环境


## 2021年9月12日 我又重新开始学习 docker

技术胖的docker 教程： https://www.bilibili.com/video/BV1754y1J7KA?spm_id_from=pageDriver

技术胖的网址： https://jspang.com

docker具体网址： https://jspang.com/detailed?id=75#toc25

## linux 安装教程

安装命令： curl -fsSL get.docker.com -o get-docker.sh
 
查看是否安装完毕： docker version

这个命令并不能查看到当前系统已经启动 服务，仅仅能看到已经启动客户端。需要命令启动服务。

启动服务命令： systemctl start docker

### 镜像加速器配置

官方镜像仓库的速度是非常慢的，应该使用国内的镜像加速器来加速

https//cr.console.aliyun.com

docker info 命令确认是否加速器配置成功

2020年11月15日 我在阿里云注册了我的云账号
云账号： 王艳雷
云密码： 我的 exis 的复杂密码 
阿里云的 容器镜像服务 设置Registry登录密码： wyl3527459

在该网站我得到我的镜像加速器的地址为： https://ax9f95rd.mirror.aliyuncs.com

centOS 配置镜像加速器配置  : 
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://ax9f95rd.mirror.aliyuncs.com"]
}
EOF
sudo systemctl daemon-reload  # 重新加载配置文件
sudo systemctl restart docker # 重新加载daemon

docker info 来查看信息: 为： 

Registry: https://index.docker.io/v1/

配置淘宝镜像： $ sudo docker login --username=王艳雷 registry.cn-hangzhou.aliyuncs.com

### 初级使用

docker container run nginx

展示全部容器：
docker container ls
docker container ps

展示所有容器：
docker container ls -a 
docker container ps -a
注意这个命令是可以展示所有的容器的哈希值的， -q参数的作用： 
docker container ls -aq

停止容器：
docker container stop <容器名>

删除容器： 
docker container rm <容器名>
但是，正在运行的容器是不能删除的，如果要删除一定要使用参数 -f （--force）


批量处理命令,停止所有的容器： 
docker container stop $(docker container ps -aq)

端口映射： -p 80:90
外部的端口是80（服务器的端口），内部的端口是90（容器的端口）

启动具体的容器 -d(--detached)： docker container run -p 90:80 nginx
外网访问端口是 90.
后台运行命令： docker container run -d -p 90:80 nginx

后台命令调往前台： docker attach 5bf

正在运行的容器，日志查看命令： docker container logs 3b 
正在运行的容器，日志跟踪命令： docker container logs 3b  -f
注意进入这个跟踪模式后，与占用终端窗口的模式不同，是能够关闭的，容器也不会停止服务。

docker container run -it ubuntu sh  ：交互模式使用  shell 脚本的方式进行操作。一旦退出，容器也对应退出。

交互模式进入，但是这种模式不会影响正在运行的容器： docker exec -it bcf sh

### 获取镜像的三种方式： 

1. pull from registry
1. Dockerfile online
1. 自有文件导入 offline

docker 官方的网址： hub.docker.com
红帽旗下的： quay.io

每个镜像的 tag 标签可以拉取具体的镜像。


### 镜像操作

拉取镜像： docker image pull wordpress
docker image ls : 列出所有的镜像列表
docker image inspect <镜像> ： 查看镜像的具体信息（镜像信息）
docker image rm <镜像>： 删除镜像，当然是可以同时删除多个镜像的
docker image history <镜像>： 查看镜像详细分层命令


### 镜像信息

Architecture： 架构（amd64）
Os： 系统 （linux）
layer：层

### 镜像的导入导出

docker image ls

文件导出： docker image save <镜像> -o <保存地址>
文件导入： docker image load -i <镜像地址>    
改名： docker image tag jspang jspangcom/jspang
改名的目的就是为了让不符合h官方库的名字符合标准名。
上传： docker image push jspangcom/jspang

### 构建docker服务

最后的 . 是指定有 Dockerfile 文件的目录： docker image build -t jspang .

### hub.docker

在该网址注册用户名。
我的用户名是： wyl350
密码是： 我的云密码

登录命令： docker login 

登陆后，会在 docker info 中显示。















 

