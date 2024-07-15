import java.beans.*;
import java.io.*;

public class CodificaXML
{
    public CodificaXML(ListaEmpleados lista)
    {
        Thread.currentThread().setContextClassLoader(getClass().getClassLoader());
        // ^ linea necesaria en BlueJ
        
        try
        {
            FileOutputStream f = new FileOutputStream("C:/Temp/Empleados-xml.dat");
            XMLEncoder encoder = new XMLEncoder(f);
            
            encoder.writeObject(lista);
            encoder.close();
            f.close();
            
            System.out.println("Lista Codificada con exito.");
            System.out.println();
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }
    }
}