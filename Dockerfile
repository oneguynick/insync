FROM debian:jessie
LABEL maintainer="Nicholas Schmidt (nick@geekyschmidt.com)"

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
