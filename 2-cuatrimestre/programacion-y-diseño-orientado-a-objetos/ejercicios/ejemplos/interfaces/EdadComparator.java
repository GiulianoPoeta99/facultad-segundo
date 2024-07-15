import java.util.Comparator;


public class EdadComparator implements Comparator
{
    public int compare(Object o1,Object o2)
    { Persona p=(Persona)o1;
      Persona p1=(Persona)o2;
      return p.getEdad()-p1.getEdad();
      
    }
}
