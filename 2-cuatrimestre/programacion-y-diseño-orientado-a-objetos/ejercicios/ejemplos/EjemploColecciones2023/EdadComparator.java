import java.util.Comparator;

public class EdadComparator implements Comparator
{
   public int compare(Object o1,Object o2)
   { Perro p1=(Perro)o1;
     Perro p2=(Perro)o2;
     return p1.getEdad()-p2.getEdad();
   }
}
