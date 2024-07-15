# Composite

El patrón Composite es un patrón de diseño estructural que permite componer objetos en estructuras de árbol para representar jerarquías parte-todo.

En este ejemplo:

Se representa una estructura jerárquica de elementos gráficos, como formas y grupos de formas.

'**Graphic**' es la interfaz que representa tanto las hojas (formas individuales) como los nodos compuestos (grupos de formas). '**SimpleGraphic**' es una implementación de hoja que representa una forma individual, y '**CompositeGraphic**' es una implementación de nodo compuesto que puede contener tanto hojas como otros nodos compuestos.

El cliente ('**GraphicClient**') puede tratar las hojas y los nodos compuestos de manera uniforme a través de la interfaz '**Graphic**'. Cuando se llama al método '**draw()**' en un nodo compuesto, este método se propaga a través de su estructura jerárquica, haciendo que todas las formas individuales y grupos de formas se dibujen según la estructura del árbol. Este patrón facilita la construcción de estructuras complejas y anidadas sin necesidad de diferenciar entre componentes individuales y compuestos en el código cliente.

---
**Observacion**: Las clases no son publicas solo para el ejemplo, todas las clases e interfaces deberia ser archivos separados.
