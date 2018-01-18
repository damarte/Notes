# Buenas prácticas con GIT

Una manera de trabajar con GIT, es establecer un patrón de trabajo a nivel de empresa, a seguir por todos, aunque es aplicable a cualquier otro control de versiones.

Estableceremos 2 ramas principales que estarán en remoto:

* master para producción
* develop para desarrollo

La rama master es la rama principal que es la que se pone en producción. Esta rama es la que tiene LA ÚLTIMA VERSIÓN ESTABLE.

Cuando la rama develop es lo suficiente estable, se puede mezclar con la rama master.
Es política de la empresa determinar quien / como / porque, es el responsable último de determinar cuando la rama develop pasa a master, ocasionando con ello un cambio de versión en la master.
La rama master tiene que tener los tags de versionado.

Establecer un sistema a seguir de número, como por ejemplo ubuntu, año/mes, 10.04, 10.10, etc., o por fecha , etc..

Se desarrolla en la rama develop , y cuando se llega a un versión estable, fusionamos con la master y producimos una nueva versión.

Establecer ramas de apoyo , pero limitadas en el tiempo, como por ejemplo:

* Ramas de características (features)
* Ramas de revisiones (hotfixes)

Cada una de estas ramas tiene un propósito específico están sujetas a estrictas normas. Podemos crear más ramas de apoyo, pero en mi caso, no me ha sido necesario.

## Ramas features. Rama padre: DEVELOP Merge con: DEVELOP

Estas ramas se utilizan para desarrollar nuevas características para una nueva versión.

La esencia de una rama de la característica es que existe, siempre y cuando la función está en desarrollo, pero finalmente se fusiona de nuevo en develop.

Se ramifican a partir de develop y se combinan de nuevo en develop. Las ramas de características no existen en origin.

Como tenemos que proceder:

```bash
git checkout -b feature_notes develop
```

Esto nos crea una rama feature_notes y nos coloca directo para trabajar en ella. Es lo mismo que hacer desde la rama develop:

```bash
git branch feature_notes
git checkout feature_notes
```

Implementaremos las mejoras correspondientes en nuestro código.

En este apartado , podemos considerar necesario hacer un git rebase -i, donde podemos definir que historia de cambios vamos a mostrar en la rama develop.

Es decir, si hemos realizado 12 commits en la rama feature_notes, no quiero que se muestre ese a la hora de fusionar, podemos agrupar todos esos commits en uno solo, mostrando la historia como un solo commit.

Incorporación de una nueva característica en develop:

```bash
git checkout develop

Switched to branch 'develop'
```

```bash
git merge --no-ff feature_notes

Updating ea1b82a..05e9557 (Summary of changes)
```

Con esto conseguimos que se cree un nuevo objeto, guarde en el log donde empieza y termina la feature, para que seguir la historia sea más rápido.

Ahora la rama feature_notes, no nos sirve para nada, la borramos.

```bash
git branch -d feature_notes
Deleted branch myfeature (was 05e9557).
```

Subimos nuestros cambios ya fusionados al origin.

```bash
git push origin develop
```

## Ramas hotfixes PADRE:Master Merge con: Master y Develop

Se ramifican a partir de master y se deben combinar de nuevo en develop y master. La nomenclatura debe ser hotfix.

Si un bug es crítico debe ser resuelto inmediatamente.

La esencia de este método de trabajo es que los miembros del equipo (rama develop) pueden seguir trabajando mientras que otra persona soluciona el bug.

Como tenemos que proceder:

Creación de una rama hotfix

Las ramas de revisión se crean a partir de la rama master.

Veámoslo con un ejemplo, digamos que estamos en la versión de producción 1.2 y esta hay un bug bastante grave. Supongamos que los cambios en develop son todavía bastante inestable.

A continuación vamos a bifurcar la rama master para arreglar el problema.

```bash
git checkout -b hotfix-1.2.1 master
Switched to a new branch "hotfix-1.2.1"
```

Corregimos el error en el código.

```bash
git commit -a -m "Bumped version number to 1.2.1"
[hotfix-1.2.1 41e61bb] Bumped version number to 1.2.1
1 files changed, 1 insertions(+), 1 deletions(-)
```

No hay que olvidarse de modificar el número de versión después de la ramificación.

Después, arreglar el fallo y confirmar la corrección con uno o mas commits separados.

```bash
git commit -m "Fixed severe production problem"
[hotfix-1.2.1 abbe5d6] Fixed severe production problem
5 files changed, 32 insertions(+), 17 deletions(-)
```

Terminar una rama de hotfix.
MERGE CON: master y develop

En primer lugar actualizamos master para marcar la liberación.
Nos posicionamos en la rama master:

```bash
git checkout master
Switched to branch 'master'
```

Después, fusionamos la rama que hemos creado de hotfix-1.2.1 con la master, pero recordad, con la opción --no-ff

```bash
git merge --no-ff hotfix-1.2.1
Merge made by recursive.
(Summary of changes)
```

A continuación, y muy importante, es tagear esa versión corregida:

```bash
git tag -a 1.2.1
```

Después incluimos este “parche” también en develop:

```bash
git checkout develop
Switched to branch 'develop'
```

```bash
git merge --no-ff hotfix-1.2.1
Merge made by recursive.
(Summary of changes)
```

Por último matamos la rama temporal, pues no servirá para nada.

```bash
git branch -d hotfix-1.2.1
Deleted branch hotfix-1.2.1 (was abbe5d6).
```

Estas ideas han sido sacadas básicamente de:
[http://nvie.com/posts/a-successful-git-branching-model/](http://nvie.com/posts/a-successful-git-branching-model/)