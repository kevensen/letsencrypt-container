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
    pip install https://pypi.python.org/packages/70/75/472aa5db08ba5edc6f0aba20167ce3cfa239fb2465bfeb6c885731018b70/cryptography-2.1.4-cp27-cp27m-manylinux1_x86_64.whl#md5=f8334dd8504135a57bcf6efee17b1b55 && \
    pip install certbot