## Linux下如何运行bash文件

https://blog.csdn.net/mamamalululu00000000/article/details/90680927

1. 创建一个bash文件

2. 运行文件
2.1 工作目录执行 ./ 方式运行
先cd 进入到脚本所在的目录，然后使用 ./脚本方式执行
开始提示权限不够，通过 chomd 赋值，然后再运行即可
./ hello.bash

chomd 777 hello.bash
./ hello.bash
2.2 bash sh 方式运行
bash hello.bash
sh hello.bash
2.3 source 方式运行
source hello.bash
2.4 绝对路径 方式运行
/data1/test/hello.bash
