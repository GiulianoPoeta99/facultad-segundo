
import java.util.*;

/**
 * 
 */
public class Queso extends Adicional {

    /**
     * Default constructor
     */
    public Queso(Producto producto) {
        super(producto);
    }public double getPrecio()
    {    
        return producto.getPrecio()+15;
    }
    public String getDescripcion()
    {
        return producto.getDescripcion()+"\ncon Queso";
    }
    
    

}