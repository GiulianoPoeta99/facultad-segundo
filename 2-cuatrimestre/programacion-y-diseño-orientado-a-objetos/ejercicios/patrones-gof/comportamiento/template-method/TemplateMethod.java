// Clase abstracta que define el Template Method
abstract class HouseTemplate {
    // Método Template Method
    public final void buildHouse() {
        buildFoundation();
        buildWalls();
        buildRoof();
        decorateHouse();
        if (customerWantsGarden()) {
            buildGarden();
        }
    }

    // Métodos abstractos que deben ser implementados por las subclases
    abstract void buildFoundation();
    abstract void buildWalls();
    abstract void buildRoof();
    abstract void decorateHouse();
    abstract void buildGarden();

    // Método hook (gancho) opcional que las subclases pueden sobrescribir
    boolean customerWantsGarden() {
        return true;
    }
}

// Implementación concreta de la casa - Casa de madera
class WoodenHouse extends HouseTemplate {
    @Override
    void buildFoundation() {
        System.out.println("Construyendo la base de la casa de madera.");
    }

    @Override
    void buildWalls() {
        System.out.println("Construyendo las paredes de la casa de madera.");
    }

    @Override
    void buildRoof() {
        System.out.println("Construyendo el techo de la casa de madera.");
    }

    @Override
    void decorateHouse() {
        System.out.println("Decorando la casa de madera.");
    }

    @Override
    void buildGarden() {
        System.out.println("Añadiendo jardín a la casa de madera.");
    }
}

// Implementación concreta de la casa - Casa de ladrillo
class BrickHouse extends HouseTemplate {
    @Override
    void buildFoundation() {
        System.out.println("Construyendo la base de la casa de ladrillo.");
    }

    @Override
    void buildWalls() {
        System.out.println("Construyendo las paredes de la casa de ladrillo.");
    }

    @Override
    void buildRoof() {
        System.out.println("Construyendo el techo de la casa de ladrillo.");
    }

    @Override
    void decorateHouse() {
        System.out.println("Decorando la casa de ladrillo.");
    }

    @Override
    void buildGarden() {
        System.out.println("Añadiendo jardín a la casa de ladrillo.");
    }

    // Sobrescribe el método hook para personalizar el comportamiento
    @Override
    boolean customerWantsGarden() {
        return false;
    }
}

// Cliente que utiliza el patrón Template Method
class HouseClient {
    public static void main(String[] args) {
        System.out.println("Construyendo una casa de madera:");
        HouseTemplate woodenHouse = new WoodenHouse();
        woodenHouse.buildHouse();

        System.out.println("\nConstruyendo una casa de ladrillo:");
        HouseTemplate brickHouse = new BrickHouse();
        brickHouse.buildHouse();
    }
}
