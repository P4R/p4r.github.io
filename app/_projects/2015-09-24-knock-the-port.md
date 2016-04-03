---
layout: project
title: Knock the Port
date:   2015-09-24 9:00:00
github_url: https://github.com/P4R/knocktheport
play_store_url: https://play.google.com/store/apps/details?id=com.albujer.pere.knocktheport
---

### Cliente de Port Knocking para Android.

<!--more-->

#### Que es el Port Knocking?

El Port Knocking  es un mecanismo para abrir puertos externamente en un firewall mediante una secuencia
preestablecida de intentos de conexión a puertos que se encuentran cerrados. Una vez que el firewall recibe
una secuencia de conexión correcta, sus reglas son modificadas para permitir al host que realizó los intentos
conectarse a un puerto específico.

El propósito principal del golpeo de puertos es prevenir un escaneo de puertos por parte de un atacante que busca
posibles servicios vulnerables. Como los mismos solo se abren ante un golpeo de puertos correcto. Normalmente los
puertos donde se brindan los servicios se muestran aparentemente cerrados.

Por lo general este mecanismo se implementa configurando un servicio para que revise el log del firewall para
detectar esta secuencia de intentos de conexión.

#### La aplicación

La aplicación Knock the Port esta realizada en Android utilizando Java y el IDE Android Studio.
Esta aplicación se ha desarrollado para permitir enviar secuencias de port knocking a un servidor
de forma rápida y sencilla ya que en la actualidad es bastante frecuente utilizar los dispositivos móviles
para todo.

Como características de la aplicación cabe destacar que se han seguido las guías de diseño de Material Design,
se ha traducido a varios idiomas para facilitar el uso al usuario y se ha utilizado un nivel de API bastante
pequeño para permitir la compatibilidad con la mayoría de dispositivos Android ya que solo se requiere la versión
4.0 o superior para poder instalar la aplicación.

La aplicación se puede descargar en el [Play Store][play-store]{:target="_blank"} y el código fuente del proyecto
se encuentra en [Github][github]{:target="_blank"}

[play-store]: https://play.google.com/store/apps/details?id=com.albujer.pere.knocktheport
[github]: https://github.com/P4R/knocktheport