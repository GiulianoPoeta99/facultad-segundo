// Clase de gestión de conexión a la base de datos (Singleton)
class DatabaseManager {
    // La instancia única de la clase
    private static DatabaseManager instance;

    // Información de conexión a la base de datos
    private String databaseUrl;
    private String username;
    private String password;

    // Constructor privado para evitar la creación de instancias fuera de la clase
    private DatabaseManager() {
        // Configuración de la conexión a la base de datos
        this.databaseUrl = "jdbc:mysql://localhost:3306/mydatabase";
        this.username = "user";
        this.password = "password";
        // Puedes incluir más configuraciones según tus necesidades
    }

    // Método para obtener la instancia única
    public static DatabaseManager getInstance() {
        // Si la instancia aún no ha sido creada, la crea
        if (instance == null) {
            instance = new DatabaseManager();
        }
        return instance;
    }

    // Métodos para acceder a la conexión a la base de datos
    public void connect() {
        // Lógica para establecer la conexión a la base de datos
        System.out.println("Conectando a la base de datos: " + databaseUrl);
    }

    public void disconnect() {
        // Lógica para cerrar la conexión a la base de datos
        System.out.println("Desconectando de la base de datos: " + databaseUrl);
    }

    // Otros métodos relacionados con la gestión de la base de datos
}

// Ejemplo de uso en otra clase
class EventLogger {
    public static void main(String[] args) {
        // Obtén la instancia única de DatabaseManager
        DatabaseManager dbManager = DatabaseManager.getInstance();

        // Utiliza la conexión a la base de datos
        dbManager.connect();

        // Realiza operaciones de registro de eventos
        System.out.println("Registrando eventos...");

        // Cierra la conexión a la base de datos al finalizar
        dbManager.disconnect();
    }
}
