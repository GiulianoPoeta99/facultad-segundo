import java.util.*;

public class ListaObjeto
{
    
    public static void main(String[] args)
    {
        System.out.print('\u000C');//en Bluej borra la terminal
        List lista=new ArrayList();// SE PUEDE REEMPLAZAR POR "new LinkedList()" y el resto del codigo funciona igual
        lista.add("hola");
        lista.add("chau");
        lista.add("perro");
        lista.add("casa");
        lista.add(new Persona("Pedro"));
        Iterator i=lista.iterator();
        System.out.println("lista");
        while (i.hasNext())
        { Object s=i.next();
          System.out.println(s);
        }
        
    }
    
    public static class Persona
    { private String nombre;
        public Persona(String n)
        { nombre=n;
        }
        public String toString()
        { return nombre;
        }
    }
}
