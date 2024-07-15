// Clase Product que queremos construir
class Car {
    private String brand;
    private String model;
    private int year;
    private String color;

    public Car(String brand, String model, int year, String color) {
        this.brand = brand;
        this.model = model;
        this.year = year;
        this.color = color;
    }

    // Getters para acceder a los atributos del coche
    public String getBrand() {
        return brand;
    }

    public String getModel() {
        return model;
    }

    public int getYear() {
        return year;
    }

    public String getColor() {
        return color;
    }

    @Override
    public String toString() {
        return "Car{" +
                "brand='" + brand + '\'' +
                ", model='" + model + '\'' +
                ", year=" + year +
                ", color='" + color + '\'' +
                '}';
    }
}

// Interfaz Builder que define los métodos para construir las partes del objeto
interface CarBuilder {
    void buildBrand(String brand);
    void buildModel(String model);
    void buildYear(int year);
    void buildColor(String color);
    Car getResult();
}

// Implementación concreta del Builder
class CarConcreteBuilder implements CarBuilder {
    private Car car;

    public CarConcreteBuilder() {
        this.car = new Car("", "", 0, "");
    }

    @Override
    public void buildBrand(String brand) {
        car = new Car(brand, car.getModel(), car.getYear(), car.getColor());
    }

    @Override
    public void buildModel(String model) {
        car = new Car(car.getBrand(), model, car.getYear(), car.getColor());
    }

    @Override
    public void buildYear(int year) {
        car = new Car(car.getBrand(), car.getModel(), year, car.getColor());
    }

    @Override
    public void buildColor(String color) {
        car = new Car(car.getBrand(), car.getModel(), car.getYear(), color);
    }

    @Override
    public Car getResult() {
        return car;
    }
}

// Director que utiliza el Builder para construir el objeto Product
class CarDirector {
    private CarBuilder carBuilder;

    public CarDirector(CarBuilder carBuilder) {
        this.carBuilder = carBuilder;
    }

    public void construct() {
        carBuilder.buildBrand("Toyota");
        carBuilder.buildModel("Camry");
        carBuilder.buildYear(2022);
        carBuilder.buildColor("Blue");
    }
}

// Cliente que utiliza el patrón Builder
class BuilderClient {
    public static void main(String[] args) {
        // Crear un builder concreto
        CarBuilder carBuilder = new CarConcreteBuilder();

        // Crear un director y asignarle el builder
        CarDirector carDirector = new CarDirector(carBuilder);

        // Construir el objeto Product (coche) a través del director y el builder
        carDirector.construct();

        // Obtener el resultado del builder
        Car car = carBuilder.getResult();

        // Imprimir el objeto construido
        System.out.println(car);
    }
}
