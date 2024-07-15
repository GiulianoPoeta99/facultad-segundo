

public abstract class Inmueble
{
    
    protected double m2;
    private static double valorM2=10;

    
    public Inmueble(double m2)
    {
        this.m2=m2;
    }

    public abstract double getValorAlquiler();
    
    public static void setValorM2(double vm2)
    { 
        valorM2=vm2;
    }
    
    public static double getValorM2()
    { return valorM2;
    }
}
