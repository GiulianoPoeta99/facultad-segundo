

public class Esfera extends SolidoRevolucion //herencia
{
    public Esfera(double radio)
    {
        super(radio);
    }
    
    public double getSuperficie()
    {
        return 4*Math.PI*Math.pow(radio,2);
    }
    
    public String toString()
    { 
        return "Esfera de radio "+radio+" y superficie "+getSuperficie();
    }
}
