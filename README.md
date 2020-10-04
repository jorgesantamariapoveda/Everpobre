# 01 Everpobre

Everpobre es la versión Evernote para pobres. Simula una lista de Notebooks y dentro de cada uno de ellos a su vez hay una lista de Notes.

## Tecnologías

- Dart / Flutter
- Visual Studio Code

## Especificaciones

- Lista de Notebooks. Por medio de un `FloatingActionButton` se pueden crear nuevos Notebooks. Por medio del gesto deslizar se puede borrar un Notebook, informando de ello al usuario con un `SnackBar`.
- Lista de Notes de cada Notebook. Se llega por medio de la navegación desde la lista de Notebooks. Por medio de un `FloatingActionButton` se pueden crear nuevas Notes. Por medio del gesto deslizar se puede borrar un Notebook, informando de ello al usuario con un `SnackBar`.

### Mejoras sobre las especificaciones

- En la lista de Notebooks se muestra el número de Notes.
- En la lista de Notes se muestra en el `AppBar` el título del Notebook seleccionado.
- Se ha creado una función que genera de forma aleatorio el número de Notebooks y el número de Notes de cada uno de ellos. Asimismo tiene su propio test.

##### Capturas de pantallas iOS

![signin](./episode.png "Episodes")

##### Capturas de pantallas Android

![signin](./episode.png "Episodes")
