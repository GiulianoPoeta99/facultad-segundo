/**
 * Clase que modela una cuenta bancaria
 */

public class CuentaBancaria
{
    //variable estática, de clase
    /**
     * mantiene el último número de cuenta bancaria asignado
     */
    private static int proxNroCta=0;
    //variables de instancia
    private double saldo;
    private int nroCuenta;
    
    //constructor sin parámetros 
    public CuentaBancaria()
    { 
        nroCuenta=++proxNroCta;
    }
    
   /**
    * constructor con parametros
    * @param platita saldo inicial de la cuenta
    */
    public CuentaBancaria(double platita)
    { 
        nroCuenta=++proxNroCta;
        deposito(platita);
    }
   
    public void deposito(double platita)
    { saldo+=platita;
    }
    //metodos accesores
    /**
     * retorna el saldo de la cuenta
     */
    public double getSaldo()
    { return saldo;
    }
    /**
     * retorna el numero de cuenta
     */
    public int getNroCuenta()
    { return nroCuenta;
    }
    
    
}
