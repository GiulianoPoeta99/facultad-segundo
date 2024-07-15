// Interfaz Visitor que declara métodos para visitar cada tipo de elemento
interface Visitor {
    void visit(Circle circle);
    void visit(Square square);
    void visit(Triangle triangle);
}

// Interfaz Element que declara el método accept para aceptar visitantes
interface Element {
    void accept(Visitor visitor);
}

// Clase concreta que implementa la interfaz Element (Círculo)
class Circle implements Element {
    private double radius;

    public Circle(double radius) {
        this.radius = radius;
    }

    public double getRadius() {
        return radius;
    }

    @Override
    public void accept(Visitor visitor) {
        visitor.visit(this);
    }
}

// Clase concreta que implementa la interfaz Element (Cuadrado)
class Square implements Element {
    private double side;

    public Square(double side) {
        this.side = side;
    }

    public double getSide() {
        return side;
    }

    @Override
    public void accept(Visitor visitor) {
        visitor.visit(this);
    }
}

// Clase concreta que implementa la interfaz Element (Triángulo)
class Triangle implements Element {
    private double side1;
    private double side2;
    private double side3;

    public Triangle(double side1, double side2, double side3) {
        this.side1 = side1;
        this.side2 = side2;
        this.side3 = side3;
    }

    public double getSide1() {
        return side1;
    }

    public double getSide2() {
        return side2;
    }

    public double getSide3() {
        return side3;
    }

    @Override
    public void accept(Visitor visitor) {
        visitor.visit(this);
    }
}

// Clase concreta que implementa la interfaz Visitor (ÁreaVisitor)
class AreaVisitor implements Visitor {
    private double totalArea;

    @Override
    public void visit(Circle circle) {
        // Calcular el área de un círculo: π * radio^2
        double area = Math.PI * Math.pow(circle.getRadius(), 2);
        System.out.println("Área del círculo: " + area);
        totalArea += area;
    }

    @Override
    public void visit(Square square) {
        // Calcular el área de un cuadrado: lado^2
        double area = Math.pow(square.getSide(), 2);
        System.out.println("Área del cuadrado: " + area);
        totalArea += area;
    }

    @Override
    public void visit(Triangle triangle) {
        // Calcular el área de un triángulo usando la fórmula de Herón
        double s = (triangle.getSide1() + triangle.getSide2() + triangle.getSide3()) / 2;
        double area = Math.sqrt(s * (s - triangle.getSide1()) * (s - triangle.getSide2()) * (s - triangle.getSide3()));
        System.out.println("Área del triángulo: " + area);
        totalArea += area;
    }

    public double getTotalArea() {
        return totalArea;
    }
}

// Cliente que utiliza el patrón Visitor
class VisitorClient {
    public static void main(String[] args) {
        // Crear instancias de elementos
        Element circle = new Circle(5);
        Element square = new Square(4);
        Element triangle = new Triangle(3, 4, 5);

        // Crear instancia de visitante
        Visitor areaVisitor = new AreaVisitor();

        // Aplicar el visitante a cada elemento
        circle.accept(areaVisitor);
        square.accept(areaVisitor);
        triangle.accept(areaVisitor);

        // Obtener el resultado total del área
        double totalArea = ((AreaVisitor) areaVisitor).getTotalArea();
        System.out.println("Área total de todas las formas: " + totalArea);
    }
}
