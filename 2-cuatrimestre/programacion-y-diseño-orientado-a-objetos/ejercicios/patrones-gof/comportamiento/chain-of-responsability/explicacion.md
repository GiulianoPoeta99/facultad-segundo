# Chain of Responsability

El patrón Chain of Responsibility es un patrón de diseño comportamental que permite pasar solicitudes a lo largo de una cadena de manejadores. Cada manejador decide, basándose en ciertos criterios, si procesa la solicitud o la pasa al siguiente manejador en la cadena.

En este ejemplo:

Se simula la aprobación de solicitudes de compra.

- '**PurchaseRequest**' es la clase que representa una solicitud de compra con un monto y un propósito.
- '**Approver**' es la interfaz que declara los métodos para manejar solicitudes y establecer el siguiente manejador en la cadena.
- '**AbstractApprover**' es una clase base abstracta que implementa la interfaz Approver y proporciona la lógica común para manejar solicitudes y pasarlas al siguiente manejador.
- '**Manager**', '**Director**', y '**VicePresident**' son clases concretas que extienden AbstractApprover e implementan la lógica específica para aprobar solicitudes según ciertos criterios.

El cliente ('**ChainOfResponsibilityClient**') crea instancias de los manejadores, configura la cadena de responsabilidad y luego procesa solicitudes de compra. Cada manejador decide si puede aprobar la solicitud o si debe pasarla al siguiente manejador en la cadena. Este patrón facilita la adición y modificación de manejadores sin cambiar el código del cliente.

---
**Observacion**: Las clases no son publicas solo para el ejemplo, todas las clases e interfaces deberia ser archivos separados.
