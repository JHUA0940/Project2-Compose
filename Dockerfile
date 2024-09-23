# 使用 Jenkins 官方镜像作为基础镜像
FROM jenkins/jenkins:lts

# 切换到 root 用户
USER root

# 安装 Docker 客户端
RUN apt-get update && \
    apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && \
    apt-get update && \
    apt-get install -y docker-ce-cli

# 切换回 Jenkins 用户
USER jenkins
