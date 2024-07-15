
import java.util.*;

/**
 * 
 */
public class Jamon extends Adicional {

    /**
     * Default constructor
     */
    public Jamon(Producto producto) {
        super(producto);
    }
    
    public double getPrecio()
    {    
        return producto.getPrecio()+10;
    }
    public String getDescripcion()
    {
        return producto.getDescripcion()+"\ncon Jamon";
    }

}