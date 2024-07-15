import java.util.*;

public class ListasConGenerics
{
    
    public static void main(String[] args)
    {
        System.out.print('\u000C');
        List<String> lista=new ArrayList<>();
        lista.add("hola");
        lista.add("chau");
        lista.add("perro");
        lista.add("casa");
        Iterator<String> i=lista.iterator();
        
        System.out.println("lista");
        while (i.hasNext())
        { String s=i.next();//no es necesario hacer cast
          System.out.println(s);
        }
        System.out.println("");
        Collections.sort(lista);//ordeno
        
        System.out.println("lista ordenada");
        i=lista.iterator();
        while (i.hasNext())
        { String s=i.next();
          System.out.println(s);
        }
        System.out.println("");
        Collections.reverse(lista);//invierto el orden
        
         System.out.println("lista ordenada orden inverso");
        i=lista.iterator();
        while (i.hasNext())
        { String s=i.next();
          System.out.println(s);
        }
        System.out.println("");
        
        System.out.println("lista ordenada orden inverso for each");
        for (String s: lista)
        { 
          System.out.println(s);
        }
        System.out.println("");
    }

    
}
