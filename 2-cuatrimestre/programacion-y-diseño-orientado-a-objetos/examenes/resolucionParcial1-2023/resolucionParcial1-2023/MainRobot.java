import java.util.*;

public class MainRobot
{
   public static void main(String[] args)
   {
       List<Robot> lista=new ArrayList<>();
       for (int j=0;j<10;j++)
           lista.add(new Robot());
       
       Collections.sort(lista);
       for (Robot r:lista)
        System.out.println(r);
       
       System.out.println(); 
       
       int cont=0; 
       for (Robot r:lista) if (r.getVida()>50) cont++;
       System.out.println("el numero de robots con porcentaje de vida mayor que el 50% es "+cont);
       
       System.out.println(); 
       
       Collections.reverse(lista);
       for (int j=0;j<3;j++) 
        System.out.println(lista.get(j));
       
   }
}
