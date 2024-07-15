
import java.util.*;

/**
 * 
 */
public class Personaje {

    /**
     * Default constructor
     */
    public Personaje() {
    }

    /**
     * 
     */
    private Estado estado;

    /**
     * 
     */
    public void saltar() {
       estado.saltar();
    }

    /**
     * 
     */
    public void consumirHongo() {
        estado.consumirHongo(this);
    }

    /**
     * 
     */
    public void recibirDaño() {
        estado.recibirDaño(this);
    }

    /**
     * 
     */
    public void disparar() {
        estado.disparar();
    }

    /**
     * @param estado
     */
    public void setEstado(Estado estado) {
        this.estado=estado;
    }

}
