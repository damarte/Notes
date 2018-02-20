# Git-Flow

## Initialize a Repository for git-flow
````bash
git flow init -d
````
(Omit `-d` if you want to select values other than the defaults.)

## Features

### Start a New Feature

This creates a new branch based on `develop` and switches to it:

````bash
git flow feature start FEATURENAME
````

### Publish a Feature

Push a feature branch to remote repository:

````bash
git flow feature publish FEATURENAME
````

Get a feature published by another user from remote repository:

````bash
git flow feature pull origin FEATURENAME
````

### Finish a Feature

This merges the feature into `develop`, removes the feature branch, and switches to `develop`:

````bash
git flow feature finish FEATURENAME
````

## Releases

### Start a Release

Create release branch from `develop`:

````bash
git flow release start RELEASENAME
````

Publish release branch:

````bash
git flow release publish RELEASENAME
````
   
Create a local tracking branch for a remote release:

````bash
git flow release track RELEASENAME
````

### Finish a Release

Merge release branch into `master`, tag it, merge back into `develop`, and remove the release branch:

````bash
git flow release finish RELEASENAME
git push --tags
````

## Hotfixes

### Start a Hotfix

Create hotfix branch from `master`:

````bash
git flow hotfix start VERSIONNAME
````

Create hotfix branch from some other commit:

````bash
git flow hotfix start VERSIONNAME BASENAME
````

### Finish a Hotfix

Merge hotfix back into develop and master, and tag:

````bash
git flow hotfix finish VERSIONNAME
````
