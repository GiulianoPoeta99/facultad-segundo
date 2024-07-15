import java.util.Arrays;

public class Main
{
    public static void main(String[] args)
    {
       int[] a={9,5,3,1,2,4,7,6,8};
       Arrays.sort(a);
       for (int j=0;j<a.length;j++)
       System.out.println(a[j]);
       
       Persona[] personas=new Persona[3];
       personas[0]=new Persona("Pedro",23);
       personas[1]=new Persona("Carlos",30);
       personas[2]=new Persona("Andres",45);
       
       Arrays.sort(personas);
       for (int j=0;j<personas.length;j++)
       System.out.println(personas[j]);
       
       Arrays.sort(personas,new EdadComparator());
       for (int j=0;j<personas.length;j++)
       System.out.println(personas[j]);
       
    }
}
