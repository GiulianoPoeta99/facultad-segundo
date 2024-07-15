import java.util.ArrayList;
import java.util.List;

// Componente base
interface Graphic {
    void draw();
}

// Hoja (Leaf) - Implementación de una forma
class SimpleGraphic implements Graphic {
    private String name;

    public SimpleGraphic(String name) {
        this.name = name;
    }

    @Override
    public void draw() {
        System.out.println("Dibujando " + name);
    }
}

// Composite - Implementación de un grupo de formas
class CompositeGraphic implements Graphic {
    private List<Graphic> graphics = new ArrayList<>();

    public void addGraphic(Graphic graphic) {
        graphics.add(graphic);
    }

    public void removeGraphic(Graphic graphic) {
        graphics.remove(graphic);
    }

    @Override
    public void draw() {
        System.out.println("Dibujando grupo:");
        for (Graphic graphic : graphics) {
            graphic.draw();
        }
    }
}

// Cliente que utiliza el patrón Composite
class GraphicClient {
    public static void main(String[] args) {
        // Crear formas individuales
        SimpleGraphic circle = new SimpleGraphic("Círculo");
        SimpleGraphic square = new SimpleGraphic("Cuadrado");

        // Crear un grupo de formas
        CompositeGraphic group = new CompositeGraphic();
        group.addGraphic(circle);
        group.addGraphic(square);

        // Crear una forma adicional
        SimpleGraphic triangle = new SimpleGraphic("Triángulo");

        // Agregar la forma adicional al grupo
        group.addGraphic(triangle);

        // Dibujar todas las formas
        circle.draw();
        System.out.println();
        square.draw();
        System.out.println();
        group.draw();
    }
}
