# SSH

## Acceso remoto por SSH solo con key

Añadir la clave publica al archivo *~/.ssh/authorized_keys*
````
ssh-rsa <clave> imported-openssh-key
````
> Tiene que estar en una sola linea y lo del final es un comentario.

````bash
cat ~/.ssh/id_rsa.pub | ssh <username>@<host> "mkdir ~/.ssh; cat >> ~/.ssh/authorized_keys"
````

Desactivamos el pedir contraseña al hacer sudo

````bash
visudo
````

> Como root

Añadimos la linea

````
<username> ALL=(ALL) NOPASSWD: ALL
````

Cuando varias entradas son aplicables se usa la ultima, que puede no ser la más especifica (puede haber un %sudo... detrás y pisar el del usuario)
Asegurarnos de que la linea `# Defaults requiretty` esta comentada

Cambiamos la contraseña de root

````bash
sudo passwd
````

Desactivamos el acceso remoto con contraseña en */etc/ssh/sshd_config*

````
PasswordAuthentication no
````

No permitir que root entre con contraseña, solo clave privada

````
PermitRootLogin prohibit-password
````

Guardamos y reiniciamos ssh
````bash
sudo systemctl restart ssh
````
