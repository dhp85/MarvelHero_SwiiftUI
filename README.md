# MarvelHeroes-SwiftUI

MarvelHeroes-SwiftUI es una aplicación desarrollada en SwiftUI que consume la API de Marvel para mostrar una lista de héroes y detalle donde incluye las series en las que aparecen. El proyecto sigue la arquitectura MVVM y utiliza `async/await` para manejar operaciones asincronas.

## Características

- **Lista de Héroes:** Muestra una lista de personajes de Marvel obtenidos desde la API de Marvel. Incluye:
  - Nombre del héroe.
  - Imagen del héroe.
  
- **Detalle del Héroe:** Al seleccionar un héroe, se accede a una vista de detalle que incluye:
  - Lista de series en las que aparece el héroe, con:
    - Nombre de la serie.
    - Imagen de la serie.
    - Descripción de la serie.
  
  Además, incluye diferentes **estados de vista**, como:
  - **Estado de carga**: Muestra un indicador de carga mientras se obtienen los datos.
  - **Estado de error**: Muestra un mensaje de error si algo sale mal (por ejemplo, si la solicitud a la API falla).
  - **Vista splash**: Una pantalla inicial que se muestra al iniciar la aplicación o antes de transitar a la vista principal, mostrando una introducción o el logo.

## Tecnologías Utilizadas

- **SwiftUI:** Para la construcción de la interfaz de usuario.
- **MVVM (Model-View-ViewModel):** Arquitectura utilizada para separar la lógica de negocio de la presentación.
- **Async/Await:** Manejo de operaciones asincrónicas, permitiendo escribir código más claro y legible al pausar y reanudar tareas como si fueran sincrónicas.
- **Marvel API:** Proporciona los datos de los personajes y series.
- **SwiftTesting:** Framework utilizado para realizar pruebas unitarias y de integración, asegurando el correcto funcionamiento de la aplicación y su lógica.

## Configuración

1. Clona este repositorio:
   ```bash
   git clone https://github.com/dhp85/MarvelHero_SwiiftUI.git

## Requisitos Para Funcionamiento

1. Tener configurado Xcode (mínimo versión 14.0).
2. Registrarte en https//developer.marvel.com para obtener una clave pública y privada de la API de Marvel, y realizar las solicitudes.
3. Crear el hash MD5 si no lo tienes. Si lo tienes, pasa al siguiente punto.
4. Dentro del proyecto en Domain/Tools/ConstantApp aqui se encuentran las constantes de API_KEY_PUBLIC, aqui pegar vuestra clave publica que os suministra la web de Marvel una vez te registras y en la constante CONSTANT_HASH pegas el hash creado. Ya estaria lista para funcionar con la API de Marvel. Espero que os guste.
5. Si no tienes el hash MD5, necesitas crearlo en la siguiente pagina web https://www.md5hashgenerator.com o cualquier web que genere hash MD5. Introduce los datos de esta manera (1+privateKey+publicKey) quitando los simbolos de mas, pulsa generar y te devuelve un hash, este hash es el que debes pegar en la constante CONSTANT_HASH.


## Proximas Mejoras

1. Cachear imágenes y datos para mejorar el rendimiento de la aplicación.
2. Agregar paginación en la lista de héroes.
3. Mejorar el diseño visual de las vistas para adaptarse mejor a diferentes tamaños de pantalla.


## Creditos

 Desarrollado por Diego Herreros Parrón

Linkedin: www.linkedin.com/in/diego-herreros-parrón-b73a0121b
