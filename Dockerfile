FROM registry.access.redhat.com/rhel:latest

LABEL maintainer="kevensen@redhat.com"


RUN yum install --disablerepo='*' --enablerepo='rhel-7-server-rpms' gcc python-virtualenv -y && \
    yum clean all && \
    rm -rf /var/cache/yum/*

RUN mkdir /opt/letsencrypt && \
    useradd -u 1001 default -d /opt/letsencrypt && \
    chown 1001:1001 /opt/letsencrypt && \
    mkdir /etc/letsencrypt && \
    chown -R 1001:0 /etc/letsencrypt

USER 1001

RUN cd /opt/letsencrypt && \
    virtualenv certbot && \
    cd certbot && \
    source bin/activate && \
    pip install setuputils --upgrade && \
    pip install certbot