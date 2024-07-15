# Iterator

El patrón Iterator es un patrón de diseño comportamental que proporciona una forma de acceder secuencialmente a los elementos de un objeto agregado sin exponer su representación subyacente.

En este ejemplo:

Se implementa un iterador para recorrer una lista de elementos.

- '**Aggregator**' es la interfaz que declara el método '**createIterator**' para obtener un iterador.
- '**ConcreteAggregator**' es una clase concreta que implementa '**Aggregator**' y contiene una lista de elementos. También implementa el método '**createIterator**' devolviendo una instancia de '**ConcreteIterator**'.
- '**Iterator**' es la interfaz que declara los métodos hasNext y next para recorrer la lista de elementos.
- '**ConcreteIterator**' es una clase concreta que implementa '**Iterator**' y se encarga de recorrer la lista de elementos en '**ConcreteAggregator**'.
- El cliente ('**IteratorClient**') crea una instancia de '**ConcreteAggregator**', agrega elementos, obtiene un iterador y utiliza el iterador para recorrer la lista de elementos.

El patrón Iterator facilita la iteración sobre los elementos de un objeto agregado sin exponer la implementación interna del objeto. Esto mejora la modularidad y flexibilidad del código al permitir cambios en la implementación del objeto sin afectar al código que lo utiliza para la iteración.

---
**Observacion**: Las clases no son publicas solo para el ejemplo, todas las clases e interfaces deberia ser archivos separados.
