FROM debian:stretch
LABEL maintainer="Nicholas Schmidt (nick@geekyschmidt.com)"

### Install Insync
RUN set -x && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ACCAF35C && \
    echo deb http://apt.insynchq.com/debian stretch non-free contrib >>/etc/apt/sources.list.d/insync.list && \
    apt-get update && \
    apt-get install -y insync && \
    apt-get clean && \
    rm -rf /root/.config/Insync && \
    rm -rf /var/lib/apt/lists/* 

### Add Files
	ADD install /
