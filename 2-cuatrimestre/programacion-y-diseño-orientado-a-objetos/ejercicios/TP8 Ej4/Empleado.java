import java.io.Serializable;

public abstract class Empleado implements Comparable<Empleado>, Serializable
{
    //Atributos de un Empleado
    private String apellido, nombre;
    protected double sueldo;
    
    //Constructor
    public Empleado()
    {
        setApellido("null");
        setNombre("null");
        setSueldo(0);
    }
    
    public Empleado(String apellido, String nombre, double sueldo)
    {
        setApellido(apellido);
        setNombre(nombre);
        setSueldo(sueldo);
    }
    
    //Setters
    public void setApellido(String apellido)
    {
        this.apellido = apellido;
    }
    
    public void setNombre(String nombre)
    {
        this.nombre = nombre;
    }
    
    public void setSueldo(double sueldo)
    {
        this.sueldo = sueldo;
    }
    
    //Getters
    public String getApellido()
    {
        return apellido;
    }
    
    public String getNombre()
    {
        return nombre;
    }
    
    @Override
    public String toString()
    {
        return (apellido+", "+nombre)+"; ";
    }
    
    //Método Abstract
    abstract public double getSueldo();
    
    //Método que me provee la interfaz Comparable para comparar.
    //Éste queda como el comparador por defecto. Nos va a servir para ordenar.
    @Override
    public int compareTo(Empleado emp)
    {
        //Retorna <0 si el 2do es Mayor que el 1ero
        //Retorna =0 si el 2do es igual que el 1ero
        //Retorna >0 si el 2do es menor que el 1ero
        
        //Típico para String
        //return this.nombre.compareTo(objeto.nombre);
        
        //Típico para Nros
        //return (this.numero - objeto.numero);
        
        //Para forma inversa le ponemos (*-1)
        
        return this.apellido.compareTo(emp.apellido);
    }
}