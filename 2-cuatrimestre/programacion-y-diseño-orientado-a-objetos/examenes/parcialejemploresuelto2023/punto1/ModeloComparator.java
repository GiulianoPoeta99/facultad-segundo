package punto1;
import java.util.Comparator;



public class ModeloComparator implements Comparator
{
    public int compare(Object o1, Object o2)
    {
       Automovil a1=(Automovil)o1;
       Automovil a2=(Automovil)o2;
       return a1.getModelo().compareTo(a2.getModelo());
    }
}
