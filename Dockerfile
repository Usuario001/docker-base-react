FROM node:23-alpine

LABEL maintainer="usuario001"

RUN apk add --no-cache bash curl python3 py3-pip gcc g++ make musl-dev linux-headers

RUN adduser -D -u 1001 jp && \
    mkdir -p /home/jp/app && \
    chown -R jp:jp /home/jp

USER jp
WORKDIR /home/jp/app

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ENV NVM_DIR="/home/jp/.nvm"

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

RUN echo "export NVM_DIR=\"$NVM_DIR\"" >> ~/.bashrc && \
    echo "[ -s \"$NVM_DIR/nvm.sh\" ] && \. \"$NVM_DIR/nvm.sh\"" >> ~/.bashrc

RUN bash -c "source ~/.bashrc"

EXPOSE 5173

CMD ["sh", "-c", "while true; do sleep 30; done"]