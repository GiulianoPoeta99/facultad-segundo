
public class Cilindro extends SolidoRevolucion
{
   
    private double altura;//ocultamiento de la informacion

    public Cilindro(double radio,double altura)
    {
        super(radio);
        this.altura=altura;
    }

    
    public double getSuperficie()
    {
        return 2*Math.PI*radio*(altura+radio);
    }
    
    public String toString()
    { 
        return "Cilindro de radio "+radio+", altura "+altura+" y superficie "+getSuperficie();
    }
}
