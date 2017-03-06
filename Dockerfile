FROM centos:centos7
MAINTAINER jhyoon

ARG AgentKey
ENV AGENT_KEY ${AgentKey}

RUN echo "Add Repository"
RUN rpm -Uvh http://monrepo.gabia.com/repo/centos/noarch/gabmon-repo-1.0.0-1.noarch.rpm;

RUN echo "Setup Gabia Agent"
RUN yum -y install gabia_mond

RUN env PATH=$PATH:/usr/local/gabia_mond/bin 
RUN /usr/local/gabia_mond/bin/gabia_mond --start --key=$AGENT_KEY
