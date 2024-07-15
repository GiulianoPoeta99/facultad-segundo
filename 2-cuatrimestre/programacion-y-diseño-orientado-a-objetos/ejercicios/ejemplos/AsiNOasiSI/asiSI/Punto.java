package asiSI;


public class Punto
{
    //ocultamiento de la informacion
    private double x;
    private double y;
    
    public Punto(double x,double y)
    {
      this.x=x;
      this.y=y;
    }
    
    //publico solo los metodos accesores necesarios
    public double getX()
    { return x;
    }
    
    public double getY()
    { return y;
    }
    
     public String toString()
    { 
        return "( "+x+", "+y+")";
    }
}
