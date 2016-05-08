---
layout: post
title:  "Publicar web con Travis CI"
date:   2016-05-08 16:00:00
image: travis.png
tags:
    - Travis
    - Github
---

A los pocos días de poner la web en funcionamiento en Github Pages me di cuenta de que había que hacer algo para automatizar la publicación de contenido en la web. Tras analizar todas opciones decidí que Travis CI fuera el encargado de procesar todo el código y publicarlo la web.

<!--more--> 

El ejemplo que voy a usar es el de mi web, así que explicare como publico el código generado por Jekyll y el descargado
de componentes web como Polymer y otros ya que estos nunca están presentes en la rama que contiene el código del proyecto.

A continuación podéis ver de forma mas concreta el proyecto web y una ligera explicación de como funciona
Gihub Pages. [Ver proyecto web][personal_website]{:target="_blank"}

#### Requisitos:
 - Repositorio en Github con la web.
 - Cuenta en [Travis CI][travis_home]{:target="_blank"} (Se puede hacer login con la cuenta de Github)

### ¿Como funciona Travis CI?

Travis es un sistema de integración continua el cual nos permite realizar test sobre nuestro código de Github.
En nuestro caso ademas de comprobar que todo ha funcionado bien lo vamos a utilizar para publicar el
código generado en otra rama de nuestro repositorio.

Travis se activa con cada push que se hace a nuestro repositorio o también con los pull request aunque esta última
opción no la vamos a utilizar.

### Configuración Travis CI

En primer lugar debemos obtener un token de Github para poder hacer push desde Travis, el token lo podemos obtener
desde [aquí][github_tokens]{:target="_blank"}

A continuación accederemos a la web de Travis donde lo autorizaremos para acceder a nuestro repositorio.

<img src="/images/posts/travis-active-repo.jpg"/>

Una vez autorizado pasaremos configurar el repositorio en Travis mediante el botón de ajustes, deberemos
activar las opciones que aparecen en la siguiente imagen y añadiremos una variable de entorno llamada
GH_TOKEN donde pondremos el token obtenido en Github **(Importante marcar el token como oculto/privado
para que nadie lo pueda ver y utilizar)**.

<img src="/images/posts/travis-config-repo.jpg"/>

Una vez este todo configurado solo tenemos que añadir el fichero de Travis y el script que ejecutaremos en
nuestro repositorio de Github.

##### .travis.yml

Como se puede ver en este fichero especificaremos todo lo necesario para poder ejecutar nuestro código. En
mi caso simplemente necesitaré Node.js y Ruby. Además especificaré el script que se tendrá que ejecutar,
en este caso Travis actuara en todas las ramas que contengan este archivo pero podríamos limitar las ramas
en el archivo de configuración.

{% highlight yaml %}
language: node_js
node_js:
  - 0.12.2
before_install:
  - rvm install 2.2.2
script: bash ./deploy.sh
{% endhighlight %}

##### deploy.sh

Este script simplemente ejecutará todas las instrucciones necesarias para obtener el código de la
web y si todo va bien se configurará un usuario de git (Se puede modificar el email por el nuestro
de Github para que se asocie el commit a nuestra cuenta) que sera el encargado de subir los cambios
a la rama en la cual se publica la web que en este caso es master pero en otros podría ser gh-pages.

{% highlight bash %}
#!/bin/bash
set -e # exit with nonzero exit code if anything fails

gem install bundler
bundle install

# Add source from master branch
git clone https://github.com/P4R/p4r.github.io.git -b master dist

# Run commands to build the website in the dist folder
npm install -g gulp bower && npm install && bower install
gulp

# Go to the dist directory.
cd dist

# Inside this git repo we'll pretend to be a new user
git config user.name "Travis CI"
git config user.email "travis@travis-ci.org"

# Add changes and commit.
git add .
git commit -m "Deploy with Travis CI"

# Push from the current repo's master branch to the remote
# repo's master branch. We redirect any output to
# /dev/null to hide any sensitive credential data that might otherwise be exposed.
git push --quiet "https://${GH_TOKEN}@github.com/P4R/p4r.github.io.git" master > /dev/null 2>&1
{% endhighlight %}

Una vez todo configurado para comprobar que funciona simplemente tendremos que hacer push a nuestro
repositorio y desde la web de Travis podremos ver como se va ejecutando el código y si todo va bien
se publicará en la rama correspondiente.


[personal_website]: /projects/2016/04/03/personal-website/
[travis_home]: https://travis-ci.org/
[github_tokens]: https://github.com/settings/tokens
