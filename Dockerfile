FROM ubuntu:16.04

ENV DEBIAN_FRONTEND=noninteractive
ENV MESOS_SYSTEMD_ENABLE_SUPPORT=false

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF && \
    echo 'deb http://repos.mesosphere.com/ubuntu xenial main' | tee -a /etc/apt/sources.list.d/mesosphere.list && \
    apt-get update -q && \
    apt-get install -y libevent-dev libsvn1 libcurl4-openssl-dev postgresql zookeeper mesos sudo wget net-tools && \
    sed -i "s/peer/trust/g" /etc/postgresql/*/main/pg_hba.conf && \
    sed -i "s/md5/trust/g" /etc/postgresql/*/main/pg_hba.conf
