# DB2

## Instalar soporte para DB2/AS400

### Instalación de funciones DB2 en PHP

Instalamos los paquetes necesarios de PHP:

```bash
apt install php php-dev php-gd php-pear
```

Descargamos DB2 Express de:

[https://github.com/angoca/db2-docker/wiki/db2-link-expc](https://github.com/angoca/db2-docker/wiki/db2-link-expc)

Descomprimimos el fichero:

```bash
tar -zxvf v11.1_linuxx64_expc.tar.gz
```

Entramos al directorio y ejecutamos la instalación:

```bash
cd expc
./db2_install
```
Tenemos que responder "sí" a los terminos y condiciones aunque ponga yes/no.

Respondemos también "sí" a instalar en el directorio predeterminado.

Instalamos los drivers DB2 con pecl:

```bash
pecl install ibm_db2
```

Indicamos el directorio de instalación de DB2: 

```
/opt/ibm/db2/V11.1/
```

Añadimos al php.ini:

```
extension=ibm_db2.so
```

### Instalación de ODBC para iSeries Access

Instalar el paquete ODBC para PHP:

```bash
apt install php-odbc
```

Instalamos algunos paquetes necesarios:

```bash
apt install odbcinst1debian2 odbcinst libodbc1
```

Instalamos unixODBC:

```bash
apt install unixodbc
```

Descargar el driver de un FTP extraño ya que descargarlo desde la web de IBM es imposible al necesitar un consumer key:

[ftp://95.97.93.32/pub/V7R2M0/OS-Install/x86_64/ibm-iaccess-1.1.0.3-1.0.amd64.deb](ftp://95.97.93.32/pub/V7R2M0/OS-Install/x86_64/ibm-iaccess-1.1.0.3-1.0.amd64.deb)

Lo instalamos:

```bash
dpkg -i ibm-iaccess-1.1.0.3-1.0.amd64.deb
```

Ahora vamos a regitrar el driver de ODBC.

Primero identificamos las rutas de los archivos de configuración del ODBC

```bash
odbcinst -j
unixODBC 2.3.2
DRIVERS............: /usr/local/etc/odbcinst.ini
SYSTEM DATA SOURCES: /usr/local/etc/odbc.ini
FILE DATA SOURCES..: /usr/local/etc/ODBCDataSources
USER DATA SOURCES..: /home/alberto/.odbc.ini
SQLULEN Size.......: 8
SQLLEN Size........: 8
SQLSETPOSIROW Size.: 8
```

Registramos el driver ODBC de IBM:

```bash
odbcinst -i -d -f /opt/ibm/iSeriesAccess/unixodbcregistration
```

Ahora tenemos que añadir la ruta de las librerías del iSeriesAccess al path y recargar el cache de liberías. Para ello ejecutamos lo siguiente:

```bash
echo "/opt/ibm/iSeriesAccess/lib64/" > /etc/ld.so.conf.d/iSeriesAccess.conf
ldconfig
```

Enlaces:
[https://www.albertopicado.es/conexion-odbc-con-base-de-datos-db2-en-un-servidor-ibm-iseries/](https://www.albertopicado.es/conexion-odbc-con-base-de-datos-db2-en-un-servidor-ibm-iseries/)

