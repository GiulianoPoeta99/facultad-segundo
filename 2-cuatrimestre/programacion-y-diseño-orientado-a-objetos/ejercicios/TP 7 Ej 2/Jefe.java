public class Jefe extends Empleado
{
    //nombre, apellido y sueldo los heredo de Empleado
    
    public Jefe()
    {
        super();
    }
    
    public Jefe(String apellido, String nombre, double sueldo)
    {
        super(apellido, nombre, sueldo);
    }
    
    public double getSueldo()
    {
        //Resultado x Mes del sueldo fijo
        return (sueldo);
    }
}