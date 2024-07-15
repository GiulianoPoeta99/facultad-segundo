import java.util.ArrayList;
import java.util.List;

// Interfaz Mediator que define los métodos para la comunicación entre componentes
interface Mediator {
    void sendMessage(Component sender, String message);
}

// Clase concreta que implementa la interfaz Mediator
class ChatMediator implements Mediator {
    private List<Component> components;

    public ChatMediator() {
        this.components = new ArrayList<>();
    }

    public void addComponent(Component component) {
        components.add(component);
    }

    @Override
    public void sendMessage(Component sender, String message) {
        for (Component component : components) {
            if (component != sender) {
                component.receiveMessage(message);
            }
        }
    }
}

// Interfaz Component que define los métodos para enviar y recibir mensajes
interface Component {
    void setMediator(Mediator mediator);
    void sendMessage(String message);
    void receiveMessage(String message);
}

// Clase concreta que implementa la interfaz Component (Usuario del chat)
class ChatUser implements Component {
    private Mediator mediator;
    private String name;

    public ChatUser(String name) {
        this.name = name;
    }

    @Override
    public void setMediator(Mediator mediator) {
        this.mediator = mediator;
    }

    @Override
    public void sendMessage(String message) {
        System.out.println(name + " envía el mensaje: " + message);
        mediator.sendMessage(this, message);
    }

    @Override
    public void receiveMessage(String message) {
        System.out.println(name + " recibe el mensaje: " + message);
    }
}

// Cliente que utiliza el patrón Mediator
class MediatorClient {
    public static void main(String[] args) {
        // Crear instancia del mediador
        Mediator mediator = new ChatMediator();

        // Crear instancias de componentes (usuarios del chat)
        Component user1 = new ChatUser("Usuario1");
        Component user2 = new ChatUser("Usuario2");
        Component user3 = new ChatUser("Usuario3");

        // Configurar el mediador para cada usuario
        user1.setMediator(mediator);
        user2.setMediator(mediator);
        user3.setMediator(mediator);

        // Agregar usuarios al mediador
        ((ChatMediator) mediator).addComponent(user1);
        ((ChatMediator) mediator).addComponent(user2);
        ((ChatMediator) mediator).addComponent(user3);

        // Envío de mensajes entre usuarios a través del mediador
        user1.sendMessage("Hola, ¿cómo están?");
        user2.sendMessage("Hola, todo bien. ¿Y tú?");
        user3.sendMessage("Todo tranquilo por acá.");

        /*
        Salida esperada:
        Usuario1 envía el mensaje: Hola, ¿cómo están?
        Usuario2 recibe el mensaje: Hola, ¿cómo están?
        Usuario3 recibe el mensaje: Hola, ¿cómo están?

        Usuario2 envía el mensaje: Hola, todo bien. ¿Y tú?
        Usuario1 recibe el mensaje: Hola, todo bien. ¿Y tú?
        Usuario3 recibe el mensaje: Hola, todo bien. ¿Y tú?

        Usuario3 envía el mensaje: Todo tranquilo por acá.
        Usuario1 recibe el mensaje: Todo tranquilo por acá.
        Usuario2 recibe el mensaje: Todo tranquilo por acá.
        */
    }
}
