import java.util.List;
import java.util.ArrayList;
import java.util.Collections;

public class ListaEmpleados
{
    static List<Empleado> lista;//para que me queden alamacenados los empleados siempre

    //Constructor
    public ListaEmpleados()
    {
        lista = new ArrayList<>();
    }
    
    //Método para agregar propio
    public void addEmpleado(Empleado e)
    { 
        lista.add(e);
    }
    
    public void ordenarApellido()
    { 
        //Como era el Natural no hace falta explicitar el Criterio
        Collections.sort(lista);
    }

    public void ordenarNombre()
    { 
        //Acá sí hay que explicitar
        Collections.sort(lista, new NombreComparator());
    }

    public void ordenarSueldo()
    { 
        //Acá sí hay que explicitar
        Collections.sort(lista, new SueldoComparator());
    }

    public void listarApellido()
    {
        ordenarApellido();
        //Notación Lambda
        lista.forEach(x -> System.out.println(x));
    }

    public void listarNombre()
    {
        ordenarNombre();
        //Notación Lambda
        lista.forEach(x -> System.out.println(x));
    }

    public void listarSueldo()
    {
        ordenarSueldo();
        //Notación Lambda
        lista.forEach(x -> System.out.println(x));
    }

}