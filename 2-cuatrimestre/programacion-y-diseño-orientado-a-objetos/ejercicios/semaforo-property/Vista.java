import javax.swing.*;
import java.awt.*;
import java.util.*;
import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;
/**
 * Write a description of class Vista here.
 * 
 * @author Martin Villarreal 
 * @version 0.1
 */
public class Vista extends JFrame implements PropertyChangeListener
{
    JTextField texto;
    
    public Vista()
    { initComponents();
      this.setVisible(true);  
    }
   
    
    
    @Override
    public void propertyChange(PropertyChangeEvent evt) {
		
	Semaforo.ESTADO_SEMAFORO estado=(Semaforo.ESTADO_SEMAFORO)evt.getNewValue();
	
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
