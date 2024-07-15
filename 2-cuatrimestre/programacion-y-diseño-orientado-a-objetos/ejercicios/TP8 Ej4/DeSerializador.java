import java.io.*;
import java.util.*;

public class DeSerializador
{
    ListaEmpleados listaDes;
    
    public DeSerializador()
    {
        listaDes = new ListaEmpleados();
        
        try
        { 
            //Flujo de datos
            /*Usamos la misma ruta en donde almacenamos el objeto serializado*/
            FileInputStream f = new FileInputStream("C:/Temp/Empleados.dat");
            ObjectInputStream s = new ObjectInputStream(f);
            
            //Objeto que viaja por el flujo de datos
            listaDes = (ListaEmpleados) s.readObject();
            s.close();
        
            //Comprobamos que lo haya DeSerializado bien
            System.out.println("Lista DeSerializada: ");
            listaDes.listarApellido();
            System.out.println();
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
    
    public ListaEmpleados getLista()
    {
        return this.listaDes;
    }
}