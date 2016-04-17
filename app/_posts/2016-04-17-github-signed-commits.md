---
layout: post
title:  "Commits verificados en Github"
date:   2016-04-17 21:00:00
tags:
    - Gihub
---

Hace unos días apareció la opción de los commits verificados en Github, para utilizar esta opción 
simplemente hay que firmar los commits con GPG.

<!--more-->

Para configurar esta característica en Linux y OSX debemos seguir los siguientes pasos:

- Lo primero que tenemos que hacer es comprobar si ya tenemos una llave de GPG en nuestro PC.
Para ello utilizaremos el siguiente comando.
{% highlight shell %}
$ gpg --list-keys
{% endhighlight %}

- En caso de no tener ninguna llave podremos generar una con el siguiente comando.
    - Es importante que al generar la llave introduzcamos el email que usemos en Github.
{% highlight shell %}
$ gpg --gen-key
{% endhighlight %}

- Una vez generada la llave podremos consultarla con el comando anterior.
{% highlight shell %}
$ gpg --list-keys
/Users/hubot/.gnupg/pubring.gpg
------------------------------------
pub   4096R/A8F99211 2016-04-05
uid                  Hubot 
sub   4096R/Z832QR89 2016-04-05
{% endhighlight %}

- Tras en anterior comando obtendremos el ID de la llave en este caso **`A8F99211`**. Ahora exportaremos
la llave en formato ASCII armor con el siguiente comando.
{% highlight shell %}
$ gpg --armor --export A8F99211
{% endhighlight %}

- Una vez exportada la llave la podremos copiar y añadir a nuestra cuenta de Github. Para ello hay que ir
a la [Configuración de llaves de Github][github-gpg-setings]{:target="_blank"} y pulsaremos el botón
**New GPG Key** el cual nos permitirá pegar la llave y añadirla.

- Finalmente nos faltaría añadir la llave a nuestra configuración local de git utilizando el ID anterior
(**`A8F99211`**). Para ello utilizaremos el siguiente comando.
{% highlight shell %}
$ git config --global user.signingkey public GPG key A8F99211
{% endhighlight %}

Ahora ya podemos realizar commits firmados con el siguiente comando.
{% highlight shell %}
git commit -S -m "Mensaje commit"
{% endhighlight %}

Una vez hagamos push de estos commits ya deberíamos verlos como verificados.

<img src="/images/posts/signed-commit.png"/>


[github-gpg-setings]: https://github.com/settings/keys
