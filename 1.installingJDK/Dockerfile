# author	: siham sharif
# date		: 30/Oct/2018
# 
# Installing JDK version 1.8.0_152 on Oracle Linux 6 base images provided by oracle container registry
# this script sets up JAVA_HOME and copies jdk components to /usr/local/jdk directory
# image size created using this Dockerfile is 505 MB
# build image by running ./build.sh provided in this directory

FROM container-registry.oracle.com/os/oraclelinux:6-slim

MAINTAINER Siham Sharif <siham.sharif@gmail.com>

ENV JAVA_PKG=jdk-8u152-linux-x64.tar.gz \
    JAVA_HOME=/usr/local/jdk

ADD $JAVA_PKG /usr/local/jdk
