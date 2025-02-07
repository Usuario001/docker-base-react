# Usar la imagen oficial de Node.js con Alpine como base
FROM node:22-alpine

# Configurar el mantenedor de la imagen
LABEL maintainer="JP"

# Agregar un usuario no root
RUN adduser -D -u 1001 jp && \
    mkdir -p /home/jp/app && \
    chown -R jp:jp /home/jp

# Cambiar al usuario jp
USER jp
WORKDIR /home/jp/app

# Exponer el puerto por defecto de Vite
EXPOSE 5173

# Mantener el contenedor en ejecución
CMD ["sh", "-c", "while true; do sleep 30; done"]
