import java.awt.*;
import javax.swing.*;
import java.awt.event.*;

public class MiFrame extends JFrame
{
    private JTextField jtfTexto;
    private JButton boton;
    private Empresa empresa;
    
    public MiFrame()
    {
        super("mi frame que anda");
        initComponents();
        
    }
    
    public void initComponents()
    {
        jtfTexto=new JTextField(10);
        boton=new JButton("OK");
        Container cp=getContentPane();
        cp.setLayout(new FlowLayout());
        cp.add(jtfTexto);
        cp.add(boton);
        /*boton.addActionListener(new ActionListener(){
            public void actionPerformed(ActionEvent e)
            {
                jtfTexto.setText("Ahora si");
            }
        });*/
        boton.addActionListener(new AL());
    }
        
    public static void main(String []args)
    { 
        MiFrame mf=new MiFrame();
        mf.setSize(200,300);
        mf.setVisible(true);
    }
   
    private class AL implements ActionListener
    {
        public void actionPerformed(ActionEvent evt)
        {
            jtfTexto.setText("Ahora si");
        }
    }
}
