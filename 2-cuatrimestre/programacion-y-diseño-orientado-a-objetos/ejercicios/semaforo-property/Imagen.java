import javax.swing.*;
import java.awt.*;
import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;

import java.util.*;
/**
 * Write a description of class Vista here.
 * 
 * @author Martin Villarreal 
 * @version 0.1
 */
public class Imagen extends JFrame implements PropertyChangeListener
{
    JLabel imagen1;
    JLabel imagen2;
    ImageIcon apagado;
    ImageIcon verde;
    ImageIcon rojo;
    
    public Imagen()
    {  apagado = new ImageIcon("peatones-apagado.png");
     verde = new ImageIcon("peatones-verde.gif");
    rojo = new ImageIcon("peatones-rojo.png");
    this.setSize(500, 500);   
    initComponents();
      this.setVisible(true);  
    }
   
    @Override
    public void propertyChange(PropertyChangeEvent evt) {
		
	Semaforo.ESTADO_SEMAFORO estado=(Semaforo.ESTADO_SEMAFORO)evt.getNewValue();
	switch (estado)
        { case VERDE:
                imagen1.setIcon(apagado);
                imagen2.setIcon(verde);
               
            break;
          case ROJO:
                imagen1.setIcon(rojo);
                imagen2.setIcon(apagado);
                
            break;   
        }
	   
	}
    
    
    
    public void initComponents()
    {   
        Container cp=this.getContentPane();
        cp.setLayout(new FlowLayout());
        imagen1=new JLabel(apagado);
        imagen2=new JLabel(apagado);
        imagen1.setOpaque(true);
        imagen2.setOpaque(true);
        cp.add(imagen1);
        cp.add(imagen2);
        this.pack();
    }
    
   
}
