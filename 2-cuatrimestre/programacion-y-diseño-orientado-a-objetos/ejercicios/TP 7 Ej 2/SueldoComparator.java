import java.util.*;
public class SueldoComparator implements Comparator<Empleado>
{
    @Override
    public int compare(Empleado a, Empleado b)
    {
        //*-1 para orden inverso (de mayor a menor)
        return (int)((a.getSueldo() - b.getSueldo())*-1);
    }
}