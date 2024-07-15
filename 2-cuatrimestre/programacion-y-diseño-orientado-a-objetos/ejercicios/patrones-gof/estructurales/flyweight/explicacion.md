# Flyweight

El patrón Flyweight es un patrón de diseño estructural que se utiliza para minimizar el uso de memoria o recursos compartiendo, de manera eficiente, objetos comunes entre múltiples contextos.

En este ejemplo:

Se utiliza el patrón Flyweight para gestionar la información compartida de árboles en un bosque.

- '**Tree**' es la interfaz Flyweight que define la operación para dibujar un árbol.
- '**TreeType**' es una implementación concreta de '**Tree**' que representa un tipo específico de árbol. Esta clase es compartida y reutilizada para minimizar el uso de memoria.
- '**TreeFactory**' es la Flyweight Factory que gestiona los tipos de árboles compartidos.
- '**TreeContext**' es el contexto que representa un árbol en el bosque y utiliza un tipo compartido de árbol para minimizar el uso de memoria.

El cliente utiliza el patrón Flyweight para crear tipos de árboles compartidos ('**TreeType**') y contextos individuales ('**TreeContext**') que utilizan esos tipos compartidos. Esto ayuda a reducir la redundancia y a conservar recursos al compartir información común entre múltiples instancias.

---
**Observacion**: Las clases no son publicas solo para el ejemplo, todas las clases e interfaces deberia ser archivos separados.
