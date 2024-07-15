# Adapter

El patrón Adapter es un patrón de diseño estructural que permite que la interfaz de una clase sea utilizada como otra interfaz. Aquí tienes un ejemplo práctico en Java que simula la adaptación de un sistema de lectura de tarjetas de memoria a un sistema de archivos:

En este ejemplo:

'**Filesystem**' es la interfaz que el cliente espera para interactuar con el sistema de archivos. La clase '**MemoryCardReader**' es un Adaptee que tiene un método '**readMemoryCard**' para leer datos de una tarjeta de memoria.

El '**MemoryCardReaderAdapter**' implementa la interfaz '**Filesystem**' y utiliza la clase '**MemoryCardReader**' para adaptarla al sistema de archivos. De esta manera, el cliente puede utilizar el método '**readFile**' como si estuviera interactuando directamente con un sistema de archivos, pero detrás de escena, el adaptador se encarga de la adaptación y utiliza la funcionalidad existente de '**MemoryCardReader**'.

Al ejecutar el cliente ('**FilesystemClient**'), se verá que el adaptador permite leer un archivo (documento.txt) utilizando el método '**readFile**', que internamente utiliza el método existente '**readMemoryCard**' de la tarjeta de memoria. Este es un ejemplo simplificado, pero ilustra el concepto de adaptador en el patrón Adapter.

---
**Observacion**: Las clases no son publicas solo para el ejemplo, todas las clases e interfaces deberia ser archivos separados.
