
import java.util.*;

public class AlturaComparator implements Comparator
{
   public int compare(Object o1, Object o2)
   { Persona2 p1=(Persona2)o1;
     Persona2 p2=(Persona2)o2;
     return p1.getAltura()-p2.getAltura();
   }
}
