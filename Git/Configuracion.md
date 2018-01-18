# Configuración

## Configuraciones globales por defecto

````bash
git config --global user.name "Nombre Apellido"
git config --global user.email correo@ejemplo.es
git config --global push.default simple
````

En el archivo *~/.gitconfig*

````
[user]
        name = Nombre
        email = correo@ejemplo.es
[push]
        default = simple
[alias]
    lg = !"git lg1"
    lg1 = !"git lg1-specific --all"
    lg2 = !"git lg2-specific --all"
    lg3 = !"git lg3-specific --all"

    lg1-specific = log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)'
    lg2-specific = log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(auto)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)'
    lg3-specific = log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset) %C(bold cyan)(committed: %cD)%C(reset) %C(auto)%d%C(reset)%n''          %C(white)%s%C(reset)%n''          %C(dim white)- %an <%ae> %C(reset) %C(dim white)(committer: %cn <%ce>)%C(reset)'
````

## Crear un nuevo proyecto en el servidor git


Para crear un repositorio para un proyecto nuevo:

````bash
mkdir <path>/<project_name>.git
cd <path>/<project_name>.git
git --bare init
cd ..
chmod -R 777 <project_name>.git
````

Para conectar a un proyecto ssh://<user>@<host>/~/<path>/<project_name>.git

Lo ideal seria añadir las claves publicas de los usuarios que deban poder clonar los proyectos y acceder con la clave privada

Asegurarse de que git-shell esta añadida en /etc/shells y asignarsela como shell por defecto al usuario para evitar que tenga acceso por ssh a la consola mas allá de los comandos de git

````bash
sudo chsh git
````
Pide introducir la ruta completa, por norma general */usr/bin/git-shell*

Se puede personalizar el mensaje de error al intentar acceder por ssh o los comandos disponibles

````bash
git help shell
````

## Clonar un repositorio

````bash
git clone ssh://<user>@<host>/path/to/<project_name>.git .
````

## Clonar una rama remota en local
````bash
git checkout -b <local_branch> origin/<remote_branch>
````

## Crear una rama local y pushearla a remoto
````bash
git checkout -b <branch>
git push -u origin <branch>
````

