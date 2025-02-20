FROM ubuntu

ARG NODE_VERSION=v23.6.0

RUN apt-get update
RUN echo "y" | apt-get install curl

RUN apt-get install -y sudo && \
    mkdir -p /home/jp/app && \
    useradd -ms /bin/bash jp && \
    chown -R jp:jp /home/jp

USER jp
WORKDIR /home/jp/app

RUN mkdir -p /home/jp/.nvm
ENV NVM_DIR="/home/jp/.nvm"

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
RUN /bin/bash -c "source ${NVM_DIR}/nvm.sh && nvm install ${NODE_VERSION} && nvm use --delete-prefix $NODE_VERSION"

ENV NODE_PATH=${NVM_DIR}/versions/node/${NODE_VERSION}/bin
ENV PATH=$NODE_PATH:$PATH

RUN echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.bashrc && \
    echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> ~/.bashrc

EXPOSE 5173

CMD ["sh", "-c", "while true; do sleep 30; done"]