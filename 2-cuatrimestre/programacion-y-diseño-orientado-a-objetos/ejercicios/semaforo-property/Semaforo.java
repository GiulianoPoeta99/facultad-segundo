import java.util.*;
import java.beans.PropertyChangeListener;
import java.beans.PropertyChangeSupport;
/**
 * Write a description of class Semaforo here.
 * 
 * @author Martin Villarreal 
 * @version 0.1
 */
public class Semaforo
{
    // instance variables - replace the example below with your own
    enum ESTADO_SEMAFORO {ROJO,VERDE};
    ESTADO_SEMAFORO estado;
    
    PropertyChangeSupport pcs = new  PropertyChangeSupport(this);
    
    public void addObserver(PropertyChangeListener l) 
    {
		pcs.addPropertyChangeListener("estadoSemaforo", l);
    }
    
    public Semaforo()
    {
         estado=ESTADO_SEMAFORO.ROJO;
    }
    
    public void change()
    {   ESTADO_SEMAFORO old=estado;
        switch (estado)
        {
            case ROJO:
               estado=ESTADO_SEMAFORO.VERDE;
            break;
            case VERDE:
               estado=ESTADO_SEMAFORO.ROJO;
            break;
        }
        pcs.firePropertyChange("estadoSemaforo", old, estado);
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
