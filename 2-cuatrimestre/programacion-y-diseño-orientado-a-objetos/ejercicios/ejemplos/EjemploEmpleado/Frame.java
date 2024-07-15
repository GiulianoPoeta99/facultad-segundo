import javax.swing.*;
import java.awt.Container;
import java.awt.FlowLayout;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

public class Frame extends JFrame
{
    
    private JTextField ape,nom,dcontr,dcumple,mContr,mCumple,aContr,aCumple,resultado;
    private JButton btnAgregar,btnMostrarCumple;
    private Empleado empleado;
    public Frame()
    {
        ape=new JTextField(20);
        nom=new JTextField(20);
        dcontr=new JTextField(2);
        dcumple=new JTextField(2);
        mContr=new JTextField(2);
        mCumple=new JTextField(2);
        aContr=new JTextField(4);
        aCumple=new JTextField(4);
        resultado=new JTextField(20);
        btnAgregar=new JButton("agregar");
        btnMostrarCumple=new JButton("Cumple");
        Container c=this.getContentPane();
        c.setLayout(new FlowLayout());
        
        c.add(new JLabel("Apellido:"));
        c.add(ape);
        c.add(new JLabel("Nombre:"));
        c.add(nom);
        
        c.add(new JLabel("fecha contratación:"));
        c.add(dcontr);
        c.add(mContr);
        c.add(aContr);
        c.add(new JLabel("fecha cumpleaños:"));
        c.add(dcumple);
        c.add(mCumple);
        c.add(aCumple);
        c.add(btnAgregar);
        c.add(btnMostrarCumple);
        c.add(resultado);
        btnAgregar.addActionListener(a -> agrega());
        /*btnAgregar.addActionListener(new ActionListener(){
            public void actionPerformed(ActionEvent a)
            { agrega();}
        });*/
        btnMostrarCumple.addActionListener(new ActionListener(){
            public void actionPerformed(ActionEvent a)
            { muestraCumple();}
        });
    }
    private void muestraCumple()
    { resultado.setText(empleado.cadenaFechaCumpleanios());
    }
    private void agrega()
    {//leer de los jtextfields datos
        String apellido=ape.getText();
        String nombre=nom.getText();
        //nom,dcontr,dcumple,mContr,mCumple,aContr,aCumple,resultado
        String d=dcumple.getText();
        String m=mCumple.getText();
        String a=aCumple.getText();
        int d1=Integer.valueOf(d); //Integer.parseInt(d);
        int m1=Integer.valueOf(m);
        int a1=Integer.valueOf(a);
        
        int d2=Integer.valueOf(dcontr.getText());
        int m2=Integer.valueOf(mContr.getText());
        int a2=Integer.valueOf(aContr.getText());
    //crear objetos MiFecha
        MiFecha fcum=new MiFecha(d1,m1,a1);
        MiFecha fcontr=new MiFecha(d2,m2,a2);
    //crear Empleado
        empleado=new Empleado(apellido,nombre,fcontr,fcum);
    }
    public static void main(String[] args)
    {
        Frame f=new Frame();
        f.setSize(200,300);
        f.setVisible(true);
    }
}
