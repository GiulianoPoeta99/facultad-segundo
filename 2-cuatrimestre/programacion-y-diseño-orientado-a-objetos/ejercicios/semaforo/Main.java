
/**
 * Write a description of class Main here.
 * 
 * @author Juan Manuel Rodriguez, Martin Villarreal 
 * @version 0.1
 */
public class Main
{
    public static void main(String args[])
    { Vista v=new Vista();
      Audible a=new Audible();
      Imagen i=new Imagen();
      
      Semaforo s=new Semaforo();
      
      s.addObserver(v);
      s.addObserver(a);
      s.addObserver(i);
      
      Controlador c=new Controlador();
      c.setSemaforo(s);
      c.start();
    }
}
