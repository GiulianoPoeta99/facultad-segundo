import java.awt.Color;
import java.awt.Graphics;
import java.util.HashMap;
import java.util.Map;

// Interfaz Flyweight que define la operación para dibujar un árbol
interface Tree {
    void draw(int x, int y);
}

// Implementación concreta de Flyweight que representa un tipo de árbol
class TreeType implements Tree {
    private String name;
    private Color color;

    public TreeType(String name, Color color) {
        this.name = name;
        this.color = color;
    }

    @Override
    public void draw(int x, int y) {
        System.out.println("Dibujando un " + name + " en la posición (" + x + ", " + y + ") de color " + color);
        // Lógica para dibujar un árbol específico
    }
}

// Clase Flyweight Factory que gestiona los tipos de árboles compartidos
class TreeFactory {
    private static Map<String, TreeType> treeTypes = new HashMap<>();

    public static TreeType getTreeType(String name, Color color) {
        TreeType treeType = treeTypes.get(name);

        if (treeType == null) {
            treeType = new TreeType(name, color);
            treeTypes.put(name, treeType);
        }

        return treeType;
    }
}

// Contexto que representa un árbol en el bosque
class TreeContext {
    private TreeType treeType;
    private int x;
    private int y;

    public TreeContext(TreeType treeType, int x, int y) {
        this.treeType = treeType;
        this.x = x;
        this.y = y;
    }

    public void draw() {
        treeType.draw(x, y);
    }
}

// Cliente que utiliza el patrón Flyweight para crear y dibujar árboles en un bosque
class FlyweightClient {
    public static void main(String[] args) {
        // Crear tipos de árboles compartidos
        TreeType pineTree = TreeFactory.getTreeType("Pine", Color.GREEN);
        TreeType oakTree = TreeFactory.getTreeType("Oak", Color.RED);

        // Crear árboles individuales con tipos compartidos
        TreeContext tree1 = new TreeContext(pineTree, 10, 20);
        TreeContext tree2 = new TreeContext(oakTree, 30, 40);
        TreeContext tree3 = new TreeContext(pineTree, 50, 60);

        // Dibujar los árboles
        tree1.draw();
        tree2.draw();
        tree3.draw();
    }
}
