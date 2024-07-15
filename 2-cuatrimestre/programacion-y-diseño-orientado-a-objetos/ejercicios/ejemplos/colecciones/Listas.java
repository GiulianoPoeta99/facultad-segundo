import java.util.*;

public class Listas
{
    
    public static void main(String[] args)
    {
        System.out.print('\u000C');//en Bluej borra la terminal
        List lista=new ArrayList();// SE PUEDE REEMPLAZAR POR "new LinkedList()" y el resto del codigo funciona igual
        lista.add("hola");
        lista.add("chau");
        lista.add("perro");
        lista.add("casa");
        Iterator i=lista.iterator();
        System.out.println("lista");
        while (i.hasNext())
        { String s=(String)i.next();
          System.out.println(s);
        }
        System.out.println("");
        Collections.sort(lista);//ordeno
        
        System.out.println("lista ordenada");
        i=lista.iterator();
        while (i.hasNext())
        { String s=(String)i.next();
          System.out.println(s);
        }
        System.out.println("");
        Collections.reverse(lista);//invierto el orden
        
         System.out.println("lista ordenada orden inverso");
        i=lista.iterator();
        while (i.hasNext())
        { String s=(String)i.next();
          System.out.println(s);
        }
        System.out.println("");
    }

    
}
