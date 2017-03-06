FROM centos

MAINTAINER jhyoon <sac5@naver.com>

# Epel 레파지토리
# RUN rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm

RUN yum -y update

# JAVA
RUN yum -y install java-1.7.0-openjdk-devel
RUN yum -y install glibc.i686
RUN yum -y install libstdc++.i686
RUN yum -y install glibc-devel.i686
RUN yum -y install zlib-devel.i686

# Android SDK
RUN cd /usr/local/ && curl -L -O http://dl.google.com/android/android-sdk_r22.3-linux.tgz && tar xf android-sdk_r22.3-linux.tgz

# SDK Tools
RUN echo y | /usr/local/android-sdk-linux/tools/android update sdk --filter tools --no-ui --force -a
RUN echo y | /usr/local/android-sdk-linux/tools/android update sdk --filter platform-tools --no-ui --force -a

# ENV 설정
ENV ANDROID_HOME /usr/local/android-sdk-linux
ENV PATH $PATH:$ANDROID_HOME/tools
ENV PATH $PATH:$ANDROID_HOME/platform-tools
