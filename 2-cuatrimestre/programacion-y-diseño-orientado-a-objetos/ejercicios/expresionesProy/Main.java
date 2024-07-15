
/**
 * Write a description of class Main here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
public class Main
{
   public static void main(String[] args)
   
   { //(4.5+2.3)*3.1
     Expresion a=new Operando(4.5);
     Expresion b=new Operando(2.3); 
     Expresion c=new Operando(3.1); 
     Expresion d=new Multiplicacion(new Suma(a,b),c);
     System.out.println(d.getValor());
     
   }
}
