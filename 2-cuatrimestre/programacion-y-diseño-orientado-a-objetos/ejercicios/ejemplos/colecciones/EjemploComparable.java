import java.util.*;

public class EjemploComparable
{
    public static void main(String[] args)
    {
        System.out.print('\u000C');
        List<Persona2> pers=new ArrayList<>();
        pers.add(new Persona2(1,"Mario",140));
        pers.add(new Persona2(3,"Luigi",145));
        pers.add(new Persona2(2,"Honguito",120));
        for (Persona2 p:pers)
        {
            System.out.println(p);
        }
        Collections.sort(pers);
        System.out.println();
        for (Persona2 p:pers)
        {
            System.out.println(p);
        }
         Collections.sort(pers,new AlturaComparator());
         System.out.println();
        for (Persona2 p:pers)
        {
            System.out.println(p);
        }
        Collections.sort(pers,new IdComparator());
         System.out.println();
        for (Persona2 p:pers)
        {
            System.out.println(p);
        }
        
    }
}
