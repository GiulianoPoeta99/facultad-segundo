package asiNO;



public class Circulo extends Punto //un Circulo no es un Punto 
{
    //no aplico el concepto de ocultamiento de informacion
    double radio;
    //no hacer esto
    double circunferencia;
    double diametro;
    double area;
    
    public Circulo(double x,double y, double radio)
    { super(x,y);
      this.radio=radio;
      //no hacer esto
      diametro=radio*2;
      circunferencia=2*Math.PI*radio;
      area=Math.PI*Math.sqrt(radio);
    }
    
    public void setRadio(double radio)
    {
        this.radio=radio;
        //esto hay que hacerlo porque cada vez que cambio el radio
        //tengo que volver a calcular todo
        //empeora cuando tengo mas variables involucradas en el calculo
        //tendria que hacer los calculos en cada uno de los "setAlgo..."
        diametro=radio*2;
        circunferencia=2*Math.PI*radio;
        area=Math.PI*Math.sqrt(radio);
    }
    
    public double getCircunferencia()
    {
        return circunferencia;
    }
    
    public double getDiametro()
    {
        return diametro;
    }
       
    public double getArea()
    {
        return area;
    }
    
    public String toString(){
    return super.toString()+" "+radio;
    }
}
