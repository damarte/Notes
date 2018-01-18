# Virtualhost

## Habilitar un virtualhost

Utilizar el script [virtualhost.sh](https://gist.github.com/damarte/95f4a9b47eaa824c6c4e8206433cacf0)

De manera manual:

Crear la carpeta en `www`

````bash
mkdir <nombre-host>
mkdir httpdocs logs
````

Crear un archivo */etc/apache2/sites-available/<nombre-host>.conf* con el siguiente contenido (ejemplo basico)

````
<VirtualHost *:80>
        ServerAdmin <email>
        ServerName <nombre-host>
        ServerAlias <nombre-host>
        ServerAlias <nombre-host2>
        DocumentRoot /var/www/<nombre-host>/httpdocs
        <Directory />
                Options FollowSymLinks
                AllowOverride All
        </Directory>
        <Directory /var/www/<nombre-host>/httpdocs>
                Options Indexes FollowSymLinks MultiViews
                AllowOverride All
                Order allow,deny
                Allow from all
        </Directory>
        ErrorLog /var/www/<nombre-host>/logs/error.log
        LogLevel warn
        CustomLog /var/www/<nombre-host>/logs/access.log combined
</VirtualHost>
````
Habilitar el virtualhost recien creado

````bash
sudo a2ensite <nombre-host>
````