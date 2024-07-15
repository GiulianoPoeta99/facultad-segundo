# Proxy

El patrón Proxy es un patrón de diseño estructural que proporciona un sustituto o representante de otro objeto para controlar el acceso a él.

En este ejemplo:

Se representa el uso de un proxy para controlar el acceso a una imagen.

'**Image**' es la interfaz que define el método '**display**'. La clase '**RealImage**' es la implementación real que carga y muestra una imagen desde el disco. El '**ImageProxy**' actúa como un sustituto de '**RealImage**' y proporciona un control adicional sobre el acceso a la imagen real.

Cuando el cliente ('**ImageClient**') utiliza el proxy para acceder a la imagen, la instancia real de '**RealImage**' se crea solo cuando se llama al método '**display()**'. Esto permite cargar y mostrar la imagen solo cuando es necesario, lo cual puede ser beneficioso en situaciones donde la carga de recursos es costosa y deseamos retrasarla hasta que sea estrictamente necesario. El proxy en este caso actúa como un representante del objeto real y proporciona un control adicional sobre su acceso.

---
**Observacion**: Las clases no son publicas solo para el ejemplo, todas las clases e interfaces deberia ser archivos separados.
