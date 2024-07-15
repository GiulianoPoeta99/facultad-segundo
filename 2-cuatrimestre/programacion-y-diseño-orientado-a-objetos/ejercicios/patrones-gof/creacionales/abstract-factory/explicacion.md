# Abstract Factory

El patrón Abstract Factory es un patrón de diseño creacional que proporciona una interfaz para crear familias de objetos relacionados o dependientes sin especificar sus clases concretas. Se utiliza cuando un sistema debe ser independiente de cómo se crean, componen y representan sus objetos, y la familia de objetos a crear es específica del sistema y no debe ser cambiada durante su vida útil.

En este ejemplo:

Suponemos que estamos construyendo un juego y necesitamos crear personajes y sus habilidades, pero también queremos que estos personajes se adapten a un entorno específico, como un entorno de fantasía o uno futurista.

- '**GameFactory**' es la interfaz abstracta de la fábrica que declara métodos para crear personajes y habilidades.
- '**FantasyGameFactory**' y '**FuturisticGameFactory**' son implementaciones concretas de la fábrica que crean personajes y habilidades específicos para entornos de fantasía y futuristas, respectivamente.
- '**Character**' es la interfaz abstracta para el personaje.
- '**FantasyCharacter**' y '**FuturisticCharacter**' son implementaciones concretas de personajes para entornos de fantasía y futuristas, respectivamente.
- '**Ability**' es la interfaz abstracta para las habilidades.
- '**MagicAbility**' y '**LaserAbility**' son implementaciones concretas de habilidades para entornos de fantasía y futuristas, respectivamente.
- El cliente ('**AbstractFactoryExample**') utiliza las fábricas concretas para crear personajes y habilidades específicos para cada entorno y luego muestra y utiliza esos personajes y habilidades.

Este patrón permite crear familias de objetos relacionados sin especificar sus clases concretas, facilitando la creación de sistemas que deben ser independientes de cómo se crean, componen y representan sus objetos.

---
**Observacion**: Las clases no son publicas solo para el ejemplo, todas las clases e interfaces deberia ser archivos separados.
