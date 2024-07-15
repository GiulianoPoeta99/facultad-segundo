
import java.util.*;

/**
 * 
 */
public class Negativo extends OperacionUnaria {

    /**
     * Default constructor
     */
    public Negativo(Expresion e1) {
        super(e1);
    }

    /**
     * @return
     */
    public double getValor() {
        // TODO implement here
        return izquierda.getValor()*-1;
    }

}