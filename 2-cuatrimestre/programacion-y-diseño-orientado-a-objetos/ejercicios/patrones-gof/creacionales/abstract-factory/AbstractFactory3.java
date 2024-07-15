/*
En este ejemplo, CarFactory es la interfaz Abstract Factory que declara métodos 
para crear diferentes tipos de productos relacionados (Sedan y SUV). 
ToyotaFactory es una implementación concreta de esta interfaz que crea productos 
específicos de Toyota (ToyotaSedan y ToyotaSUV). Finalmente, el cliente utiliza 
la fábrica y los productos específicos.

Recuerda que el patrón Abstract Factory se utiliza cuando se quiere crear 
familias de productos relacionados y se quiere asegurar que estos productos 
sean compatibles entre sí. Cada fábrica concreta produce una familia específica 
de productos.
*/

// Interfaz Abstract Factory que define métodos para crear productos relacionados
interface CarFactory {
    Sedan createSedan();
    SUV createSUV();
}

// Interfaz de producto - Sedan
interface Sedan {
    void displayInfo();
}

// Interfaz de producto - SUV
interface SUV {
    void displayInfo();
}

// Implementación concreta de la fábrica
class ToyotaFactory implements CarFactory {
    @Override
    public Sedan createSedan() {
        return new ToyotaSedan();
    }

    @Override
    public SUV createSUV() {
        return new ToyotaSUV();
    }
}

// Implementación concreta del producto - Sedan de Toyota
class ToyotaSedan implements Sedan {
    @Override
    public void displayInfo() {
        System.out.println("Toyota Sedan - Eficiencia y estilo.");
    }
}

// Implementación concreta del producto - SUV de Toyota
class ToyotaSUV implements SUV {
    @Override
    public void displayInfo() {
        System.out.println("Toyota SUV - Espacioso y versátil.");
    }
}

// Cliente que utiliza el patrón Abstract Factory
class AbstractFactoryClient {
    public static void main(String[] args) {
        // Crear una fábrica de Toyota
        CarFactory toyotaFactory = new ToyotaFactory();

        // Crear productos específicos de Toyota
        Sedan toyotaSedan = toyotaFactory.createSedan();
        SUV toyotaSUV = toyotaFactory.createSUV();

        // Mostrar información sobre los productos
        toyotaSedan.displayInfo();
        toyotaSUV.displayInfo();
    }
}
