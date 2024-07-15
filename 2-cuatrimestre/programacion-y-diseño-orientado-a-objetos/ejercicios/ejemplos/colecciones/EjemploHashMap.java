import java.util.*;

public class EjemploHashMap
{
    public static void main(String[] args)
    {
        System.out.print('\u000C');
        Map<Integer, String> map = new LinkedHashMap<Integer, String>(); 
        //HashMap no tiene orden
        //LinkedHashMap mantiene el orden de insercion
map.put(3, "Fazio");    
map.put(2, "Mascherano");
map.put(11, "Di María");
map.put(4, "Otamendi");
map.put(9, "Icardi");    
map.put(5, "Banega");    
map.put(7, "Dybala");    
map.put(10, "Messi");
map.put(8, "Acosta");
map.put(6, "Biglia");
map.put(1, "Romero");    

// Imprimimos el Map con un Iterador
Iterator<Integer> it = map.keySet().iterator();
while(it.hasNext()){
  Integer key = it.next();
  System.out.println("Clave: " + key + " -> Valor: " + map.get(key));
}

map.remove(9);
System.out.println(map);
    }
}
