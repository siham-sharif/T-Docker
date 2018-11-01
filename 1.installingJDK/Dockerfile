# author	: siham sharif
# date		: 30/Oct/2018
# 
# Installing JDK version 1.8.0_152 on Oracle Linux 6 base images provided by oracle container registry
# this script sets up JAVA_HOME and copies jdk components to /usr/local/jdk directory
# image size created using this Dockerfile is 889.5 MB
# build image by running ./build.sh provided in this directory

FROM container-registry.oracle.com/os/oraclelinux:6-slim

MAINTAINER Siham Sharif <siham.sharif@gmail.com>

ENV JAVA_PKG=jdk-8u152-linux-x64.tar.gz \
    JAVA_HOME=/usr/local/jdk

ADD $JAVA_PKG /usr/local/jdk_8

# ADD $JAVA_PKG creates a file structure /usr/local/jdk/jdk1.8.0_152
# mv /usr/local/jdk_8/jdk1.8.0_152 to /usr/local/jdk
RUN mv /usr/local/jdk_8/* $JAVA_HOME && \
    rm -rf /usr/local/jdk_8
