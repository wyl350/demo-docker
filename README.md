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


