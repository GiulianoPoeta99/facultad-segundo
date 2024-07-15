# Template method

El patrón Template Method es un patrón de diseño comportamental que define la estructura de un algoritmo en una clase base, pero permite a las subclases redefinir ciertos pasos del algoritmo sin cambiar su estructura.

En este ejemplo:

Se representa un proceso de construcción de una casa.

'**HouseTemplate**' es la clase abstracta que define el Template Method '**buildHouse**'. Este método estructura el proceso de construcción de la casa, llamando a pasos específicos (métodos abstractos) que deben ser implementados por las subclases ('**buildFoundation**', '**buildWalls**', '**buildRoof**', '**decorateHouse**', '**buildGarden**'). También incluye un método hook ('**customerWantsGarden**') que las subclases pueden sobrescribir opcionalmente para personalizar el comportamiento del algoritmo.

Las clases concretas '**WoodenHouse**' y '**BrickHouse**' implementan los pasos específicos de construcción según el material de la casa. En el método hook, '**BrickHouse**' sobrescribe el comportamiento para indicar que no se desea un jardín, personalizando así el Template Method. Este patrón permite estructurar algoritmos comunes en una clase base y proporcionar flexibilidad a través de la implementación en subclases.

---
**Observacion**: Las clases no son publicas solo para el ejemplo, todas las clases e interfaces deberia ser archivos separados.
