### windows 安装／升级Docker客户端

对于Windows 10以下的用户，推荐使用Docker Toolbox

Windows安装文件：http://mirrors.aliyun.com/docker-toolbox/windows/docker-toolbox/

对于Windows 10以上的用户 推荐使用Docker for Windows

Windows安装文件：http://mirrors.aliyun.com/docker-toolbox/windows/docker-for-windows/

### 如何安装 Docker Desktop for Win10

windows版本的docker叫做： Docker Desktop  大小约500多兆，跟vmware的大小一样。


官方安装教程； https://docs.docker.com/docker-for-windows/install/
教程中有下载安装文件的连接，下载速度非常快。

### 安装的条件以及问题

windows 上安装 docker 的条件： 
1. windows 64位 企业版/专业版/教育版
1. 启动 Hyper-v 
1. 64位处理器
1. 4g以上的内存
1. BIOS 启动硬件虚拟化

下载到exe文件后，傻瓜安装 但是需要重启 
注意： 安装时间比较长，不要怀疑安装出了问题。

安装完成后，我的docker 无法设置资源量，这里不知道是为什么

安装完成后出现： WSL 2 installation is incomplete. 错误的提示，给了一个地址 https://docs.microsoft.com/zh-cn/windows/wsl/wsl2-kernel 让下载安装。

测试安装成功的命令： `docker --version`

### 阿里云镜像加速器

因为国内下载镜像非常慢，因此需要设置镜像加速器，

我的阿里云的账号： 王艳雷
密码： Wangyl350_

我的阿里云账号下的镜像服务器的地址： https://ax9f95rd.mirror.aliyuncs.com

针对安装了Docker for Windows的用户，您可以参考以下配置步骤：

在系统右下角托盘图标内右键菜单选择 Settings，打开配置窗口后左侧导航菜单选择 Docker Daemon 。编辑窗口内的JSON串，填写下方加速器地址：

{
  "registry-mirrors": ["https://ax9f95rd.mirror.aliyuncs.com"]
}
编辑完成后点击 Apply 保存按钮，等待Docker重启并应用配置的镜像加速器。


### 虚拟机安装 docker

win10 虚拟机无法安装docker的解决： https://www.bbsmax.com/A/x9J2ypkMz6/
重点:使用VMware安装,必须启动虚拟化,前提是硬件CPU要能支持  这个在虚拟机的设置选项里面设置。这是虚拟机能否启用 docker 的关键原因。









### docker 启动引导式教程

分为四个步骤：分别是： 
第一步：  clone
First, clone a repository
The Getting Started project is a simple GitHub repository which contains everything you need to build an image and run it as a container.

Clone the repository by running Git in a container.

command line: 
docker run --name repo alpine/git clone https://github.com/docker/getting-started.git
docker cp repo:/git/getting-started

第二步：  build
Now, build the image
A Docker image is a private file system just for your container. It provides all the files and code your container needs.

command line: 
cd getting-started
docker build -t docker101tutorial .

第三步：  run
Run your first container
Start a container based on the image you built in the previous step. Running a container launches your application with private resources, securely isolated from the rest of your machine.

command line: 
docker run -d -p 80:80 --name docker-tutorial docker101tutorial

第四步：  share

Save and share your image on Docker Hub to enable other users to easily download and run the image on any destination machine.

command line: 
docker tag docker101tutorial {username}/docker101tutorial docker push {username}/docker101tutorial


### k8s

直接启用会有问题，因为启动k8s的话，程序会自动拉去国外的一些依赖文件，因为网墙的作用，拉不下来。
阿里云一个团队解决了这个问题。

https://github.com/AliyunContainerService/k8s-for-docker-desktop  README中详细的使用步骤
克隆下项目后，项目文件夹下 cmd 脚本运行 load_images.sh 
运行完后，就把必要的镜像拉去下来了，
验证命令： docker images

这个项目好像不行，我怀疑是因为没有人维护这个项目造成的。


只要是 k8s 必要的镜像包下载完成之后，kubernetes 就能够使用了。
kubectl cluster-info : 查看k8s集群是否正在运行
kubectl get nodes ： 查看本地节点
kubectl get pods -n kube-system

部署 kubernetes dashboard ：kubectl apply -f : 
远程安装： $ kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.4/aio/deploy/recommended.yaml
本地安装： kubectl create -f kubernetes-dashboard.yaml
kubectl get pods -n kube-system 查看里面是否多出来一个 dashboard

访问dashboard 需要开启api Server 代理： kubectl proxy
通过网址访问： http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/
这个网址访问是需要命令的，命令的获得方法：
$TOKEN=((kubectl -n kube-system describe secret default | Select-String "token:") -split " +")[1]
kubectl config set-credentials docker-for-desktop --token="${TOKEN}"
echo $TOKEN

### 命令

docker version： 查看docker的服务端和客户端的版本等信息
docker run hello-world : 这是一个最简单的校验命令，hello-world 就是一个小的镜像。这个镜像在网上，第一次运行会先到镜像库中抓取镜像，所以第一次运行是非常慢的。如果运行成功，说明本地安装的docker 是既可以抓取镜像，又可以运行容器的。

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/




### 补充

演示如何在国内网络环境下安装Docker Desktop for Win10，并启用其中的Kubernetes。课程ppt： https://github.com/spring2go/k8s-msa-in-action-ppt