import java.io.*;
import java.util.*;

public class Serializador
{
    public Serializador(ListaEmpleados lista)
    {
        try 
        {
            //Flujo de datos
            /*Lo voy a almacenar como un txt*/
            FileOutputStream f = new FileOutputStream("C:/Temp/Empleados.dat");
            ObjectOutputStream s = new ObjectOutputStream(f);
            
            //Objeto que viaja por el flujo de datos
            s.writeObject(lista);
            s.close();
            
            System.out.println("Lista Serializada con exito.");
            System.out.println();
        } 
        catch(IOException e)
        {
            e.printStackTrace();
        }
    }
}