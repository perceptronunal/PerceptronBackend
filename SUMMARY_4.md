![](https://i.ibb.co/QfsYfkB/Happy-Pets.jpg)

# PetsHappy

Está es una aplicación donde las personas podrán participar activamente con el propósito de mejorar la calidad de vida de las mascotas, en especial de aquellas que se encuentran en estado de riesgo, a través de un medio por el cual podrán realizar adopciones, donaciones, gestión de animales perdidos o encontrados mediante una red de búsqueda y de apoyo entre la ciudadanía. También tendrá una sección donde se podrán consultar eventos, participación en voluntariados, noticias, sugerencias entre otras actividades.
  
## Iteración 4

**Objetivos por realizar:**
**1.** Terminar TODAS las tareas de la iteración anterior. Si no estan completas no se revisará el trabajo de esta iteración.
**2.** Implementar los queries necesarios para generar diferentes estadisticas. Dichas estadisticas deben poder verse en un PDF (graficas etc) .
**3.** Crear los queries necesarios para hacer filtros dentro de su aplicacion, mas especificamente para las estadisticas.

**Actividades realizadas por cada uno:**
* Jonathan Rivera: Despliegue de la aplicación a Heroku.
* Luis Rodríguez: Implementación de estadisticas basado en los queries realizados en la anterior iteración.
* Cristian Aguilera: Implementación de mailers y nuevos queries añadidos.
* Rafael Cruz: Terminación de la subida de archivos usando AWS Active Storage y adición de nueva tabla Profilepictures para almacenar las fotos de perfil de usuario u organización.


## Instalación

1. Clonar el repositorio

```bash

$ git clone [https://github.com/perceptronunal/PerceptronBackend.git](https://github.com/perceptronunal/PerceptronBackend.git)

```

2. Instalación de gemas de **Rails**

```bash

$ bundle install

```

3. Creación de la base de datos

```bash

$ rails db:create

```

4. Iniciar migraciones

```bash

$ rails db:migrate

```

5. Llenado de la base con datos con **faker**

```bash

$ rails db:setup

```

## Configuración


**1.** Instalación de ruby
[https://www.ruby-lang.org/es/documentation/installation/](https://www.ruby-lang.org/es/documentation/installation/)

**2.** Verificar version de ruby
```bash
ruby --version
```

**3.** Instalación de rails

[https://guides.rubyonrails.org/v5.0/getting_started.html](https://guides.rubyonrails.org/v5.0/getting_started.html)

**4.** Verificar version de rails
```bash
rails -v
```

**5.** Instalar git

[https://git-scm.com/book/es/v1/Empezando-Instalando-Git](https://git-scm.com/book/es/v1/Empezando-Instalando-Git)

**6.** Instalación de un entorno de desarrollo, recomendado: Visual Studio Code o Atom

[https://code.visualstudio.com/](https://code.visualstudio.com/)

[https://atom.io/](https://atom.io/)

  

## Base de datos
 

Para nuestro proyecto diseñamos las siguientes entidades:
  

- **User:** Es la entidad donde se encuentra el usuario quién va a utilizar la aplicación.

- **Connection:** Es donde el usuario puede elegir entre adoptar o dar en adopción.

- **Pet:** Es donde están los registros de los animales (perros, gatos y conejos).

- **Resource:** Es donde se encuentran alojados todos los archivos adjuntos (fotos y videos) que visualizan las mascotas.

- **Comment:** Todos los comentarios asociados a los animales y publicaciones.

- **Post:** Publicaciones que los usuarios realizan para invitar a las personas a eventos ,dar alguna información específica o crear un debate.

- **Organization:** Persona jurídica o empresa que desee apoyar la gestión, apoyo y el cuidado de la adopción de los animales.

- **Profilepicture:** Entidad creada donde estan almacenadas las fotos de perfil de usuario u organización.
  

## El proyecto tiene implementado las siguientes gemas:

**will_paginate:**  https://github.com/mislav/will_paginate
Esta gema nos permite enviar los datos parcialmente, en paginas como las del buscador de google.

**annotate:**  https://github.com/ctran/annotate_models
Esta gema funciona en conjunto con **will_paginate**

**active_model_serializers:** https://github.com/rails-api/active_model_serializers
Esta gema nos permite establecer que datos queremos enviar del modelo como tambien su formato (JSON)

**knock:** https://github.com/nsarno/knock
Esta gema es para la Autenticación por TOKEN.

**aws-sdk** https://github.com/aws/aws-sdk-ruby 
Esta gema es para recibir las credenciales de Amazon para el servicio de Active Storage.

## Archivos

En el presente repositorio, se encuentran las imágenes, base de datos (modelo entidad-relación) y videos de los animales y usuarios registrados.

## Notas

# Problema N+1

Este problema ocurre cuando el código necesita cargar los hijos de una relación padre-hijo (los "muchos" en el "uno a muchos"). La mayoría de los ORM tienen habilitada la carga diferida de forma predeterminada, por lo que se emiten consultas para el registro principal y luego una consulta para CADA registro secundario. Como puede esperar, hacer consultas N + 1 en lugar de una sola consulta inundará su base de datos con consultas, que es algo que podemos y debemos evitar.


## Desarrolladores

  

Proyecto de Ingeniería de Software 2 - 2019-1

**Equipo:** Perceptron
  

- Cristian Carreño León (FrontEnd)

- Duvan Alberto Andrade Cuenca (FrontEnd - ScrumMaster)

- Luis Fernando Rodríguez Rojas (BackEnd)

- Cristian Camilo Aguilera Polanco (BackEnd)

- Jhonatan Rivera Saumeth (FullStack)

- Edgar Rafael Cruz Rodriguez (BackEnd)

  

## Bibliografía

- [https://guides.rubyonrails.org/](https://guides.rubyonrails.org/)

- [https://www.ruby-lang.org/en/](https://www.ruby-lang.org/en/)

- [https://www.postgresql.org/docs/](https://www.postgresql.org/docs/)

- [https://www.sitepoint.com/silver-bullet-n1-problem/] (https://www.sitepoint.com/silver-bullet-n1-problem/)

- [https://blog.appsignal.com/2018/04/24/active-record-performance-the-n+1-queries-antipattern.html] (https://blog.appsignal.com/2018/04/24/active-record-performance-the-n+1-queries-antipattern.html)


  
  

## Contacto

  
Duvan Alberto Andrade Cuenca
[daandradec@unal.edu.co](mailto:daandradec@unal.edu.co)

 Jhonatan Rivera Saumeth
[jhriverasa@unal.edu.co](mailto:jhriverasa@unal.edu.co)

Luis Fernando Rodríguez Rojas
[luifrodriguezroj@unal.edu.co](mailto:luifrodriguezroj@unal.edu.co)
  
Cristian Carreño León
[gaaplex@gmail.com](mailto:gaaplex@gmail.com)

Edgar Rafael Cruz Rodriguez
[ercruzr@unal.edu.co](mailto:ercruzr@unal.edu.co)

Cristian Camilo Aguilera Polanco
[crcaguilerapo@unal.edu.co](mailto:crcaguilerapo@unal.edu.co)
