# MySQL

## Asegurar MySQL (interactivo)

````bash
sudo mysql_secure_installation
````

## Establecer el character set y collation por defecto

````
[mysqld]
skip-character-set-client-handshake
character_set_server=utf8mb4
collation_server=utf8mb4_spanish_ci
````

## Crear usuarios desde consola

Conectar

````bash
mysql -u <username> -p<password> -h <hostname or ip> <database name>
````

Ver los usuarios actuales

````sql
SELECT host, user, password FROM mysql.user;
````
> En versiones nuevas en lugar de password es authentication_string

Crear el usuario y darle permisos

````sql
CREATE USER '<username>'@'<host>' IDENTIFIED BY '<password>';
GRANT ALL PRIVILEGES ON *.* TO '<username>'@'<host>';
FLUSH PRIVILEGES;
````
> localhost puede sustituirse por cualquier ip o rango:  
> 192.168.1.%  
> 192.168.%  
> % (cualquier sitio)

Dar permisos

````sql
GRANT [ALL PRIVILEGES|CREATE|DROP|DELETE|INSERT|SELECT|UPDATE|GRANT OPTION] ON <database>.<table> TO '<username>'@'<host>';
````

Quitar permisos

````sql
REVOKE [ALL PRIVILEGES|CREATE|DROP|DELETE|INSERT|SELECT|UPDATE|GRANT OPTION] ON <database>.<table> FROM '<username>'@'<host>';
````

Eliminar usuario

````sql
DROP USER '<username>'@'<host>';
````

> Si da problemas comprobar que bind-address = 0.0.0.0 en el archivo /etc/mysql/mysql.conf.d/mysqld.cnf

## Problema con el GROUP BY

Cambiar el valor de la variable de mysql `sql_mode` para eliminar `ONLY_FULL_GROUP_BY`

Cambiar en el archivo */etc/mysql/my.cnf* y reiniciar el servicio

````
[mysqld]
sql_mode = STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION
````

