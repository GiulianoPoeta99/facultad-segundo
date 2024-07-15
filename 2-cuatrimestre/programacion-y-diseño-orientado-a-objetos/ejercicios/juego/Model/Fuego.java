
import java.util.*;

/**
 * 
 */
public class Fuego extends Estado {

    /**
     * Default constructor
     */
    public Fuego() {
    }

    /**
     * 
     */
    public void disparar() {
        // dispara
    }

    /**
     * @param per
     */
    public abstract void consumirHongo(Personaje per){}

    /**
     * @param per
     */
    public abstract void recibirDaño(Personaje per)
    { per.setEstado(new Grande());
    }

}
