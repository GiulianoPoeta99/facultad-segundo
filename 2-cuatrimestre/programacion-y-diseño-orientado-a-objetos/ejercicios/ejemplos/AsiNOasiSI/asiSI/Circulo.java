package asiSI;

public class Circulo
{
    
    private Punto punto; //el circulo ahora tiene un Punto (no es un punto)
    private double radio;

    public Circulo(double x,double y, double radio)
    {  this.punto=new Punto(x,y);
       this.radio=radio;
       
    }
    
    public Circulo(Punto punto, double radio) //sobrecargo el constructor
    {  this.punto=punto;
       this.radio=radio;
       
    }
    
    public void setRadio(double radio)
    {
        this.radio=radio;
        
    }
    
    public double getCircunferencia()
    {
        return 2*Math.PI*radio;
    }
    
    public double getDiametro()
    {
        return radio*2;
    }
       
    public double getArea()
    {
        return Math.PI*Math.sqrt(radio);
    }
    
    public String toString(){
    return punto+" "+radio;
    }
}
