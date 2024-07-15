// Interfaz Target (Interfaz deseada por el cliente)
interface Filesystem {
    void readFile(String fileName);
}

// Clase Adaptee (Clase existente que queremos adaptar)
class MemoryCardReader {
    void readMemoryCard(String cardName) {
        System.out.println("Leyendo datos de la tarjeta de memoria: " + cardName);
    }
}

// Adaptador (Adapter) - Implementa la interfaz Target y utiliza la clase Adaptee
class MemoryCardReaderAdapter implements Filesystem {
    private MemoryCardReader memoryCardReader;

    public MemoryCardReaderAdapter(MemoryCardReader memoryCardReader) {
        this.memoryCardReader = memoryCardReader;
    }

    @Override
    public void readFile(String fileName) {
        // Adaptación: Llamamos al método existente de la tarjeta de memoria
        memoryCardReader.readMemoryCard(fileName);
    }
}

// Cliente que utiliza el patrón Adapter
class FilesystemClient {
    public static void main(String[] args) {
        // Utilizando el sistema de archivos con el adaptador
        Filesystem filesystem = new MemoryCardReaderAdapter(new MemoryCardReader());
        filesystem.readFile("documento.txt");
    }
}
