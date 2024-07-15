// Interfaz Prototype
interface Prototype {
    Prototype clone();
}

// Clase concreta que implementa Prototype
class Person implements Prototype {
    private String name;
    private int age;

    public Person(String name, int age) {
        this.name = name;
        this.age = age;
    }

    // Método para clonar el objeto
    @Override
    public Prototype clone() {
        return new Person(name, age);
    }

    @Override
    public String toString() {
        return "Person{" +
                "name='" + name + '\'' +
                ", age=" + age +
                '}';
    }
}

// Cliente que utiliza el patrón Prototype
class PrototypeClient {
    public static void main(String[] args) {
        // Crear un prototipo de persona
        Prototype originalPerson = new Person("John Doe", 30);
        System.out.println("Original: " + originalPerson);

        // Clonar el prototipo para crear un nuevo objeto
        Prototype clonedPerson = originalPerson.clone();
        System.out.println("Clonado: " + clonedPerson);

        // Modificar el objeto clonado
        if (clonedPerson instanceof Person) {
            ((Person) clonedPerson).setName("Jane Doe");
            ((Person) clonedPerson).setAge(25);
        }

        // Imprimir el estado actual del original y el clonado
        System.out.println("Original después de clonar: " + originalPerson);
        System.out.println("Clonado modificado: " + clonedPerson);
    }
}
