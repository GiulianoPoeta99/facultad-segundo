import java.util.*;
public class IdComparator implements Comparator<Persona2>
{
    public int compare(Persona2 p1,Persona2 p2)
    {
        return p1.getIdPersona()-p2.getIdPersona();
    }
}
