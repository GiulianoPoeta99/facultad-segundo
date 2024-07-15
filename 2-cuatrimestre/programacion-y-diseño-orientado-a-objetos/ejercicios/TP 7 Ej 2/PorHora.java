public class PorHora extends Empleado
{
    //nombre, apellido y sueldo los heredo de Empleado
    private double pago = 20;
    private int horas, horasEx;
    
    public PorHora()
    {
        super();
    }
    
    public PorHora(String apellido, String nombre, int horas, int horasEx)
    {
        super(apellido, nombre, 0);
        this.horas = horas;
        this.horasEx = horasEx;
    }
    
    public double getSueldo()
    {
        return ((pago*horas)+(horasEx*pago));
    }
}