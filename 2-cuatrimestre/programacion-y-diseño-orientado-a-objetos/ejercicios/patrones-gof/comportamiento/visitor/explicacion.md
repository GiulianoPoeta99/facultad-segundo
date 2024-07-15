# Visitor

El patrón Visitor es un patrón de diseño comportamental que permite definir una nueva operación sin cambiar las clases de los elementos sobre los que opera.

En este ejemplo:

Se implementa el patrón Visitor para realizar operaciones sobre una estructura de objetos de formas geométricas

- '**Visitor**' es la interfaz que declara métodos para visitar cada tipo de elemento.
- '**Element**' es la interfaz que declara el método '**accept**' para aceptar visitantes.
- '**Circle**', '**Square**', y '**Triangle**' son clases concretas que implementan la interfaz '**Element**'.
- '**AreaVisitor**' es una clase concreta que implementa la interfaz '**Visitor**' y realiza operaciones relacionadas con el área sobre cada tipo de elemento.
- El cliente ('**VisitorClient**') crea instancias de elementos, un visitante y aplica el visitante a cada elemento.

Este patrón permite agregar nuevas operaciones sin modificar las clases de los elementos. En este caso, el '**AreaVisitor**' realiza operaciones de cálculo de áreas sobre diferentes tipos de formas geométricas sin alterar su implementación interna.

---
**Observacion**: Las clases no son publicas solo para el ejemplo, todas las clases e interfaces deberia ser archivos separados.
