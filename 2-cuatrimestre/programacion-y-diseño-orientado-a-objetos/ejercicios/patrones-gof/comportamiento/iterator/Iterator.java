import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

// Interfaz Agregado que declara el método createIterator
interface Aggregator {
    Iterator createIterator();
}

// Clase concreta que implementa la interfaz Agregado y contiene una lista de elementos
class ConcreteAggregator implements Aggregator {
    private List<String> elements;

    public ConcreteAggregator() {
        this.elements = new ArrayList<>();
    }

    public void addItem(String item) {
        elements.add(item);
    }

    @Override
    public Iterator createIterator() {
        return new ConcreteIterator(elements);
    }
}

// Interfaz Iterador que declara los métodos hasNext y next
interface Iterator {
    boolean hasNext();
    Object next();
}

// Clase concreta que implementa la interfaz Iterador y recorre la lista de elementos
class ConcreteIterator implements Iterator {
    private List<String> elements;
    private int position;

    public ConcreteIterator(List<String> elements) {
        this.elements = elements;
        this.position = 0;
    }

    @Override
    public boolean hasNext() {
        return position < elements.size();
    }

    @Override
    public Object next() {
        if (this.hasNext()) {
            return elements.get(position++);
        }
        return null;
    }
}

// Cliente que utiliza el patrón Iterator
class IteratorClient {
    public static void main(String[] args) {
        // Crear una instancia del agregado
        Aggregator aggregator = new ConcreteAggregator();

        // Agregar elementos al agregado
        aggregator.addItem("Elemento 1");
        aggregator.addItem("Elemento 2");
        aggregator.addItem("Elemento 3");

        // Obtener un iterador y recorrer la lista de elementos
        Iterator iterator = aggregator.createIterator();

        while (iterator.hasNext()) {
            String element = (String) iterator.next();
            System.out.println("Elemento: " + element);
        }
    }
}
