import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class PCarga extends JPanel
{
    ///////////////////////
    //     VARIABLES     //
    ///////////////////////
    JPanel izq, cent, der;
    ListaEmpleados emp;
    
    //    DEL PANEL IZQ    //
    JRadioButton jrbJefe,jrbComision,jrbSubordinado,jrbPorHora;
    ButtonGroup bg;
    RbActionListener rbAL; 

    //    DEL PANEL CENT   //
    JPanel jpJefe, jpComision, jpSubordinado, jpPorHora;
    JLabel jlNombre, jlApellido, jlSalario, jlVentas, jlCantPiezas, jlHoras, jlHorasEx;
    JTextField jtfNombre, jtfApellido, jtfSalario, jtfVentas, jtfCantPiezas, jtfHoras, jtfHorasEx;
    JButton jbAgregar;
    
    //    DEL PANEL DER    //
    JTextArea jtaResult;
    
    ///////////////////////
    //     PRINCIPAL     //
    ///////////////////////
    public PCarga(ListaEmpleados lista)//CONSTRUCTOR
    {
        izq=new JPanel();
        initIzq();
        cent=new JPanel();
        initCent();
        der=new JPanel();
        initDer();
        emp=lista;
        
        this.setLayout(new GridLayout(1, 3));
        this.setBackground(Color.cyan);
        this.add(izq);
        this.add(cent);
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
        //en lugar de Y_AXIS(arriba a abajo) y X_AXIS(izquierda a derecha)
        //usar     PAGE_AXIS              y LINE_AXIS 
        izq.setLayout(new BoxLayout(izq, BoxLayout.PAGE_AXIS)); //(container, eje)
        izq.setBackground(Color.cyan);
        
        //Agrego los componentes
        jrbJefe=new JRadioButton("Jefe");
        jrbComision=new JRadioButton("A comisión");
        jrbSubordinado=new JRadioButton("Subordinado");
        jrbPorHora=new JRadioButton("Por Hora");
        
        /* No me deja agregar una clase sea BGroup
        BC b=new BC();
        this.add(b);
        */
       
        /* Si se puede agregar una clase que sea JPanel
        PCCentral pc=new PCCentral();
        this.add(pc);
        */
        
        /*Solución obtenida... (no era lo que quería)*/
        //Add botones al panel
        izq.add(jrbJefe);
        izq.add(jrbComision);
        izq.add(jrbSubordinado);
        izq.add(jrbPorHora);
        
        //Los añado a un BottonGroup para que se excluyan entre sí al accionar
        bg=new ButtonGroup();
        bg.add(jrbJefe);
        bg.add(jrbComision);
        bg.add(jrbSubordinado);
        bg.add(jrbPorHora);
        
        //La Lógica de los botones ya la tienen incorporada en la inner class de abajo
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
               case "Jefe": 
                    jpJefe.setVisible(true);
                    break;    
               case "A comisión": 
                    jpComision.setVisible(true);
                    break;
               case "Subordinado":
                    jpSubordinado.setVisible(true);
                    break;
               case "Por Hora":
                    jpPorHora.setVisible(true);
                    break;
            }
        }
    }
    ///////////////////////
    //        FIN        //
    ///////////////////////
    
    
    
    ///////////////////////
    //      CENTRO       //
    ///////////////////////
    private void initCent()
    {
        jpJefe=new JPanel();
        initJefe();
        jpComision=new JPanel();
        initCom();
        jpSubordinado=new JPanel();
        initSub();
        jpPorHora=new JPanel();
        initPHora();
        
        jbAgregar=new JButton("Agregar");
        
        cent.setLayout(new BoxLayout(cent, BoxLayout.PAGE_AXIS)); //(container, eje)
        cent.setBackground(Color.cyan);
        cent.add(jpJefe);
        cent.add(jpComision);
        cent.add(jpSubordinado);
        cent.add(jpPorHora);
        cent.add(jbAgregar);
        
        jpJefe.setVisible(false);
        jpComision.setVisible(false);
        jpSubordinado.setVisible(false);
        jpPorHora.setVisible(false);
        jbAgregar.addActionListener(evt -> agregar());
    }
    //
    private void initBasico(JPanel p)
    {
        p.setLayout(new BoxLayout(p, BoxLayout.PAGE_AXIS));
        p.setBackground(Color.cyan);
        
        jlNombre=new JLabel("Nombre");
        jtfNombre=new JTextField(10);
        jlApellido=new JLabel("Apellido");
        jtfApellido=new JTextField(10);
        
        p.add(jlNombre);
        p.add(jtfNombre);
        p.add(jlApellido);
        p.add(jtfApellido);
    }
    //
    private void initJefe()
    {
        initBasico(jpJefe);
        jlSalario=new JLabel("Salario");
        jtfSalario=new JTextField(10);
        jpJefe.add(jlSalario);
        jpJefe.add(jtfSalario);
    }
    //
    private void initCom()
    {
        initBasico(jpComision);
        jlSalario=new JLabel("Salario");
        jtfSalario=new JTextField(10);
        jlVentas=new JLabel("Ventas");
        jtfVentas=new JTextField(10);
        jpComision.add(jlSalario);
        jpComision.add(jtfSalario);
        jpComision.add(jlVentas);
        jpComision.add(jtfVentas);
    }
    //
    private void initSub()
    {
        initBasico(jpSubordinado);
        jlCantPiezas=new JLabel("Cantidad Piezas");
        jtfCantPiezas=new JTextField(10);
        jpSubordinado.add(jlCantPiezas);
        jpSubordinado.add(jtfCantPiezas);
    }
    //
    private void initPHora()
    {
        initBasico(jpPorHora);
        jlHoras=new JLabel("Horas");
        jtfHoras=new JTextField(10);
        jlHorasEx=new JLabel("Horas Extras");
        jtfHorasEx=new JTextField(10);
        jpPorHora.add(jlHoras);
        jpPorHora.add(jtfHoras);
        jpPorHora.add(jlHorasEx);
        jpPorHora.add(jtfHorasEx);
    }
    //
    private void agregar()
    {
        Empleado e=null;
        String ape=jtfApellido.getText();
        String nom=jtfNombre.getText();

        if (jrbJefe.isSelected())
        {  
           if (jtfSalario.getText().length()==0){
               jtfSalario.setText("0");
           }
           String salario=jtfSalario.getText();                    
           e=new Jefe(ape,nom,Double.parseDouble(salario));    
        }
        else if (jrbComision.isSelected())
        {
           if (jtfSalario.getText().length()==0){
               jtfSalario.setText("0");}
           String salario=jtfSalario.getText();
           if (jtfVentas.getText().length()==0){
               jtfVentas.setText("0");}
           String ventas=jtfVentas.getText();
           e=new Comision(ape,nom,Double.parseDouble(salario),Double.parseDouble(ventas));
        }
        else if (jrbSubordinado.isSelected())
        {
           if (jtfCantPiezas.getText().length()==0){
               jtfCantPiezas.setText("0");}
           String cantPiezas=jtfCantPiezas.getText();
           e=new Subordinado(ape,nom,Integer.parseInt(cantPiezas));
        }
        else if (jrbPorHora.isSelected())
        {
           if (jtfHoras.getText().length()==0){
               jtfHoras.setText("0");}
           String horas=jtfHoras.getText();
           if (jtfHorasEx.getText().length()==0){
               jtfHorasEx.setText("0");}
           String horasEx=jtfHorasEx.getText();
           e=new PorHora(ape,nom,Integer.parseInt(horas),Integer.parseInt(horasEx));
        }
        
        emp.addEmpleado(e);
        listarEmp();
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
    private void listarEmp()
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