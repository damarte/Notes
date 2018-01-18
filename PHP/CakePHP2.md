# CakePHP 2.x

## Migraciones

Para hacer cambios en la bbdd:

- Realizar cambios en la bbdd.
- Una vez realizados ejecutar:

````bash
backend/Console/cake schema generate -f
````

- Elegir la opción overwrite.
- Subir los cambios a git.

Para actualizar la BD despues de hacer pull de esos cambios:  
Crear las tablas que falten

````bash
backend/Console/cake schema create
````

Actualizar las tablas existentes

````bash
backend/Console/cake schema update
````

## Traducciones

- Ejecutar el script `locale.sh` para añadir al archivo .po las nuevas cadenas que se hayan añadido:

````
  bash tools/locale.sh
````

- Descargar el archivo .po situado en *Locale/es_ES/LC_MESSAGES/default.po* (o el del idioma que corresponda)
- Editar el archivo para añadir/modificar las traducciones.
- Sustituir el archivo original por el que acabamos de editar
- Borrar arriba cualquier archivo .mo que haya (dejar unicamente el default.po)
- Recargar apache:

````bash
sudo service apache2 reload
````

````bash
sudo apache2ctl -k graceful
````

## Multiple checkboxes en CakePHP
Cuando se desea implementar un formulario en el que una pregunta dispone de múltiples opciones que son checkboxes. La forma a seguir utilizando las funciones de CakePHP es la siguiente:

```php
echo $this->Form ->input( 'Modelo.pregunta', array(
	'label' => __('Pregunta'),
	'type' => 'select',
	'multiple' => 'checkbox',
	'options' => $options
));

