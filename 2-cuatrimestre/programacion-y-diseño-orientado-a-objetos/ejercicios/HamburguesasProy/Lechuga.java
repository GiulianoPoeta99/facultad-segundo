
import java.util.*;

/**
 * 
 */
public class Lechuga extends Adicional {

    /**
     * Default constructor
     */
    public Lechuga(Producto producto) {
      super(producto);
    }

    public double getPrecio()
    {    
        return producto.getPrecio()+5;
    }
    public String getDescripcion()
    {
        return producto.getDescripcion()+"\ncon Lechuga";
    }
}