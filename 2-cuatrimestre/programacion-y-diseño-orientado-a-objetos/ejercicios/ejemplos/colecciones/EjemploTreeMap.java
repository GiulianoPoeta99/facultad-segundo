import java.util.*;

public class EjemploTreeMap
{
    public static void main(String[] args)
    {
        System.out.print('\u000C');
        Map<Integer, String> treeMap = new TreeMap<Integer, String>(); //mantiene elementos ordenados
treeMap.put(3, "Fazio");	
treeMap.put(2, "Mascherano");
treeMap.put(11, "Di María");
treeMap.put(4, "Otamendi");
treeMap.put(9, "Icardi");	
treeMap.put(5, "Banega");	
treeMap.put(7, "Dybala");	
treeMap.put(10, "Messi");
treeMap.put(8, "Acosta");
treeMap.put(6, "Biglia");
treeMap.put(1, "Romero");	


 
// Imprimimos el Map con un Iterador que ya hemos instanciado anteriormente
Iterator it = treeMap.keySet().iterator();
while(it.hasNext()){
  Integer key = (Integer)it.next();
  System.out.println("Clave: " + key + " -> Valor: " + treeMap.get(key));
}
    }
}
