# State

El patrón de diseño State es un patrón de comportamiento que permite a un objeto alterar su comportamiento cuando su estado interno cambia.

En este ejemplo:

Se modela el estado de un reproductor de música que puede estar en tres estados.

- '**State**' es la interfaz que declara los métodos para cada estado del reproductor.
- '**PlayingState**', '**PausedState**' y '**StoppedState**' son clases concretas que implementan '**State**' para los estados de reproducción, pausa y detenido, respectivamente.
- '**PlayerContext**' es la clase que representa el contexto (reproductor) y tiene una referencia al estado actual. También proporciona métodos para cambiar el estado actual y delega las acciones a ese estado.
- El cliente ('**StateExample**') crea una instancia del reproductor, interactúa con él en diferentes estados y observa cómo el comportamiento cambia según el estado actual.

Este patrón es útil cuando tienes un objeto que debe cambiar su comportamiento en función de su estado interno y deseas evitar el uso de múltiples condicionales en el código.

---
**Observacion**: Las clases no son publicas solo para el ejemplo, todas las clases e interfaces deberia ser archivos separados.
