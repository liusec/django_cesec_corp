# Version: 0.1
FROM centos
MAINTAINER Pyshen "pyshen@example.com"

# yum change to 163 and update
RUN yum -y update && yum -y install wget && wget http://mirrors.163.com/.help/CentOS6-Base-163.repo
RUN mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.bak && mv ./CentOS6-Base-163.repo /etc/yum.repos.d/CentOS-Base.repo
RUN yum -y clean all && yum -y makecache && yum -y update

# install lib devel
RUN wget https://bootstrap.pypa.io/get-pip.py --no-check-certificate && python get-pip.py

# 创建应用目录
RUN mkdir -p /app
COPY . /app

# install requirement
RUN pip install -r requirement.txt

WORKDIR /app
RUN chmod 755 ./start.sh

EXPOSE 80
CMD ["./start.sh"]
