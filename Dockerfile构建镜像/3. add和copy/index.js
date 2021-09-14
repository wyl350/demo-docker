  //1. 导入 http 模块
  const http = require('http');
  //2. 创建服务器对象
  const server = http.createServer();
  //3. 开启服务器
  server.listen(3000, () => {
      console.log('Server is running...');
  });
  //4. 监听浏览器请求并进行处理
  server.on('request', (req, res) => {
      // end方法能够将数据返回给浏览器，浏览器会显示该字符串
      res.end('Hello Nodejs');
  });

  