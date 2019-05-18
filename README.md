![](https://lh6.googleusercontent.com/-Nw40S0GwKCTAF4bd60T4XgtQn9xSKqnhFdzX5aMsWRBuhqRMCWIKZ9XOL6qw0uG92J74QVrzNguvFHhyLBPbA32TxSYf362pxfhapXDVyxX11VZTOWy1DS4cWESG_lBr4_NCvJ6)

# PetsHappy

Está es una aplicación donde las personas podrán participar activamente con el propósito de mejorar la calidad de vida de las mascotas, en especial de aquellas que se encuentran en estado de riesgo, a través de un medio por el cual podrán realizar adopciones, donaciones, gestión de animales perdidos o encontrados mediante una red de búsqueda y de apoyo entre la ciudadanía. También tendrá una sección donde se podrán consultar eventos, participación en voluntariados, noticias, sugerencias entre otras actividades.
  

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

- **Interested_In:** Es donde el usuario puede elegir entre adoptar o dar en adopción.

- **Pet:** Es donde están los registros de los animales (perros, gatos y conejos).

- **Resource:** Es donde se encuentran alojados todos los archivos adjuntos (fotos y videos) que visualizan las mascotas.

- **PetLost:** Es donde se encuentran las mascotas perdidas y que los usuarios encuentran.

- **Comment:** Todos los comentarios asociados a los animales y publicaciones.

- **Post:** Publicaciones que los usuarios realizan para invitar a las personas a eventos ,dar alguna información específica o crear un debate.

- **Organization:** Persona jurídica o empresa que ...

  

## Archivos

En el presente repositorio, se encuentran las imágenes, base de datos (modelo entidad-relación) y videos de los animales y usuarios registrados.

  
  

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
