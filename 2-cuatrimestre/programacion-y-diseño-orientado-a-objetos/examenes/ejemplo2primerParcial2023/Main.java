
public class Main
{
    public static void main(String[] args)
    {
      int[] billetes={500, 200, 100, 50, 20, 10, 5, 2, 1}; 
      int monto=1773;//Integer.valueOf(args[0]);
      int ind=0;
      while(monto>0)
      {
        int cant=monto/billetes[ind];
        monto=monto%billetes[ind];
        if (cant>0) 
        System.out.println(cant+(billetes[ind]<20?" monedas":" billetes")+" de "+billetes[ind]);
        
        ind++;
      }
      
    }
    
}
