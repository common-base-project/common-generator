# Author: Mustang
# 基础镜像使用java,alpines表示最小镜像的Linux系统 docker pull openjdk:11.0.12-jdk-oracle
FROM openjdk:11.0.12-jdk-oracle

#USER root

# 作者
MAINTAINER Mustang Kong <mustang2247@gmail.com>

ARG procname
ARG modeenv

ENV PROC_NAME=${procname}
ENV ENV_SERVER_MODE=${modeenv}

WORKDIR /opt/${procname}

VOLUME ["/opt/$PROC_NAME"]

ARG JAR_FILE=target/*.jar
# 将jar包添加到容器中并更名为app.jar
COPY ${JAR_FILE} app.jar

#设置镜像的时区,避免出现8小时的误差
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# 暴露多个端口
EXPOSE 9080

#定义jvm参数变量
ENV JAVA_OPTS=""
#ENV JAVA_OPTS="--spring.profiles.active=prod"

# 运行jar包
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar app.jar", "--spring.profiles.active=$ENV_SERVER_MODE" ]

