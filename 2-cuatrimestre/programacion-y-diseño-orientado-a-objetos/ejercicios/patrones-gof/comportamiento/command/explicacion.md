# Command

El patrón Command es un patrón de diseño comportamental que encapsula una solicitud como un objeto, permitiendo así que los parámetros de la solicitud sean parametrizados, encoleados o registrados, y que las operaciones sean soportadas.

En este ejemplo:

Se simula un control remoto con botones para encender, apagar y ajustar el volumen de un dispositivo.

- '**Command**' es la interfaz que declara el método execute.
- '**LightOnCommand**', LightOffCommand, y StereoVolumeUpCommand son clases concretas que implementan la interfaz Command para encender la luz, apagar la luz y aumentar el volumen del estéreo, respectivamente.
- '**Light**' y '**Stereo**' son clases que representan dispositivos receptores de los comandos.
- '**RemoteControl**' es la clase invocadora que ejecuta comandos. Puede configurarse con diferentes comandos y ejecutarlos al presionar un botón.

Este patrón permite desacoplar el objeto que invoca la operación ('**RemoteControl**') del objeto que la realiza ('**Light**' y '**Stereo**'), permitiendo así mayor flexibilidad y extensibilidad en la aplicación.

---
**Observacion**: Las clases no son publicas solo para el ejemplo, todas las clases e interfaces deberia ser archivos separados.
