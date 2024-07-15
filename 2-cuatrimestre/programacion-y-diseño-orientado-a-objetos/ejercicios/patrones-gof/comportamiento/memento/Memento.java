import java.util.List;
import java.util.ArrayList;

// Clase que representa el Memento
class DocumentMemento {
    private String content;

    public DocumentMemento(String content) {
        this.content = content;
    }

    public String getContent() {
        return content;
    }
}

// Clase originadora que crea y utiliza Mementos
class Document {
    private String content;

    public void setContent(String content) {
        this.content = content;
    }

    public DocumentMemento createMemento() {
        return new DocumentMemento(content);
    }

    public void restoreFromMemento(DocumentMemento memento) {
        content = memento.getContent();
    }

    public void printContent() {
        System.out.println("Contenido del documento: " + content);
    }
}

// Clase cuidadora que gestiona y guarda Mementos
class DocumentHistory {
    private List<DocumentMemento> mementos = new ArrayList<>();

    public void save(DocumentMemento memento) {
        mementos.add(memento);
    }

    public DocumentMemento undo() {
        if (mementos.size() > 1) {
            DocumentMemento lastMemento = mementos.remove(mementos.size() - 1);
            return mementos.get(mementos.size() - 1);
        } else {
            return mementos.get(0);
        }
    }
}

// Cliente que utiliza el patrón Memento
class MementoClient {
    public static void main(String[] args) {
        // Crear instancia de Document y DocumentHistory
        Document document = new Document();
        DocumentHistory history = new DocumentHistory();

        // Modificar el contenido del documento y guardarlo en la historia
        document.setContent("Versión 1");
        history.save(document.createMemento());
        document.printContent();

        // Modificar el contenido nuevamente y guardarlo en la historia
        document.setContent("Versión 2");
        history.save(document.createMemento());
        document.printContent();

        // Deshacer la última modificación
        DocumentMemento undoMemento = history.undo();
        document.restoreFromMemento(undoMemento);
        document.printContent();
    }
}
