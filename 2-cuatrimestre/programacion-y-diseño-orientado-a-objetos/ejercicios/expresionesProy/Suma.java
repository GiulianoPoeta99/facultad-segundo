
import java.util.*;

/**
 * 
 */
public class Suma extends OperacionBinaria {

    /**
     * Default constructor
     */
    public Suma(Expresion e1,Expresion e2) {
        super(e1,e2);
    }

    /**
     * @return
     */
    public double getValor() {
        // TODO implement here
        return izquierda.getValor()+derecha.getValor();
    }

}