package asiNO;



public class Punto
{
    double x;
    double y;
  
    public Punto(double x,double y)
    {
      this.x=x;
      this.y=y;
    }
    
    public String toString()
    { 
        return "( "+x+", "+y+")";
    }
}
