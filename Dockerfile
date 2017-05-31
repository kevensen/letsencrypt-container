FROM registry.access.redhat.com/rhscl/httpd-24-rhel7

MAINTAINER kevensen@redhat.com

USER root

RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
    yum clean all && \
    rm -rf /var/cache/yum/*

RUN yum install --disablerepo='*' --enablerepo='rhel-7-server-rpms' --enablerepo='rhel-7-server-optional-rpms' --enablerepo='epel' letsencrypt -y && \
    yum clean all && \
    rm -rf /var/cache/yum/*

RUN chown -R 1001 /etc/letsencrypt

USER 1001 
