import javax.swing.*;
import java.awt.*;

public class MiFrame extends JFrame
{
    static PCarga pc;
    static PVisual pv;
    static ListaEmpleados emp;
    static JTabbedPane jtp;
    
    public MiFrame()//CONSTRUCTOR
    {
        jtp=new JTabbedPane();
        emp=new ListaEmpleados();
        pc=new PCarga(emp);
        pv=new PVisual(emp);
        jtp.add("Carga", pc);
        jtp.add("Visual", pv);
        this.add(jtp);
    }
    //
    public static void main(String[] args)
    {
        MiFrame frame=new MiFrame();
        frame.setMinimumSize(new Dimension(550, 700));
        frame.setVisible(true);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    }
}   