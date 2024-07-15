import java.util.ArrayList;
import java.util.List;

// Interfaz Observer que define el método de actualización
interface Observer {
    void update(String message);
}

// Clase concreta que implementa la interfaz Observer
class ConcreteObserver implements Observer {
    private String name;

    public ConcreteObserver(String name) {
        this.name = name;
    }

    @Override
    public void update(String message) {
        System.out.println(name + " recibió la actualización: " + message);
    }
}

// Interfaz Subject que define métodos para agregar, quitar y notificar observadores
interface Subject {
    void addObserver(Observer observer);
    void removeObserver(Observer observer);
    void notifyObservers(String message);
}

// Clase concreta que implementa la interfaz Subject
class ConcreteSubject implements Subject {
    private List<Observer> observers = new ArrayList<>();

    @Override
    public void addObserver(Observer observer) {
        observers.add(observer);
    }

    @Override
    public void removeObserver(Observer observer) {
        observers.remove(observer);
    }

    @Override
    public void notifyObservers(String message) {
        for (Observer observer : observers) {
            observer.update(message);
        }
    }
}

// Cliente que utiliza el patrón Observer
class ObserverClient {
    public static void main(String[] args) {
        // Crear instancias de observadores
        Observer observer1 = new ConcreteObserver("Suscriptor 1");
        Observer observer2 = new ConcreteObserver("Suscriptor 2");

        // Crear instancia de sujeto
        Subject subject = new ConcreteSubject();

        // Agregar observadores al sujeto
        subject.addObserver(observer1);
        subject.addObserver(observer2);

        // Notificar a los observadores
        subject.notifyObservers("Nueva actualización disponible!");

        // Quitar un observador
        subject.removeObserver(observer1);

        // Notificar a los observadores restantes
        subject.notifyObservers("Otra actualización importante!");
    }
}
