package punto1;
import java.util.List;
import java.util.ArrayList;
import java.util.Collections;

/*
 * Prueba de la clase y sus comparadores, no hace falta para la resolucion
 * del ejercicio del parcial
 * solo se incluye a modo de ejemplo, para mostrar como se utilizan los comparadores
 */
public class Main
{

    public static void main(String[] args)
    {
        List<Automovil> lista=new ArrayList<>();
        lista.add(new Automovil("Ford","Escort",1995));
        lista.add(new Automovil("Renault","19",1979));
        lista.add(new Automovil("Fiat","127",1992));
        //lista.add(new Integer(9)); no deja
        
        Collections.sort(lista);
        System.out.println(lista);
        
        Collections.sort(lista,new ModeloComparator());
        System.out.println(lista);
        
        Collections.sort(lista,new AnioComparator());
        System.out.println(lista);
        
        
    }
}
