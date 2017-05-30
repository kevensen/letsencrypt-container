FROM registry.access.redhat.com/rhscl/httpd-24-rhel7

MAINTAINER kevensen@redhat.com

USER root

RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
    yum clean all && \
    rm -rf /var/cache/yum/*

RUN yum install --enablerepo=rhel-7-server-optional letsencrypt && \
    yum clean all && \
    rm -rf /var/cache/yum/*

USER 1001 
