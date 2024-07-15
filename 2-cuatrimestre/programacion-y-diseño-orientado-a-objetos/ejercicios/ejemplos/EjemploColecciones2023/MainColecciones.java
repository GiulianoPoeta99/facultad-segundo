import java.util.*;

public class MainColecciones
{
    public static void main(String[] args)
    {
       List mascotas=new ArrayList();
       
       mascotas.add(new Perro("Sultan",2));
       mascotas.add(new Perro("Capitan",1));
       mascotas.add(new Perro("Firulais",4));
       
       System.out.println(mascotas);
       Perro firu=(Perro)mascotas.get(2);
       System.out.println(firu);
       System.out.println("con iterator");
       Iterator i=mascotas.iterator();
       while (i.hasNext())
       {
           Perro p=(Perro)i.next();
           System.out.println(p+" "+p.ladrar());
       }
       System.out.println("con for");
       for(int j=0;j<mascotas.size();j++)
       {   Perro p=(Perro)mascotas.get(j);
           System.out.println(p+" "+p.ladrar());
       }
       System.out.println("con for each");
       for(Object p:mascotas)
       {
           Perro q=(Perro)p;
           System.out.println(q+" "+q.ladrar());
       }
       
       Collections.sort(mascotas);
       System.out.println(mascotas);
       //mascotas.remove(firu);
       //System.out.println(mascotas);
       Collections.sort(mascotas,new EdadComparator());
       System.out.println(mascotas);
       
       Collections.sort(mascotas,new Comparator()
       {public int compare(Object o1,Object o2)
        { Perro p1=(Perro)o1;
          Perro p2=(Perro)o2;
          return (p1.getEdad()-p2.getEdad())*-1;
        }
       });
       System.out.println(mascotas);
    }
}
