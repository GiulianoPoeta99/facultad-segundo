
import java.util.*;

/**
 * 
 */
public class Pequeño extends Estado {

    /**
     * Default constructor
     */
    public Pequeño() {
    }

    /**
     * 
     */
    public void saltar() {
        // saltar
    }

    /**
     * @param per
     */
    public void consumirHongo(Personaje per) {
        per.setEstado(new Grande());
    }

    
    /**
     * @param per
     */
    public  void recibirDaño(Personaje per){
    
    }

}
