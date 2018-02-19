# Comandos básicos

## Mostrar los contenedores corriendo

````bash
docker ps
````

## Listar los contenedores locales

````bash
docker container ls
````

## Crear un contenedor

En este caso un servidor web nginx en el puerto 80.

````bash
docker run -d -p 80:80 --name webserver nginx
````

## Arrancar/parar un contenedor

````bash
docker container stop webserver
docker container start webserver
````

## Borrar un contenedor

````bash
docker container rm -f webserver
````

## Listar las imágenes disponibles localmente

````bash
docker image ls
````

## Eliminar una imagen localmente

````bash
docker image rm nginx
````

## Ver información de un contenedor

````bash
docker inspect
````

Ver log path de un contenedor

````bash
docker inspect --format='{{.LogPath}}' $INSTANCE_ID
````

Ver imagen de un contenedor

````bash
docker inspect --format='{{.Config.Image}}' $INSTANCE_ID
````

## Obtener información de red de un contenedor

Obtener IP:

````bash
docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $INSTANCE_ID
````

Obtener MAC:

````bash
docker inspect --format='{{range .NetworkSettings.Networks}}{{.MacAddress}}{{end}}' $INSTANCE_ID
````

Ver información de puertos:

````bash
docker inspect --format='{{range $p, $conf := .NetworkSettings.Ports}} {{$p}} -> {{(index $conf 0).HostPort}} {{end}}' $INSTANCE_ID
````

Buscar un puerto específico

````bash
docker inspect --format='{{(index (index .NetworkSettings.Ports "8787/tcp") 0).HostPort}}' $INSTANCE_ID
````
## Acciones variadas

### Kill all running containers.
alias dockerkillall='docker kill $(docker ps -q)'

# Delete all stopped containers.
alias dockercleanc='printf "\n>>> Deleting stopped containers\n\n" && docker rm $(docker ps -a -q)'

### Delete all untagged images.
alias dockercleani='printf "\n>>> Deleting untagged images\n\n" && docker rmi $(docker images -q -f dangling=true)'

### Delete all stopped containers and untagged images.
alias dockerclean='dockercleanc || true && dockercleani'

### Delete all
alias dockercleanup='dockerkillall || true && dockercleanc || true && dockercleani'