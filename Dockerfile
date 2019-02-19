FROM ubuntu:16.04

ENV DEBIAN_FRONTEND=noninteractive
ENV MESOS_SYSTEMD_ENABLE_SUPPORT=false

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF && \
    echo 'deb http://repos.mesosphere.com/ubuntu xenial main' | tee -a /etc/apt/sources.list.d/mesosphere.list && \
    apt-get update -q && \
    apt-get install -y libevent-dev libsvn1 libcurl4-openssl-dev mesos sudo wget net-tools docker.io openjdk-8-jdk
    
RUN wget https://storage.googleapis.com/kubernetes-helm/helm-v2.12.3-linux-amd64.tar.gz && \
    tar -xf helm-v2.12.3-linux-amd64.tar.gz && \
    mv linux-amd64/helm /usr/local/bin/helm

RUN apt-get update && apt-get install -y python3-pip && \
    pip3 install awscli --upgrade --user