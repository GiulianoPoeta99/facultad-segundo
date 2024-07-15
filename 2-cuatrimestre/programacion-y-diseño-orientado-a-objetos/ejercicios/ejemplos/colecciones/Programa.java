import java.util.HashSet;
import java.util.Set;
import java.util.SortedSet;
import java.util.TreeSet;
 
public class Programa  {
    public static void main (String []args)      {
        System.out.print('\u000C');
        Set<Persona> set = new HashSet<Persona>();
        SortedSet<Persona> sset = new TreeSet<Persona>();
        Persona p = new Persona(1,"Marta",165);
        set.add(p);
        sset.add(p);
        p = new Persona(2,"Elena",155);
        set.add(p);
        sset.add(p);
        p = new Persona(3,"María",170);
        set.add(p);
        sset.add(p);
        
        //creo un nuevo objeto, pero representa la misma persona que el primer objeto
        p=new Persona(1,"Marta",165); 
        set.add(p);
        sset.add(p);
        
        System.out.println("Personas en el conjunto: "+set);
        System.out.println("Personas en el conjunto ordenado: "+sset);
    }
}