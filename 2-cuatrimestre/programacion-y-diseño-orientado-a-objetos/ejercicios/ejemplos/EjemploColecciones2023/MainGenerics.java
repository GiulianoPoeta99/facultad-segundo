import java.util.*;
import java.util.ArrayList;
import java.util.Iterator;

/**
 * Write a description of class MainGenerics here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class MainGenerics
{
     public static void main(String[] args)
    {
       List<Perro> mascotas=new ArrayList<>();
       
       mascotas.add(new Perro("Sultan",2));
       mascotas.add(new Perro("Capitan",1));
       mascotas.add(new Perro("Firulais",4));
       
       System.out.println(mascotas);
       Perro firu=mascotas.get(2);
       System.out.println(firu);
       System.out.println("con iterator");
       Iterator<Perro> i=mascotas.iterator();
       while (i.hasNext())
       {
           Perro p=i.next();
           System.out.println(p+" "+p.ladrar());
       }
       System.out.println("con for");
       for(int j=0;j<mascotas.size();j++)
       {   Perro p=mascotas.get(j);
           System.out.println(p+" "+p.ladrar());
       }
       System.out.println("con for each");
       for(Perro p:mascotas)
       {
           
           System.out.println(p+" "+p.ladrar());
       }
       
       Collections.sort(mascotas);
       System.out.println(mascotas);
       //mascotas.remove(firu);
       //System.out.println(mascotas);
       Collections.sort(mascotas,new EdadComparatorG());
       System.out.println(mascotas);
       
       Collections.sort(mascotas,new Comparator<Perro>()
       {public int compare(Perro p1,Perro p2)
        { 
          return (p1.getEdad()-p2.getEdad())*-1;
        }
       });
       System.out.println(mascotas);
    }
}
