import java.util.StringTokenizer;
import java.util.Scanner;

class PalabrasRepetidas{
 
    public static void main(String[] args) {
 
        Scanner miScanner = new Scanner(System.in);
        //Creamos un objeto de la clase //Scanner para leer por teclado
 
        System.out.println("Introduce una frase: ");
 
        String frase = miScanner.nextLine().toLowerCase();
        //Se almacena el texto 
        //introducido en la variable frase y pasa el texto todo a minúsculas
 
        StringTokenizer tok = new StringTokenizer(frase," ,;.!?0123456789");
        //Se crea el objeto tok 
        //de la clase StringTokenizer
 
        String palabraBuscar;
        //Variable que almacenará la palabra que queramos buscar
 
        int contador = 0;
        //Variable que almacena el número de veces que aparece la palabra
 
        System.out.print("Introduce la palabra a contar: ");
 
        palabraBuscar = miScanner.nextLine().toLowerCase();
        //Se introduce la palabra a buscar pasándola toda a minúscula
 
        
/*
Bucle while que se repetirá mientras que existan tokens. 
Dentro del bucle se crea un condicional if que compara si el elemento es igual a la palabra a buscar. En caso de que así se el contador aumentará en uno.
*/
        while(tok.hasMoreTokens()){
 
            if(tok.nextElement().equals(palabraBuscar)){
 
                contador++;
 
            }
 
        }
 
        System.out.println("....");
        System.out.println("La frase " + frase + "\n contiene " + contador +
 
                " veces la palabra " + palabraBuscar);
 
    }
 
}