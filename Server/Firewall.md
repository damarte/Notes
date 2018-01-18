# Firewall de Ubuntu (UFW)

## Añadir una applicación

Crear un archivo en */etc/ufw/applications.d* con un contenido como este:

````
[appname]
title=1-liner here
description=a longer line here
ports=1,2,3,4,5,6,7,8,9,10,30/tcp|50/udp|53
````

Ejemplos de puertos:

````
ports=20202:20205/tcp
ports=10000:10002/tcp|10003/udp
ports=10000:10002/tcp|10003,10009/udp
````

````bash
sudo ufw app update <appname>
sudo ufw app info <appname>
sudo ufw allow from <host> to any app <appname>
sudo ufw allow <appname>
````

Por ejemplo `/etc/ufw/applications.d/mysql-server`

````
[MySQL]
title=MySQL Relational Database Server
description=MySQL is a Relational Database Server commonly used in a variety of ways including to host the database of websites
ports=3306/tcp
````

````bash
sudo ufw allow MySQL
````

Añadir o eliminar reglas (allow/deny) (Si no se especifica in/out se sobreentiende in)  
Sometimes it is desirable to let the sender know when traffic is being denied, rather than simply ignoring it. In these cases, use reject instead of deny.

````
sudo ufw allow 25
sudo ufw allow 25/tcp
sudo ufw allow out 3306/tcp
sudo ufw allow in 3306/tcp
sudo ufw allow ssh
sudo ufw allow in ssh
sudo ufw reject out ssh
sudo ufw deny proto tcp to any port 80
sudo ufw allow from 15.15.15.0/24 to any port 22
sudo ufw deny from 15.15.15.51
sudo ufw deny from 15.15.15.0/24
sudo ufw deny in on eth0 from 15.15.15.51
sudo ufw deny proto tcp from 10.0.0.0/8 to 192.168.0.1 port 25
sudo ufw allow in on eth0 to any port 80 proto tcp
````

````bash
sudo ufw limit ssh/tcp
````

ufw will deny connections if an IP address has attempted to initiate 6 or more connections in the last 30 seconds.

````bash
sudo ufw delete deny 80/tcp
````

````bash
sudo ufw status numbered
sudo ufw delete 3
````

Para loguear las conexiones

````bash
sudo ufw allow log 22/tcp
sudo ufw allow log-all
````
