
import java.util.*;

/**
 * 
 */
public class Tomate extends Adicional {

    /**
     * Default constructor
     */
    public Tomate(Producto producto) {
        super(producto);
    }

    public double getPrecio()
    {    
        return producto.getPrecio()+7;
    }
    public String getDescripcion()
    {
        return producto.getDescripcion()+"\ncon Tomate";
    }
}