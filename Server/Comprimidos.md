# Comprimir y descomprimir

## Ficheros .tar (paquete tar)  

tar empaqueta varios archivos en uno solo, pero no comprime.  
Empaquetar:

````bash
tar cf <filename>.tar <files>
````

Desempaquetar:

````bash
tar -xvf <filename>.tar
````

Ver contenido:

````bash
tar -tf <filename>.tar
````

## Ficheros .gz (paquete gzip)  

gzip sólo comprime fichero a fichero, no empaqueta varios ficheros en uno ni comprime directorios.

Comprimir:

````bash
gzip <file>
````

Descomprimir:

````bash
gzip -d <filename>.gz
````

## Ficheros .bz2 (paquete bzip2) 
 
bzip2 sólo comprime fichero a fichero, no empaqueta varios ficheros en uno ni comprime directorios.

Comprimir:

````bash
bzip2 <file>
````

Descomprimir:

````bash
bzip2 -d <filename>.bz2
````

Para comprimir varios ficheros y archivarlos en uno solo, al estilo de los compresores zip o rar hay que combinar tar con gzip o con bzip2 de la siguiente forma:

## Ficheros .tar.gz

Comprimir:

````bash
tar -czf <filename>.tar.gz <files>
````

Descomprimir:

````bash
tar -xvzf <filename>.tar.gz
````

Ver contenido:

````bash
tar -tzf <filename>.tar.gz
````

## Ficheros .tar.bz2
 
Comprimir:

````bash
tar -c <files> | bzip2 > <filename>.tar.bz2
````

Descomprimir:

````bash
bzip2 -dc <filename>.tar.bz2 | tar -xv
````

Ver contenido:

````bash
bzip2 -dc <filename>.tar.bz2 | tar -t
````

## Ficheros .zip (paquetes zip y unzip)
 
Comprimir:

````bash
zip <filename>.zip <files>
````
Descomprimir:

````bash
unzip <filename>.zip
````
Ver contenido:

````bash
unzip -v <filename>.zip
````

## Ficheros .rar (paquete rar)
 
Comprimir

````bash
rar a <filename>.rar <files>
````

Descomprimir

````bash
rar x <filename>.rar
````

Ver contenido

````bash
rar l <filename>.rar
````

o

````bash
rar v <filename>.rar
````

## Ficheros .lha (paquete lha)  

Comprimir

````bash
lha a <filename>.lha <files>
````

Descomprimir

````bash
lha x <filename>.lha
````

Ver contenido

````bash
lha v <filename>.lha
````

o

````bash
lha l <filename>.lha
````

## Ficheros .arj (paquetes arj y unarj)  

Comprimir

````bash
arj a <filename>.arj <files>
````

Descomprimir

````bash
unarj <filename>.arj
````

o

````bash
arj x <filename>.arj
````

Ver contenido

````bash
arj v <filename>.arj
````

o

````bash
arj l <filename>.arj
````

## Ficheros .zoo (paquete zoo)

Comprimir

````bash
zoo a <filename>.zoo <files>
````

Descomprimir

````bash
zoo x <filename>.zoo
````

Ver contenido

````bash
zoo L <filename>.zoo
````

o

````bash
zoo v <filename>.zoo
````