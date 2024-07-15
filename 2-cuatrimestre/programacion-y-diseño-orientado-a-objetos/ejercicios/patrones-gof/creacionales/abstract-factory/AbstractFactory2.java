/*
En este ejemplo:

AbstractFactory es la interfaz abstracta para la fábrica abstracta, que declara métodos para crear productos de una familia.
AbstractProductA y AbstractProductB son interfaces que representan productos de la familia A y B, respectivamente.
ConcreteFactory1 y ConcreteFactory2 son implementaciones concretas de AbstractFactory, cada una creando su propia familia de productos.
ConcreteProductA1, ConcreteProductB1, ConcreteProductA2 y ConcreteProductB2 son implementaciones concretas de los productos de las familias A y B.
El cliente (AbstractFactoryClient) utiliza las fábricas y productos concretos sin preocuparse por sus implementaciones específicas.
Este patrón es útil cuando necesitas garantizar que los productos de una familia sean utilizados juntos y cuando quieres facilitar la incorporación de nuevas familias de productos sin modificar el código del cliente.
*/

// Interfaz Abstract Factory que declara métodos para crear productos de una familia
interface AbstractFactory {
    AbstractProductA createProductA();
    AbstractProductB createProductB();
}

// Interfaz de producto A
interface AbstractProductA {
    void operationA();
}

// Interfaz de producto B
interface AbstractProductB {
    void operationB();
}

// Implementación concreta de la fábrica 1
class ConcreteFactory1 implements AbstractFactory {
    @Override
    public AbstractProductA createProductA() {
        return new ConcreteProductA1();
    }

    @Override
    public AbstractProductB createProductB() {
        return new ConcreteProductB1();
    }
}

// Implementación concreta de la fábrica 2
class ConcreteFactory2 implements AbstractFactory {
    @Override
    public AbstractProductA createProductA() {
        return new ConcreteProductA2();
    }

    @Override
    public AbstractProductB createProductB() {
        return new ConcreteProductB2();
    }
}

// Implementación concreta del producto A1
class ConcreteProductA1 implements AbstractProductA {
    @Override
    public void operationA() {
        System.out.println("Operación A en ConcreteProductA1");
    }
}

// Implementación concreta del producto B1
class ConcreteProductB1 implements AbstractProductB {
    @Override
    public void operationB() {
        System.out.println("Operación B en ConcreteProductB1");
    }
}

// Implementación concreta del producto A2
class ConcreteProductA2 implements AbstractProductA {
    @Override
    public void operationA() {
        System.out.println("Operación A en ConcreteProductA2");
    }
}

// Implementación concreta del producto B2
class ConcreteProductB2 implements AbstractProductB {
    @Override
    public void operationB() {
        System.out.println("Operación B en ConcreteProductB2");
    }
}

// Cliente que utiliza el patrón Abstract Factory
class AbstractFactoryClient {
    public static void main(String[] args) {
        // Utilizar la fábrica 1 y sus productos
        AbstractFactory factory1 = new ConcreteFactory1();
        AbstractProductA productA1 = factory1.createProductA();
        AbstractProductB productB1 = factory1.createProductB();

        productA1.operationA();
        productB1.operationB();

        // Utilizar la fábrica 2 y sus productos
        AbstractFactory factory2 = new ConcreteFactory2();
        AbstractProductA productA2 = factory2.createProductA();
        AbstractProductB productB2 = factory2.createProductB();

        productA2.operationA();
        productB2.operationB();
    }
}
