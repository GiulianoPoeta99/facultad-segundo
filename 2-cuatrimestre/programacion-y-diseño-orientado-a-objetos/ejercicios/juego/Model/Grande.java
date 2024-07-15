
import java.util.*;

/**
 * 
 */
public class Grande extends Estado {

    /**
     * Default constructor
     */
    public Grande() {
    }

    /**
     * @param per
     */
    public void consumirHongo(Personaje per)
    { per.setEstado(new Fuego());
    }

    /**
     * @param per
     */
    public void recibirDaño(Personaje per){ 
    per.setEstado(new Pequeño());
    }

}
