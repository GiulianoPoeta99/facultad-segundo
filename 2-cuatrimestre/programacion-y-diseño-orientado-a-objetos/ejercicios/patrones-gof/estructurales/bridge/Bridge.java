// Implementación de la interfaz Implementor (implementación)
interface Color {
    void applyColor();
}

// Implementaciones concretas de Color
class Red implements Color {
    @Override
    public void applyColor() {
        System.out.println("Aplicando color rojo");
    }
}

class Blue implements Color {
    @Override
    public void applyColor() {
        System.out.println("Aplicando color azul");
    }
}

// Abstracción que utiliza la interfaz Implementor
abstract class Shape {
    protected Color color;

    public Shape(Color color) {
        this.color = color;
    }

    abstract void draw();
}

// Implementaciones concretas de Shape
class Square extends Shape {
    public Square(Color color) {
        super(color);
    }

    @Override
    void draw() {
        System.out.print("Dibujando un cuadrado. ");
        color.applyColor();
    }
}

class Circle extends Shape {
    public Circle(Color color) {
        super(color);
    }

    @Override
    void draw() {
        System.out.print("Dibujando un círculo. ");
        color.applyColor();
    }
}

// Cliente que utiliza el patrón Bridge
class BridgeClient {
    public static void main(String[] args) {
        // Crear implementaciones concretas de Color
        Color red = new Red();
        Color blue = new Blue();

        // Crear implementaciones concretas de Shape que utilizan las implementaciones de Color
        Shape redSquare = new Square(red);
        Shape blueCircle = new Circle(blue);

        // Dibujar las formas con sus colores correspondientes
        redSquare.draw();
        blueCircle.draw();
    }
}
