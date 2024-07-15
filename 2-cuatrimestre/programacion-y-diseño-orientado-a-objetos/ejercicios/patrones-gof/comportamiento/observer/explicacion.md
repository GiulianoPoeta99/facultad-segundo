# Observer

El patrón Observer es un patrón de diseño comportamental que define una relación de uno a muchos entre objetos, de modo que cuando un objeto cambia de estado, todos sus dependientes son notificados y actualizados automáticamente.

En este ejemplo:

Se simula un sistema de notificación de actualizaciones para suscriptores.

- '**Observer**' es la interfaz que define el método '**update**' que los observadores implementarán para recibir actualizaciones.
- '**ConcreteObserver**' es una implementación concreta de '**Observer**' que recibe y muestra actualizaciones.
- '**Subject**' es la interfaz que define métodos para agregar, quitar y notificar observadores.
- '**ConcreteSubject**' es una implementación concreta de '**Subject**' que mantiene una lista de observadores y notifica a todos cuando hay una actualización.

El cliente ('**ObserverClient**') crea instancias de observadores y un sujeto, agrega los observadores al sujeto, notifica a los observadores y finalmente, quita un observador y vuelve a notificar a los observadores restantes. Este patrón es útil para implementar un sistema de notificación donde múltiples objetos necesitan ser informados sobre cambios en otro objeto sin acoplarse directamente entre sí.

---
**Observacion**: Las clases no son publicas solo para el ejemplo, todas las clases e interfaces deberia ser archivos separados.
