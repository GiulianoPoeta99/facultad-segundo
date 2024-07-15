import java.util.Comparator;


public class EdadComparatorG implements Comparator<Perro>
{
    public int compare(Perro p1,Perro p2)
   { 
     return p1.getEdad()-p2.getEdad();
   }
}
