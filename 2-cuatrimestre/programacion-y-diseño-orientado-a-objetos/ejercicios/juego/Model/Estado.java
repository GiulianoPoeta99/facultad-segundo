
import java.util.*;

/**
 * 
 */
public abstract class Estado {

    /**
     * Default constructor
     */
    public Estado() {
    }


    /**
     * 
     */
    public void saltar() {
        //saltar alto
    }

    /**
     * @param per
     */
    public abstract void consumirHongo(Personaje per);

    /**
     * 
     */
    public void disparar() {}

    /**
     * @param per
     */
    public abstract void recibirDaño(Personaje per);

}
