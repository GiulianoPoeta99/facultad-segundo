import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class PVisual extends JPanel
{
    ///////////////////////
    //     VARIABLES     //
    ///////////////////////
    JPanel izq, der;
    ListaEmpleados emp;
    
    //    DEL PANEL IZQ    //
    JRadioButton jrbApellido,jrbNombre,jrbSalario;
    ButtonGroup bg;
    RbActionListener rbAL; 
    
    //    DEL PANEL DER    //
    JTextArea jtaResult;
    
    
    ///////////////////////
    //     PRINCIPAL     //
    ///////////////////////
    public PVisual(ListaEmpleados lista)//CONSTRUCTOR
    {
        izq=new JPanel();
        initIzq();
        der=new JPanel();
        initDer();
        emp=lista;
        
        this.add(izq);
        this.add(der);
    }
    ///////////////////////
    //        FIN        //
    ///////////////////////
    
    
    
    ///////////////////////
    //     IZQUIERDO     //
    ///////////////////////
    private void initIzq()
    {
        izq.setLayout(new BoxLayout(izq, BoxLayout.PAGE_AXIS));
        izq.setBackground(Color.cyan);
        
        jrbApellido=new JRadioButton("Apellido");
        jrbNombre=new JRadioButton("Nombre");
        jrbSalario=new JRadioButton("Salario");
        
        izq.add(jrbApellido);
        izq.add(jrbNombre);
        izq.add(jrbSalario);
        
        bg=new ButtonGroup();
        bg.add(jrbApellido);
        bg.add(jrbNombre);
        bg.add(jrbSalario);
        
        rbAL=new RbActionListener();
    }
    //
    private class RbActionListener implements ActionListener
    {
        public void actionPerformed(ActionEvent e)
        {
            JRadioButton rb=(JRadioButton)e.getSource();
            switch (rb.getText())
            {
               case "Apellido": 
                    porApellido();
                    break;    
               case "Nombre": 
                    porNombre();
                    break;
               case "Salario":
                    porSalario();
                    break;
            }
        }
    }
    ///////////////////////
    //        FIN        //
    ///////////////////////
    
    
    
    ///////////////////////
    //       DERECHO     //
    ///////////////////////
    private void initDer()
    {
        der.setLayout(new BoxLayout(der, BoxLayout.PAGE_AXIS));
        der.setBackground(Color.cyan);
        jtaResult=new JTextArea(400,200);
    }
    //
    private void porApellido()
    {
        emp.ordenarApellido();
        listar(); 
    }
    //
    private void porNombre()
    {
        emp.ordenarNombre();
        listar();
    }
    //
    private void porSalario()
    {
        emp.ordenarSueldo();
        listar();
    }
    //
    private void listar()
    {
        String listado = "";
        for (Empleado e: emp.lista)
        {
           listado += " "+e.toString()+", Sueldo: "+e.getSueldo()+"\n";
        }
        jtaResult.setText(listado); 
    }
    ///////////////////////
    //        FIN        //
    ///////////////////////
}