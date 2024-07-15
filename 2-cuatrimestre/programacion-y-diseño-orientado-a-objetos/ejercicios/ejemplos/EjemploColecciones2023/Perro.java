

public class Perro implements Comparable
{
    private String nombre;
    private int edad;
    public Perro(String nombre,int edad)
    {
        this.nombre=nombre;
        this.edad=edad;
    }
    
    public String ladrar()
    { return "Guau!!!";
    }
    @Override
    public String toString()
    {
        return nombre+" "+edad;
    }
    
    public int compareTo(Object o)
    {   Perro otroPerro=(Perro)o;
        return this.nombre.compareTo(otroPerro.nombre);
    }
    public int getEdad()
    { return edad;
    }
}
