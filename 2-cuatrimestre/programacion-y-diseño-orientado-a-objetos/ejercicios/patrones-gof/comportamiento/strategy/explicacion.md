# Strategy

El patrón de diseño Strategy es otro patrón de comportamiento que define una familia de algoritmos, encapsula cada uno de ellos y los hace intercambiables. Este patrón permite que el cliente elija el algoritmo que debe ejecutarse en tiempo de ejecución.

En este ejemplo:

Se implementa un sistema de procesamiento de pagos que puede realizar transacciones utilizando diferentes estrategias de pago, como tarjeta de crédito o PayPal.

- '**PaymentStrategy**' es la interfaz que declara el método pay para realizar el pago.
- '**CreditCardPayment**' y '**PayPalPayment**' son clases concretas que implementan '**PaymentStrategy**' para las estrategias de pago con tarjeta de crédito y PayPal, respectivamente.
- '**PaymentContext**' es la clase de contexto que utiliza una estrategia de pago. Puede cambiar dinámicamente la estrategia de pago.
- El cliente ('**StrategyExample**') crea instancias de las estrategias de pago, instancias de contexto con diferentes estrategias y realiza pagos utilizando esas estrategias. También muestra cómo cambiar dinámicamente la estrategia de pago en tiempo de ejecución.

Este patrón es útil cuando tienes diferentes algoritmos o estrategias que quieres encapsular y poder intercambiar dinámicamente en tiempo de ejecución. En este caso, las estrategias son diferentes formas de procesar pagos.

---
**Observacion**: Las clases no son publicas solo para el ejemplo, todas las clases e interfaces deberia ser archivos separados.
