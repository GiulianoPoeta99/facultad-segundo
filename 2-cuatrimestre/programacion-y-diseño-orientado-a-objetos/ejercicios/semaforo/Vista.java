import javax.swing.*;
import java.awt.*;
import java.util.*;
/**
 * Write a description of class Vista here.
 * 
 * @author Juan Manuel Rodriguez, Martin Villarreal 
 * @version 0.1
 */
public class Vista extends JFrame implements Observer
{
    JTextField texto;
    
    public Vista()
    { initComponents();
      this.setVisible(true);  
    }
   
    
    
    public void update(Observable o,Object ob)
    {
        Semaforo s=(Semaforo)o;
        Semaforo.ESTADO_SEMAFORO estado=s.getEstado();
        switch (estado)
        { case VERDE:
                texto.setBackground(Color.GREEN);
            break;
          case ROJO:
                 texto.setBackground(Color.RED);
            break;   
        }
    
    }
    
    public void initComponents()
    {   Container cp=this.getContentPane();
        cp.setLayout(new FlowLayout());
        texto=new JTextField(4);
        cp.add(texto);
        
        this.pack();
    }
    
   
}
