FROM banjang/fabric-env:2.2.base1

# ==================================================================
# DinD Docker and Docker Compose
# ------------------------------------------------------------------
RUN curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh
RUN curl -L "https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

# ==================================================================
# vscode server
# ------------------------------------------------------------------
RUN curl -kfsSL https://code-server.dev/install.sh | sh

RUN mkdir /util
COPY docker/util/start-ide.sh /util
RUN chmod -R 777 /util

WORKDIR /go/src

ENTRYPOINT ["/bin/bash", "-c", "/util/start-ide.sh"]