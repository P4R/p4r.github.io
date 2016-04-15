---
layout: project
title: Página Web
date:   2016-04-03 14:00:00
github_url: https://github.com/P4R/p4r.github.io
play_store_url:
published: true
---

### Página web personal con Jekyll en Gihub Pages.

<!--more-->

Este proyecto consiste en una página web personal y el resultado del proyecto ha sido esta misma web.
Desde el primer día se miraron varias opciones pero una de las más interesantes fue la de utilizar Github Pages
ya que nos ofrece un servicio gratuito y sus servidores son bastante rápidos, fiables.
Tras empezar a investigar sobre Gihub Pages me encontré con Jekyll una herramienta fantástica para generar paginas web
estáticas 

#### ¿Que es Gihub Pages?

Github Pages es un servicio ofrecido por Github que nos permite publicar paginas web estáticas a partir
de repositorios de git que tengamos en Gihub. Para esto tenemos dos tipos de paginas las de usuario de la cual
se dispone de una por usuario y las de proyecto o repositorio de las cuales podemos tener tantas como repositorios.

Para utilizar las paginas de usuario debemos crear un repositorio con nuestro nombre de usuario como subdominio
de github.io, en mi caso el nombre del repositorio es "p4r.github.io" y se podría acceder desde
[http://p4r.github.io][http://p4r.github.io]{:target="_blank"}. En el caso de las paginas de usuario se publicará
el contenido de las rama master.

Para utilizar las paginas de proyecto sera suficiente con crear un repositorio y crear la rama gh-pages que será la
que tendrá el contenido que se publicara. En este caso el contenido se publicara en la misma url mencionada
anteriormente pero añadiendo el repositorio "http://p4r.github.io/nombre_del_repositorio".


#### ¿Que es Jekyll?

[Jekyll][jekyll_url]{:target="_blank"} es un generador de sitios web estáticos creado por Tom Preston-Werner
co-fundador de GitHub. Se puede usar para generar cualquier tipo de sitio web incluyendo un blog.

Para ello Jekyll utiliza plantillas de código en las que luego se inserta el contenido. Para ello se utiliza:
Markdown, Liquid, HTML, CSS y JS.

#### La Página web

En un primer momento decidí empezar la web utilizando [Material Design Lite][mdl_url]{:target="_blank"} para crear una
plantilla con los patrones de diseño de Material Design. Tras unos días trabajando con la plantilla me encontré un proyecto
en Github que consistía en una plantilla con estos mismos patrones de diseño pero en este caso estaba utilizando Polymer así
que decidí utilizarla para ir aprendiendo poco a poco como funciona Polymer. En un primer momento hice un fork para solucionar
algún error que existía en el proyecto y luego ya aplique la plantilla a mi proyecto web donde la he traducido y la he ido personalizando. Para ello he eliminado algunas cosas que no necesitaba para agilizar la carga de la web, también he adaptado
los tamaños de algunas cosas y he modificado la estructura de la web creando una pagina principal para poder tener el blog
en otro apartado y crear el apartado de proyectos. 

Por último para agilizar la subida de contenido se han añadido los archivos de configuración de Travis para que cuando se haga
alguna modificación Travis suba automáticamente el código generado a la rama correspondiente de Github.

El código fuente del proyecto se puede encontrar en [Github][github]{:target="_blank"}.


[http://p4r.github.io]: http://p4r.github.io
[jekyll_url]: https://jekyllrb.com
[mdl_url]:https://www.getmdl.io
[github]: https://github.com/P4R/p4r.github.io