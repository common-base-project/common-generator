**项目说明** 
- common-generator 是开源的项目代码生成器，可在线生成entity、xml、dao、service、html、js、sql代码，减少70%以上的开发任务
- 目前支持 mysql、oracle、sqlserver、postgresql、mongodb
<br> 

  
**本地部署**
- 通过 git： https://github.com/mustang2247/common-generator.git 下载源码
- 修改 application.yml，更新数据库账号和密码、数据库名称
- IDEA 运行 CommonApplication.java，则可启动项目
- 项目访问路径：http://localhost:8080

## make 打包
    注意：Makefile 文件里 main.go 的路径

    make docker-all VERSION="staging_v0.0.1" ENV_SERVER_MODE="staging"
    make docker-all VERSION="staging_v0.0.1" ENV_SERVER_MODE="dev"
    make docker-all VERSION="prod_v0.0.1" ENV_SERVER_MODE="prod"


### docker info
    // build docker
    docker build . -t block-games-lobby:1.0
    
    docker run -d -p 8999:8999 -p 9999:9999 block-games-lobby:1.0