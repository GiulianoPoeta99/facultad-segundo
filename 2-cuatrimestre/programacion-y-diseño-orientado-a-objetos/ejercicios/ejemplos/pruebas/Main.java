/**
 * La clase Main inicia la ejecución del programa
 * tiene que ser public y contener el método
 * public static void main(String[] args)
 */

public class Main
{
   /**
    * método de clase que inicia la ejecución del programa
    */
    public static void main(String[] args)
   {
      
     CuentaBancaria cb=new CuentaBancaria();//crea cuenta bancaria con saldo en cero
     cb.deposito(200);//deposita 200
     System.out.println(cb.getSaldo());//consulta el saldo
     CuentaBancaria cb2=new CuentaBancaria(300);//crea cuenta bancaria con saldo inicial de 300
     System.out.println(cb2.getSaldo());//consulta el saldo
   }
}
