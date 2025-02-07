FROM node:22-alpine

LABEL maintainer="usuario001"

RUN adduser -D -u 1001 jp && \
    mkdir -p /home/jp/app && \
    chown -R jp:jp /home/jp

USER jp
WORKDIR /home/jp/app

EXPOSE 5173

CMD ["sh", "-c", "while true; do sleep 30; done"]
