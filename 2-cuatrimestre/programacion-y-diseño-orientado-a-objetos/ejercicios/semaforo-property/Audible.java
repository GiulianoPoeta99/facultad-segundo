import java.util.*;
import java.awt.*;
import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;
/**
 * Write a description of class Audible here.
 * 
 * @author  Martin Villarreal 
 * @version 0.1
 */
public class Audible implements PropertyChangeListener
{ Thread t=null; 

   @Override
    public void propertyChange(PropertyChangeEvent evt) {
		
	Semaforo.ESTADO_SEMAFORO estado=(Semaforo.ESTADO_SEMAFORO)evt.getNewValue();
        switch (estado)
        { case VERDE:
                t=new Thread(new Runnable(){public void run(){
                     try{
                     while (true)   
                     {
                     Toolkit.getDefaultToolkit().beep();
                     Thread.currentThread().sleep(1000);
                    }
                    } catch (InterruptedException e){}
                    }});
                t.start();
                   
            break;
          case ROJO:
                 if (null!=t) t.interrupt();
          break;
        
              
        }
       
   }
}
