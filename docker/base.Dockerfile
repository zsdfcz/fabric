FROM ubuntu:18.04

EXPOSE 8080

RUN apt-get update && apt-get dist-upgrade -y
RUN apt-get install -y --no-install-recommends \
	apt-transport-https \
	ca-certificates \
	wget \
	curl \
	gnupg-agent \
	software-properties-common \
	git \
	vim \
    tree \
    make \
    g++ \
	gcc

# 파이썬 설치
RUN apt-get install -y --no-install-recommends \
        software-properties-common \
        && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        python3.6 \
        python3.6-dev \ 
        python3-distutils-extra \
        && \
    wget -O ~/get-pip.py \
        https://bootstrap.pypa.io/get-pip.py && \
    python3.6 ~/get-pip.py && \
    ln -s /usr/bin/python3.6 /usr/local/bin/python3 && \
    ln -s /usr/bin/python3.6 /usr/local/bin/python

# NodeJS 설치
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y --no-install-recommends \
	nodejs

# Golang 설치
RUN wget -P /tmp https://dl.google.com/go/go1.14.12.linux-amd64.tar.gz

RUN tar -C /usr/local -xzf /tmp/go1.14.12.linux-amd64.tar.gz
RUN rm /tmp/go1.14.12.linux-amd64.tar.gz

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH
RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"

WORKDIR /go/src