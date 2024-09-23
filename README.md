# Construcción de proyecto y contenedor para servicio comunitario de biblioteca central

## Construccion de Imagen

```
$docker build -t dgazcon/dspace-ubuntu:24.04 .
```
## Correr imagen en modo terminal interactivo

```
$docker run -it dgazcon/dspace-ubuntu:24.04 bash 
```

## Correr base de datos postgresql

```
docker run -it --name dspace-db-crypt -e POSTGRES_PASSWORD=123456 -p 5432:5432 dspace/dspace-postgres-pgcrypto:dspace-7.6
```