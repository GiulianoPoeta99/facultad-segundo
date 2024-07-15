// Interfaz Abstracta de Fábrica que declara métodos para crear personajes y habilidades
interface GameFactory {
    Character createCharacter();
    Ability createAbility();
}

// Clase concreta de la fábrica para el entorno de fantasía
class FantasyGameFactory implements GameFactory {
    @Override
    public Character createCharacter() {
        return new FantasyCharacter();
    }

    @Override
    public Ability createAbility() {
        return new MagicAbility();
    }
}

// Clase concreta de la fábrica para el entorno futurista
class FuturisticGameFactory implements GameFactory {
    @Override
    public Character createCharacter() {
        return new FuturisticCharacter();
    }

    @Override
    public Ability createAbility() {
        return new LaserAbility();
    }
}

// Interfaz Abstracta para el personaje
interface Character {
    void display();
}

// Clases concretas que implementan la interfaz Character para diferentes entornos
class FantasyCharacter implements Character {
    @Override
    public void display() {
        System.out.println("Fantasy Character");
    }
}

class FuturisticCharacter implements Character {
    @Override
    public void display() {
        System.out.println("Futuristic Character");
    }
}

// Interfaz Abstracta para las habilidades
interface Ability {
    void use();
}

// Clases concretas que implementan la interfaz Ability para diferentes entornos
class MagicAbility implements Ability {
    @Override
    public void use() {
        System.out.println("Using Magic Ability");
    }
}

class LaserAbility implements Ability {
    @Override
    public void use() {
        System.out.println("Using Laser Ability");
    }
}

// Cliente que utiliza el patrón Abstract Factory
class AbstractFactoryExample {
    public static void main(String[] args) {
        // Crear una fábrica para el entorno de fantasía
        GameFactory fantasyFactory = new FantasyGameFactory();

        // Crear personaje y habilidad para el entorno de fantasía
        Character fantasyCharacter = fantasyFactory.createCharacter();
        Ability magicAbility = fantasyFactory.createAbility();

        // Mostrar el personaje y usar la habilidad
        fantasyCharacter.display();
        magicAbility.use();

        // Crear una fábrica para el entorno futurista
        GameFactory futuristicFactory = new FuturisticGameFactory();

        // Crear personaje y habilidad para el entorno futurista
        Character futuristicCharacter = futuristicFactory.createCharacter();
        Ability laserAbility = futuristicFactory.createAbility();

        // Mostrar el personaje y usar la habilidad
        futuristicCharacter.display();
        laserAbility.use();
    }
}
