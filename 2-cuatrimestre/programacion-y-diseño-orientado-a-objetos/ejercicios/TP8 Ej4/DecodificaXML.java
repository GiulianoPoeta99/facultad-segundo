import java.beans.*;
import java.io.*;

public class DecodificaXML
{ 
    ListaEmpleados listaDes;
    
    public DecodificaXML()
    { 
        listaDes = new ListaEmpleados();
        
        try
        {
            Thread.currentThread().setContextClassLoader(getClass().getClassLoader());
            //linea necesaria en BlueJ
            
            FileInputStream f = new FileInputStream("C:/Temp/Empleados-xml.dat");
            XMLDecoder decoder = new XMLDecoder(f);
            
            listaDes  = (ListaEmpleados) decoder.readObject();
            System.out.println("Lista Decodificada: ");
            listaDes.listarApellido();
            System.out.println();
            decoder.close();
        }
        catch (IOException e) 
        {
            e.printStackTrace();
        }
    }
    
    public ListaEmpleados getLista()
    {
        return this.listaDes;
    }
}