# Prototype

El patrón Prototype es un patrón de diseño creacional que se utiliza para crear nuevos objetos copiando un objeto existente, llamado prototipo.

En este ejemplo:

Se utiliza el patrón Prototype para clonar objetos Person.

- '**Prototype**' es la interfaz que declara el método '**clone**' para crear una copia del objeto.
- '**Person**' es una clase concreta que implementa la interfaz '**Prototype**'. La implementación del método '**clone**' crea un nuevo objeto '**Person**' con los mismos atributos que el original.
- El cliente ('**PrototypeClient**') crea un objeto original ('**originalPerson**') y luego lo clona para crear un nuevo objeto ('**clonedPerson**'). Se imprime el estado original y el clonado para demostrar que son independientes entre sí.

El patrón Prototype es útil cuando la creación de un objeto es más costosa en términos de rendimiento o recursos, y se desea clonar ese objeto para obtener nuevas instancias sin tener que volver a crearlas desde cero.

---
**Observacion**: Las clases no son publicas solo para el ejemplo, todas las clases e interfaces deberia ser archivos separados.
