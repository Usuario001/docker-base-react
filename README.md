# Dockerized React App

Este proyecto es para crear una Imagen de Docker que permita tener instalado lo necesario para iniciar un proyecto con React dockerizando los servicios por contenedores para facilitar el despliegue y desarrollo en entornos consistentes. 

## Requisitos previos

- Docker
- Docker Compose (opcional)

## Estructura del proyecto

Repo/
├── Dockerfile
├── conf
└── README.md

## Bases

Contiene node:22-alpine como base y un usuario para desarrollo web y expone el puerto default de vite 5173 además ejecuta en segundo plano para no cerrarse el contenedor.

### Licencia

Este proyecto está bajo la licencia MIT. Consulta el archivo [LICENSE](LICENSE) para más detalles.