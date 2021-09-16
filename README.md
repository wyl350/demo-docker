## docker 地址

docker 官网： https://www.docker.com/

docker document 网址： https://docs.docker.com/get-started/overview/

docker document 源码： https://github.com/docker/docker.github.io

## 2021年9月12日 我又重新开始学习 docker

技术胖的docker 教程： https://www.bilibili.com/video/BV1754y1J7KA?spm_id_from=pageDriver

技术胖的网址： https://jspang.com

docker具体网址： https://jspang.com/detailed?id=75#toc25

技术胖的教程不错，但是只能作为docker document 的辅助学习材料，不能作为学习 docker 的主要材料。

## 镜像加速器配置

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

## 容器打包成镜像

docker commit -m 'description' -a 'authir_info' <容器id 或 名称> '镜像的仓库名'

-m 和-a 可以不写


## docker toolbox

国内下载 docker toolbox 的地址，但是这个基本没有用了，因为dockers的安装生态已经发展成熟

国内下载地址： http://get.daocloud.io/toolbox/

