/*
El patrón de diseño State es un patrón de comportamiento que permite a un objeto alterar su comportamiento cuando su estado interno cambia. Aquí tienes un ejemplo en Java:

Supongamos que queremos modelar el comportamiento de una conexión en un programa. La conexión puede tener diferentes estados, como "Conectado", "Desconectado" y "Esperando". Utilizaremos el patrón State para manejar estos estados.

Primero, definiremos una interfaz State que representará los diferentes estados de la conexión:
*/

// Interfaz State
interface ConnectionState {
    void connect();
    void disconnect();
    void waitForConnection();
}

// Luego, implementaremos clases concretas que representarán los diferentes estados:

// Implementación del estado Conectado
class ConnectedState implements ConnectionState {
    @Override
    public void connect() {
        System.out.println("Ya estamos conectados.");
    }

    @Override
    public void disconnect() {
        System.out.println("Desconectando...");
    }

    @Override
    public void waitForConnection() {
        System.out.println("Ya estamos conectados, no es necesario esperar.");
    }
}

// Implementación del estado Desconectado
class DisconnectedState implements ConnectionState {
    @Override
    public void connect() {
        System.out.println("Conectando...");
    }

    @Override
    public void disconnect() {
        System.out.println("Ya estamos desconectados.");
    }

    @Override
    public void waitForConnection() {
        System.out.println("Esperando conexión...");
    }
}

// Implementación del estado Esperando
class WaitingState implements ConnectionState {
    @Override
    public void connect() {
        System.out.println("Conexión en espera, no se puede conectar ahora.");
    }

    @Override
    public void disconnect() {
        System.out.println("Cancelando espera y desconectando.");
    }

    @Override
    public void waitForConnection() {
        System.out.println("Ya estamos esperando una conexión.");
    }
}

// Finalmente, crearemos una clase Connection que tenga un estado actual y pueda cambiar su comportamiento en función del estado:

// Clase Context (Connection)
class Connection {
    private ConnectionState state;

    public Connection() {
        // Inicializamos con el estado Desconectado
        this.state = new DisconnectedState();
    }

    public void setState(ConnectionState state) {
        this.state = state;
    }

    public void connect() {
        state.connect();
    }

    public void disconnect() {
        state.disconnect();
    }

    public void waitForConnection() {
        state.waitForConnection();
    }
}

// Ahora puedes usar esta implementación de la siguiente manera:

class Main {
    public static void main(String[] args) {
        Connection connection = new Connection();

        connection.connect();
        connection.disconnect();

        connection.setState(new WaitingState());
        connection.connect();
        connection.waitForConnection();
        connection.disconnect();
    }
}

// Este ejemplo demuestra cómo el objeto Connection puede cambiar su comportamiento según su estado interno, gracias al patrón State.