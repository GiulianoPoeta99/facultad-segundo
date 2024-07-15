import java.util.*;
public class NombreComparator implements Comparator<Empleado>
{
    @Override
    public int compare(Empleado a, Empleado b)
    {
        return a.getNombre().compareTo(b.getNombre());
    }
}