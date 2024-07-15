
/**
 * Write a description of class Controlador here.
 * 
 * @author Juan Manuel Rodriguez, Martin Villarreal 
 * @version 0.1
 */
public class Controlador
{
  private Semaforo semaforo;
  private Thread t;
  
  public void setSemaforo(Semaforo semaforo)
  {
      this.semaforo=semaforo;
  }
  
  public Semaforo getSemaforo()
  {
      return semaforo;
  }
  
  public void start()
  {   final Semaforo aux=semaforo;
      t=new Thread(new Runnable(){public void run(){
          try{
          while(true)
              {   aux.change();
                  Thread.currentThread().sleep(5000);
                 
              }
        } catch (InterruptedException e){}
          }});
      t.start();    
      
      
  }
   
 
}
