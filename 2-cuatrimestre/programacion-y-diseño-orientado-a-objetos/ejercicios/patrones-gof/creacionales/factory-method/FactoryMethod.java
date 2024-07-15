// Interfaz Product
interface Document {
    void create();
}

// Implementación de un producto concreto - Documento de Texto
class TextDocument implements Document {
    @Override
    public void create() {
        System.out.println("Se ha creado un documento de texto.");
    }
}

// Implementación de un producto concreto - Documento HTML
class HtmlDocument implements Document {
    @Override
    public void create() {
        System.out.println("Se ha creado un documento HTML.");
    }
}

// Interfaz Creator
interface DocumentCreator {
    Document createDocument();
}

// Implementación del Creator concreto para crear documentos de texto
class TextDocumentCreator implements DocumentCreator {
    @Override
    public Document createDocument() {
        return new TextDocument();
    }
}

// Implementación del Creator concreto para crear documentos HTML
class HtmlDocumentCreator implements DocumentCreator {
    @Override
    public Document createDocument() {
        return new HtmlDocument();
    }
}

// Cliente que utiliza el patrón Factory Method
class DocumentManager {
    public static void main(String[] args) {
        // Crear un documento de texto
        DocumentCreator textCreator = new TextDocumentCreator();
        Document textDocument = textCreator.createDocument();
        textDocument.create();

        // Crear un documento HTML
        DocumentCreator htmlCreator = new HtmlDocumentCreator();
        Document htmlDocument = htmlCreator.createDocument();
        htmlDocument.create();
    }
}
