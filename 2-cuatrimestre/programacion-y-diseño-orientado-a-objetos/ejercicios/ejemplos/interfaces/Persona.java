

public class Persona implements Comparable
{
    // instance variables - replace the example below with your own
    private String nombre;
    private int edad;
    
    public Persona(String nombre,int edad)
    { this.nombre=nombre;
      this.edad=edad;  
    }
    
    public int compareTo(Object o)
    {
        Persona p=(Persona)o;
        return this.nombre.compareTo(p.nombre);
        
    }
    
    public int getEdad()
    { return edad;
    }
    public String toString()
    { return nombre+" "+edad;
    }
}
