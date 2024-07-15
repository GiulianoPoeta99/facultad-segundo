
import java.util.*;

/**
 * 
 */
public abstract class OperacionBinaria extends OperacionUnaria {

    /**
     * Default constructor
     */
    public OperacionBinaria(Expresion e1,Expresion e2) {
        super(e1);
        derecha=e2;
    }

    /**
     * 
     */
    protected Expresion derecha;

}