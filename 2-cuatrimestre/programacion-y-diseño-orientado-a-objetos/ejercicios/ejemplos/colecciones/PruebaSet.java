import java.util.Set;
import java.util.HashSet;


public class PruebaSet
{
   public static void main(String[] args)
   {
       Set<Persona2> conj=new HashSet<>();
       conj.add(new Persona2(1,"Mario",140));
       conj.add(new Persona2(3,"Luigi",145));
       boolean res=conj.add(new Persona2(1,"Honguito",120));
       System.out.println(res);
       System.out.println(conj);
       
       
       
   }
}
