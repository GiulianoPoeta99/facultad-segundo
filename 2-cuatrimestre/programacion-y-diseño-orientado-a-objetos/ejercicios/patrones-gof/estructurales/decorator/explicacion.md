# Decorator

El patrón Decorator es un patrón de diseño estructural que permite agregar comportamientos adicionales a objetos dinámicamente. Aquí tienes un ejemplo práctico en Java que representa un sistema de cafetería con la capacidad de decorar bebidas con ingredientes adicionales:

En este ejemplo:
'**Beverage**' es la interfaz que representa la bebida, y '**SimpleCoffee**' es una implementación simple de una bebida (un café simple). Luego, tenemos un decorador abstracto ('**CoffeeDecorator**') que implementa la interfaz '**Beverage**' y tiene una referencia al componente base ('**decoratedCoffee**'). Los decoradores concretos ('**MilkDecorator**' y '**CaramelDecorator**') extienden este decorador abstracto y añaden comportamiento adicional, como la descripción y el costo de los ingredientes adicionales.

El cliente ('**CoffeeShop**') puede construir diferentes combinaciones de bebidas decoradas al apilar los decoradores de manera dinámica. Esto permite una flexibilidad considerable, ya que se pueden agregar nuevos ingredientes o modificar combinaciones existentes sin modificar el código de las bebidas o el cliente.

---
**Observacion**: Las clases no son publicas solo para el ejemplo, todas las clases e interfaces deberia ser archivos separados.
