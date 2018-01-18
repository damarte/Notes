# Ejemplos

## Comprobar los últimos cambios realizados sobre un archivo
````bash
git log -p [--follow] [-1] <path>
````
> --follow: por si ha habido cambios en el nombre del archivo  
> -1: numero de commits a retroceder a la hora de mostrar cambios

## Comprobar la rama padre de la actual

​Si queremos saber de que rama ha salido otra rama:
​
````bash
git reflog show --no-abbrev <branch_name>
````

Esto nos mostrará un listado de todos los cambios hechos en la rama incluida su creación.

````
laiw4u5y0948arhp4f890a4p8fhjap48a422fj0anop4 NOMBRE_DE_LA_RAMA@{1}: branch: Created from HEAD
````

Las entradas se eliminan a los 90 días por defecto, así que si eso no se cambia y ha pasado más tiempo no nos servirá.

## Crear rama local a partir de rama remota

````bash
git checkout -b <local_branch> origin/<remote_branch>
````

## Refrescar las ramas remotas

````bash
git remote update origin --prune
````

## Refrescar el gitignore

Después de editar el archivo .gitignore ejecutar lo siguiente para que los cambios tengan efecto

````bash
git rm -r --cached .
git add .
git commit -m "nueva version del .gitignore"
````

## Ejemplos básicos

Push de la rama actual

```bash
git push origin $rama_actual
```

Volver a un commit anterior, descartando los cambios

```bash
git reset --HARD $SHA1
```

Ver y descargar Ramas remotas

```bash
git remote show origin
```

Si hay alguna rama de la cual no tengamos los datos aún

```bash
git fetch origin
```

Obtener la rama remota

```bash
git checkout --track -b $rama origin/$rama
```

más simple

```bash
git checkout -t origin/$rama
git branch -a
```

Crear una rama basada en el HEAD

```bash
git branch $branch
```

Crear una nueva rama basada en el branch $other

```bash
git checkout -b $new_branch $other
```

Eliminar una rama local

```bash
git branch -d $branch
```

Eliminar una rama remota

```bash
git push origin :$branch
```

Eliminar las ramas remotas que ya no existan en origin (Ambos comandos hacen lo mismo)
Ejecutar con --dry-run para ver los cambios que realizará

```bash
git fetch -p
```

```bash
git remote prune origin
```

Refrescar las ramas remotas

```bash
git remote update origin --prune
```

Cambiar el nombre de una rama

```bash
git branch -m $nombre_rama_anterior $nombre_rama_nuevo
```

Ignorar el salto de línea en Git http://help.github.com/line-endings/

```bash
git config --global core.autocrlf input
```

Copiar un commit determinado a una rama cualquiera

```bash
git checkout $rama
git cherry-pick $SHA1
```

#### Trabajando con tags
Ver los tags locales

```bash
git tag
```

Añadir un tag

```bash
git tag -a v1.2 $SHA1
```

Subir tags al repositorio

```bash
git push --tags
```

Deshacer el último commit (sin haber hecho push)

```bash
git reset --soft HEAD~1
```

Deshacer el último commit (habiendo hecho ya un push)

```bash
git revert HEAD
```

Subir a la rama Commits parciales (los ficheros que no añado se quedan en el stash y se recuperan luego)

```bash
git add $file
git commit -m "Mensaje"
git stash
git pull --rebase origin $rama
git push origin rama
git stash pop
```

List commits not pushed to the origin yet

```bash
git log origin/master..master
```

List remote branches that contain $commit

```bash
git branch -r --contains $commit
```

Reescribiendo la "historia"

* Deshacer commits
* Unir commits
* Reordenar commits

```bash
git rebase -i HEAD~10 # Esto mira los 10 últimos
```

Y veremos algo como esto:

```bash
pick ce2b738 Commit message 1
pick 2a3cdf7 Commit message 2
```

Y podremos realizar las siguientes operaciones sobre los commits inlcuyendo reordenar los commits

* p, pick = use commit
* r, reword = use commit, but edit the commit message
* e, edit = use commit, but stop for amending
* s, squash = use commit, but meld into previous commit
* f, fixup = like "squash", but discard this commit's log message
* x, exec = run command (the rest of the line) using shell
* Establecer la fecha de los commits anterior al rebase => git committer date = git author date

```bash
git filter-branch --env-filter 'GIT_COMMITTER_DATE=$GIT_AUTHOR_DATE; export GIT_COMMITTER_DATE' <sha1>..HEAD
```