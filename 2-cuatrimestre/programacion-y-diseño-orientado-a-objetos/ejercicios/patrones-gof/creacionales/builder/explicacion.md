# Builder

El patrón Builder es un patrón de diseño creacional que separa la construcción de un objeto complejo de su representación, permitiendo la creación de diferentes representaciones del mismo objeto.

En este ejemplo:

Se utiliza el patrón Builder para construir un objeto '**Product**' (en este caso, un auto).

'**Car**' es la clase que queremos construir. '**CarBuilder**' es la interfaz del Builder que define los métodos para construir las partes del coche, y '**CarConcreteBuilder**' es la implementación concreta del Builder que construye un objeto '**Car**'.

El '**CarDirector**' utiliza un '**CarBuilder**' para construir el objeto '**Car**' de manera más sencilla. Esto permite la creación de diferentes configuraciones de coches utilizando el mismo proceso de construcción.

El patrón Builder es útil cuando hay varios pasos o configuraciones posibles para la construcción de un objeto y queremos evitar un constructor con muchos parámetros. Facilita la creación de objetos complejos paso a paso y proporciona flexibilidad en la construcción del objeto final.

---
**Observacion**: Las clases no son publicas solo para el ejemplo, todas las clases e interfaces deberia ser archivos separados.
