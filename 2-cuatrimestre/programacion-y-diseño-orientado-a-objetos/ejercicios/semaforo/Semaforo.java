import java.util.*;
/**
 * Write a description of class Semaforo here.
 * 
 * @author Juan Manuel Rodriguez, Martin Villarreal 
 * @version 0.1
 */
public class Semaforo extends Observable
{
    // instance variables - replace the example below with your own
    enum ESTADO_SEMAFORO {ROJO,VERDE};
    ESTADO_SEMAFORO estado;
    
    public Semaforo()
    {
         estado=ESTADO_SEMAFORO.ROJO;
    }
    
    public synchronized void change()
    {
        switch (estado)
        {
            case ROJO:
               estado=ESTADO_SEMAFORO.VERDE;
            break;
            case VERDE:
               estado=ESTADO_SEMAFORO.ROJO;
            break;
        }
        setChanged();
        notifyObservers();
    }
    
    public ESTADO_SEMAFORO getEstado()
    {
        return estado;
    }
    
    public synchronized void setEstado(ESTADO_SEMAFORO estado)
    {
        this.estado=estado;
    }
    
}
