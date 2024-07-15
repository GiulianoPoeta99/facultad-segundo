# Factory Method

El patrón Factory Method es un patrón de diseño creacional que proporciona una interfaz para crear instancias de una clase, pero permite a las subclases alterar el tipo de instancias que se crearán.

En este ejemplo:

Supongamos que estás desarrollando un sistema de gestión de documentos y necesitas un mecanismo para crear diferentes tipos de documentos, como documentos de texto y documentos HTML. Utilizaremos el patrón Factory Method para lograr esto:

'**Document**' es la interfaz del producto que define la operación create. Tenemos dos implementaciones concretas de '**Document**': '**TextDocument**' y '**HtmlDocument**'.

Luego, tenemos la interfaz '**DocumentCreator**', que es el Factory Method. Hay dos implementaciones concretas de este Factory Method: '**TextDocumentCreator**' y '**HtmlDocumentCreator**'. Cada uno de ellos proporciona una implementación específica del método '**createDocument**', que devuelve una instancia específica de '**Document**'.

El cliente ('**DocumentManager**') utiliza el Factory Method para crear instancias de documentos sin preocuparse por los detalles de implementación específicos del documento. Este enfoque permite la extensibilidad y el mantenimiento más sencillo, ya que puedes agregar nuevos tipos de documentos sin modificar el código cliente existente.

---
**Observacion**: Las clases no son publicas solo para el ejemplo, todas las clases e interfaces deberia ser archivos separados.
