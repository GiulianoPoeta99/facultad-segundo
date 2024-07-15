import java.util.*;

public class Paquete extends Producto
{
    private List<Producto> prodP;
    
    public Paquete()
    { prodP=new ArrayList<>();
    }
    
    public void add(Producto p)
    {
        prodP.add(p);
    }
    
    public double getValor()
    {   double total=0;
        for(Producto p:prodP)
            total+=p.getValor();
        return total-total*5/100;
    }
}
