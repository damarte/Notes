# Administración

## Sincronizar horario del servidor

Servicio para sincronizar la hora del servidor:

```bash
sudo apt install ntp

sudo service ntp stop  #sudo systemctl stop ntp
sudo ntpd -gq
sudo service ntp start  #sudo systemctl start ntp
```

Para cambiar la zona horaria:

```bash
sudo dpkg-reconfigure tzdata
```
## Recordar passphrase de claves privadas

```bash
eval `ssh-agent`
ssh-add /home/test/.ssh/id_rsa #Añade una clave
ssh-add #Añade todas
```

## Cambiar fecha de ficheros en consola

Fecha actual

````bash
touch <filename>
````

Fecha Especificada

````bash
touch -d "YYYY-MM-dd HH:mm:ss" <filename>
````

Le pone al segundo las mismas fechas que al primero

````bash
touch -r <sample_file> <file>
````

## Mensaje de bienvenida al hacer login por SSH

Poner el Mensaje o imagen ASCII en */etc/banner* (por ejemplo)

````bash
sudo nano /etc/ssh/sshd_config
````

Descomentar la siguiente linea y configurar la ruta al archivo con el mensaje

````
Banner /etc/banner
````

````bash
sudo systemctl restart sshd
````

## Establecer la zona horaria del servidor

````bash
sudo timedatectl set-timezone Etc/UTC
````

Para poder elegir:

````bash
sudo dpkg-reconfigure tzdata
````

## Evitar problema con el nombre del servidor

Se puede ver el error ejecutando

````bash
sudo apache2ctl configtest
````

````
AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 127.0.1.1. Set the 'ServerName' directive globally to suppress this message
Syntax OK
````

````bash
sudo nano /etc/apache2/apache2.conf
````

Añadir

````
ServerName <servername_or_ip>
````

## Listar todos los paquetes instalados

Ubuntu:

````bash
sudo aptitude search "?installed"
sudo apt list --installed
````

CentOS:

````bash
yum list installed
````

## Limpiar cache APC

````bash
sudo service apache2 graceful
````

````bash
sudo apache2ctl -k graceful
````

## Diagnostico ssl en un dominio

````bash
/usr/bin/nscurl --ats-diagnostics <domain_name>
````

## Añadir fecha y hora al historial de bash

Añadir la siguiente linea en el archivo de configuración del bash (se configura por usuario) *~/.bashrc*

````
HISTTIMEFORMAT="%d/%m/%y %T "
````

Reiniciar el servidor

## Busqueda recursiva en archivos

Para buscar un texto de manera recursiva en todos los archivos de un determinado directorio:

````bash
grep -rni <search_string> /path/to/search
````

> i: case insensitive  
> r: recursiva (todos los subdirectorios a partir del especificado)  
> n: muestra el numero de la linea en la que aparece el texto buscado

## Renombrado masivo

````bash
rename <search_string> <replace_string> <files>
````

## Listar los archivos modificados en los ultimos minutos/días

Modificados en los últimos días:

````bash
find . -type f -mtime -<days> -exec ls -lah {} \;
````

Modificados en los últimos minutos:

````bash
find . -type f -mmin -<minutes> -exec ls -lah {} \;
````

## Eliminar archivos modificados entre dos fechas

````bash
find . -maxdepth 1 -type f -newermt <start_date> ! -newermt <finish_date> -delete
````

## Instalar Composer

````bash
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
````

## ffmpeg cut

````bash
ffmpeg -ss <start> -i <input>.mp4 -t <duration> -c copy <output>.mp4
````

> Formato HH:ii:ss o en segundos totales

## Comprobar el mime type de un archivo

````bash
file --mime-type -b <file>
````

## Comprobar si el sistema necesita reiniciarse

Verificar la existencia del archivo `/var/run/reboot-required`

## Comprobación de sintaxis php de varios archivos

Comprueba la sintaxis de todos los archivos que haya en la carpeta donde se ejecute.

````bash
for i in *.php; do php -l $i; done
````

## Reemplazar una cadena en varios archivos

````bash
grep -l <search_string> *.css | xargs sed -i 's/<search_string>/<replace_string>/g'
````