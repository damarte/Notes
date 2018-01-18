# Samba

## Añadir usuario:
````bash
smbpasswd -a <usuario>
````
Introducir contraseña y confirmar

## Cambiar permisos de carpeta

````bash
sudo chown -R <usuario>:<usuario> /path/to/folder
````

## Configuracion de /etc/samba/smb.conf

````
interfaces = 127.0.0.0/8 eth0

bind interfaces only = yes

hosts allow = 127.0.0.1, 192.168.14.102
hosts deny = 0.0.0.0/0
security = user
encrypt passwords = true
map to guest = bad user
guest account = nobody
````

Comentar [printers] y [print$] y añadir el recurso/s de la siguiente forma (Siendo "private" el nombre que queramos darle al recurso.)

````
[private]
comment = nombre o comentario para identificar el recurso (sin comillas)
path = /path/to/shared/folder
available = yes
valid users = <usuario>
guest ok = no
browsable = yes
writable = yes
read only = no
create mask = 0775
directory mask = 0775
````

