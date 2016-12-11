# Version: 0.1
FROM centos
MAINTAINER Pyshen "pyshen@example.com"

# yum change to 163 and update
RUN yum -y update && yum -y install wget

# install lib devel
RUN wget https://bootstrap.pypa.io/get-pip.py --no-check-certificate && python get-pip.py

# 创建应用目录
RUN mkdir -p /app
COPY . /app

# install requirement
WORKDIR /app
RUN pip install -r requirement.txt

RUN chmod 755 ./start.sh

EXPOSE 80
CMD ["./start.sh"]
