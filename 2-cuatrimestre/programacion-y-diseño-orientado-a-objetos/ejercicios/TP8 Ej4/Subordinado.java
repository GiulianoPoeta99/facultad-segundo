public class Subordinado extends Empleado
{
    //nombre, apellido y sueldo los heredo de Empleado
    private double pagoArticulo = 300;
    private int nroArticulos;
    
    public Subordinado()
    {
        super();
    }
    
    public Subordinado(String apellido, String nombre, int nroArticulos)
    {
        super(apellido, nombre, 0);
        this.nroArticulos = nroArticulos;
    }
    
    public double getSueldo()
    {
        //Resultado x Cantidad de Articulos Producidos
        return (nroArticulos*pagoArticulo);
    }
}