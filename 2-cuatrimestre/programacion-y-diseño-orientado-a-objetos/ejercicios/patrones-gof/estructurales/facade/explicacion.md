# Facade

El patrón Facade es un patrón de diseño estructural que proporciona una interfaz unificada para un conjunto de interfaces en un subsistema, haciendo que sea más fácil de usar.

En este ejemplo:

Se utiliza el patrón Facade para simplificar el acceso a un sistema de audio.

- '**Amplifier**', '**DvdPlayer**', y '**Projector**' son clases que representan diferentes componentes del sistema de audio.
- '**HomeTheaterFacade**' es la clase Facade que proporciona una interfaz simplificada para encender y apagar el sistema y para ver una película con configuraciones específicas.
- El cliente ('**FacadeClient**') utiliza la fachada para interactuar con el sistema de audio sin tener que conocer los detalles internos de cada componente.

El patrón Facade es útil cuando se desea proporcionar una interfaz simple y unificada para un conjunto de interfaces más complejas o cuando se quiere reducir la dependencia de un cliente respecto a los componentes del subsistema.

---
**Observacion**: Las clases no son publicas solo para el ejemplo, todas las clases e interfaces deberia ser archivos separados.
