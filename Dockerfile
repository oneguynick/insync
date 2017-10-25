FROM debian:jessie
LABEL maintainer="Nicholas Schmidt (nick@geekyschmidt.com)"

### Dependencies Addon
    RUN apt-get update && apt-get install -y --no-install-recommends apt-transport-https bash ca-certificates curl less tzdata

### S6 Installation
    ADD https://github.com/just-containers/s6-overlay/releases/download/v1.21.1.1/s6-overlay-amd64.tar.gz /tmp/
    RUN tar xzf /tmp/s6-overlay-amd64.tar.gz -C /

### Install Insync
    RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ACCAF35C && \
        echo deb http://apt.insynchq.com/debian jessie non-free contrib >>/etc/apt/sources.list.d/insync.list && \
        apt-get update && \
        apt-get install -y insync-headless && \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/* 

### Add Files
    ADD install /    

### Entrypoint Configuration
    ENTRYPOINT ["/init"]
