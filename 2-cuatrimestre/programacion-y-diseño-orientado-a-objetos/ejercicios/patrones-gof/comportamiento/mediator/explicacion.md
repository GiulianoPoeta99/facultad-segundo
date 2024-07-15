# Mediator

El patrón Mediator es un patrón de diseño comportamental que define un objeto que centraliza la comunicación entre un conjunto de objetos, evitando que estos se comuniquen directamente entre sí.

En este ejemplo:

Se implementa un mediador para gestionar la comunicación entre diferentes componentes de un sistema de chat.

- '**Mediator**' es la interfaz que define los métodos para la comunicación entre componentes.
- '**ChatMediator**' es una clase concreta que implementa '**Mediator**' y gestiona la comunicación entre los componentes.
- '**Component**' es la interfaz que define los métodos para enviar y recibir mensajes.
- '**ChatUser**' es una clase concreta que implementa '**Component**' y representa a un usuario del chat.
- El cliente ('**MediatorClient**') crea una instancia del mediador, instancias de usuarios del chat, configura el mediador para cada usuario y agrega los usuarios al mediador. Luego, los usuarios se comunican entre sí a través del mediador.

El patrón Mediator promueve la desacoplación entre los componentes de un sistema al centralizar la lógica de comunicación en un objeto mediador. Esto facilita la extensibilidad y mantenimiento del sistema, ya que los componentes no necesitan conocerse directamente.

---
**Observacion**: Las clases no son publicas solo para el ejemplo, todas las clases e interfaces deberia ser archivos separados.
