// Interfaz del objeto real
interface Image {
    void display();
}

// Clase real que implementa la interfaz
class RealImage implements Image {
    private String filename;

    public RealImage(String filename) {
        this.filename = filename;
        loadFromDisk();
    }

    private void loadFromDisk() {
        System.out.println("Cargando imagen: " + filename);
    }

    @Override
    public void display() {
        System.out.println("Mostrando imagen: " + filename);
    }
}

// Proxy que implementa la misma interfaz que el objeto real
class ImageProxy implements Image {
    private RealImage realImage;
    private String filename;

    public ImageProxy(String filename) {
        this.filename = filename;
    }

    @Override
    public void display() {
        // Crear la instancia del objeto real solo cuando sea necesario
        if (realImage == null) {
            realImage = new RealImage(filename);
        }
        // Llamar al método display del objeto real
        realImage.display();
    }
}

// Cliente que utiliza el patrón Proxy
class ImageClient {
    public static void main(String[] args) {
        // Utilizando el proxy para controlar el acceso a la imagen
        Image image = new ImageProxy("sample.jpg");

        // La carga de la imagen y la visualización se realizan solo cuando se llama a display()
        image.display();
    }
}
