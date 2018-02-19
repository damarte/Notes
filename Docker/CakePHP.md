# CakePHP

## MySQL

Inicia un contendor MySQL.

````bash
docker run --name docker-mysql -v /my/path/mysql/datadir:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=mypassword -p 3308:3306 --restart always -d mysql
````

Inicia un contenedor con PHPMyAdmin.

````bash
docker run --name docker-phpmyadmin -d --link docker-mysql:db -p 8081:80 -d phpmyadmin/phpmyadmin
````

Para conectar desde Heidi, Workbench...

Dato | Valor
---- | -----
Host | 0.0.0.0
Port | 3308
User | root
Password | mypassword

[https://docs.docker.com/samples/library/mysql/]()

## Buenas prácticas

[https://docs.docker.com/develop/dev-best-practices]()