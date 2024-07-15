// Componente base
interface Beverage {
    String getDescription();
    double cost();
}

// Implementación del componente base - Café simple
class SimpleCoffee implements Beverage {
    @Override
    public String getDescription() {
        return "Café simple";
    }

    @Override
    public double cost() {
        return 2.0;
    }
}

// Decorador abstracto
abstract class CoffeeDecorator implements Beverage {
    protected Beverage decoratedCoffee;

    public CoffeeDecorator(Beverage decoratedCoffee) {
        this.decoratedCoffee = decoratedCoffee;
    }

    @Override
    public String getDescription() {
        return decoratedCoffee.getDescription();
    }

    @Override
    public double cost() {
        return decoratedCoffee.cost();
    }
}

// Decorador concreto - Leche
class MilkDecorator extends CoffeeDecorator {
    public MilkDecorator(Beverage decoratedCoffee) {
        super(decoratedCoffee);
    }

    @Override
    public String getDescription() {
        return super.getDescription() + ", con leche";
    }

    @Override
    public double cost() {
        return super.cost() + 0.5; // Agrega el costo de la leche
    }
}

// Decorador concreto - Caramelo
class CaramelDecorator extends CoffeeDecorator {
    public CaramelDecorator(Beverage decoratedCoffee) {
        super(decoratedCoffee);
    }

    @Override
    public String getDescription() {
        return super.getDescription() + ", con caramelo";
    }

    @Override
    public double cost() {
        return super.cost() + 1.0; // Agrega el costo del caramelo
    }
}

// Cliente que utiliza el patrón Decorator
class CoffeeShop {
    public static void main(String[] args) {
        // Café simple
        Beverage simpleCoffee = new SimpleCoffee();
        System.out.println("Descripción: " + simpleCoffee.getDescription());
        System.out.println("Costo: $" + simpleCoffee.cost());

        // Café con leche
        Beverage coffeeWithMilk = new MilkDecorator(new SimpleCoffee());
        System.out.println("\nDescripción: " + coffeeWithMilk.getDescription());
        System.out.println("Costo: $" + coffeeWithMilk.cost());

        // Café con leche y caramelo
        Beverage caramelCoffee = new CaramelDecorator(new MilkDecorator(new SimpleCoffee()));
        System.out.println("\nDescripción: " + caramelCoffee.getDescription());
        System.out.println("Costo: $" + caramelCoffee.cost());
    }
}
