
import java.util.*;

/**
 * 
 */
public abstract class OperacionUnaria extends Expresion {

    /**
     * Default constructor
     */
    public OperacionUnaria(Expresion e1) {
        izquierda=e1;
    }

    /**
     * 
     */
    protected Expresion izquierda;


   

}