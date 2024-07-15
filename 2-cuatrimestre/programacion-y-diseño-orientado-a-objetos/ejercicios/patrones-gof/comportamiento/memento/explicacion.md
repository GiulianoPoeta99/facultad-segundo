# Memento

El patrón Memento es un patrón de diseño comportamental que permite capturar y externalizar el estado interno de un objeto sin violar la encapsulación.

En este ejemplo:

Se implementa el patrón Memento para gestionar versiones de un documento.

- '**DocumentMemento**' es la clase que representa el Memento y contiene el estado interno del objeto que se desea guardar ('**Document**').
- '**Document**' es la clase originadora que crea y utiliza Mementos. Tiene métodos para establecer y obtener el contenido del documento, crear Mementos y restaurar el estado desde un Memento.
- '**DocumentHistory**' es la clase cuidadora que gestiona y guarda Mementos. Tiene métodos para guardar Mementos y deshacer acciones mediante la recuperación de Mementos anteriores.
- El cliente ('**MementoClient**') crea instancias de '**Document**' y '**DocumentHistory**', modifica el contenido del documento, guarda Mementos en la historia, y luego deshace la última modificación.

Este patrón permite capturar y restaurar el estado de un objeto en diferentes puntos de tiempo sin exponer su estructura interna. Es útil cuando se desea implementar la funcionalidad de deshacer/rehacer en una aplicación o en situaciones donde se necesite revertir el estado de un objeto a un punto anterior.

---
**Observacion**: Las clases no son publicas solo para el ejemplo, todas las clases e interfaces deberia ser archivos separados.
