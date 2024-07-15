import java.util.*;
import java.awt.*;
/**
 * Write a description of class Audible here.
 * 
 * @author Juan Manuel Rodriguez, Martin Villarreal 
 * @version 0.1
 */
public class Audible implements Observer
{ Thread t=null; 

   public void update(Observable o,Object ob)
   {   
        Semaforo s=(Semaforo)o;
        Semaforo.ESTADO_SEMAFORO estado=s.getEstado();
         
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
