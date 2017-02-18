FROM centos:6.7

MAINTAINER atos990@gmail.com

RUN \
    yum -y update && \
    yum -y install tar && \
    yum -y install wget && \
    yum -y install zip && \
    yum -y install zsh && \
    yum -y install vim && \
    yum -y install git && \
    yum -y install nc && \
    git clone https://github.com/planbjp/dotfiles.git && \
    sh dotfiles/setup.sh && \
    wget https://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm && \
    rpm -ivh epel-release-6-8.noarch.rpm

### Package install
#
RUN \
    yum -y install mysql && \
    yum -y install mysql-server

RUN \
    yum -y install httpd && \
    yum -y install httpd-devel && \
    yum -y install php && \
    yum -y install php-mysql && \
    yum -y install php-bcmath && \
    yum -y install php-dba && \
    yum -y install php-devel && \
    yum -y install php-gd && \
    yum -y install --enablerepo=epel php-mcrypt && \
    yum -y install php-mbstring

RUN \
    usermod -u 1000 apache && \
    mkdir -p /var/log/php

COPY etc/php.ini /etc/

### Application Framework
#
WORKDIR /usr/local/src

RUN \
    wget https://packages.zendframework.com/releases/ZendFramework-1.12.17/ZendFramework-1.12.17-minimal.tar.gz && \
    tar xvzf ZendFramework-1.12.17-minimal.tar.gz && \
    mv ZendFramework-1.12.17-minimal ../lib/ && \
    wget https://github.com/smarty-php/smarty/archive/v3.1.28.tar.gz && \
    tar xvzf v3.1.28.tar.gz && \
    mv smarty-3.1.28 ../lib/

### Init Database
#
COPY root/init.sh /root/

WORKDIR /home

ENTRYPOINT \
    /etc/init.d/httpd start && \
    /bin/sh /root/init.sh && \
    /bin/zsh
