# Bridge

El patrón Bridge es un patrón estructural que separa una abstracción de su implementación, de modo que ambas puedan variar independientemente. Aquí tienes un ejemplo práctico en Java que utiliza el patrón Bridge para conectar diferentes formas y colores:

En este ejemplo:

- '**Color**' es la interfaz Implementor que define el método '**applyColor**'.
- '**Red**' y '**Blue**' son implementaciones concretas de '**Color**'.
- '**Shape**' es la abstracción que utiliza una implementación de '**Color**'. Las clases '**Square**' y '**Circle**' extienden esta abstracción y tienen una referencia a '**Color**'.
- El cliente ('**BridgeClient**') crea instancias de implementaciones concretas de '**Color**' y '**Shape**', y luego las utiliza para dibujar formas con colores específicos.

Este patrón permite que las abstracciones y las implementaciones varíen de forma independiente. Por ejemplo, puedes agregar nuevas formas o colores sin tener que modificar las clases existentes, ya que la abstracción ('**Shape**') y la implementación ('**Color**') están desacopladas.

---
**Observacion**: Las clases no son publicas solo para el ejemplo, todas las clases e interfaces deberia ser archivos separados.
