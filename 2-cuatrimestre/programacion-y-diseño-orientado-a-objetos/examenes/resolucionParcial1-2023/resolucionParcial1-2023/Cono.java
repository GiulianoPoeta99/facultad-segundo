
/**
 * Write a description of class Cono here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
public class Cono extends SolidoRevolucion
{
    private double altura;
    
    public Cono(double radio,double altura)
    {
        super(radio);
        this.altura=altura;
    }
    
    public double getSuperficie()
    {
        return Math.PI*Math.pow(radio,2)+Math.PI*radio*Math.sqrt(Math.pow(altura,2)+Math.pow(radio,2));
    }
    
    public String toString()
    { 
        return "Cono de radio "+radio+", altura "+altura+" y superficie "+getSuperficie();
    }
}
