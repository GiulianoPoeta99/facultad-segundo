public class Comision extends Empleado
{
    //nombre, apellido y sueldo los heredo de Empleado
    private double porcentaje = 20;
    private double cantVentas;
    
    public Comision()
    {
        super();
    }
    
    public Comision(String apellido, String nombre, double sueldo, double cantVentas)
    {
        super(apellido, nombre, sueldo);
        setCantidad(cantVentas);
    }
    
    public void setCantidad(double cantVentas)
    {
        this.cantVentas = cantVentas;
    }
    
    public double getSueldo()
    {
        //Resultado x Mes de sueldo + porcentaje x ventas
        return (sueldo+((cantVentas*porcentaje)/100));
    }
}