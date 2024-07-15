package punto1;


public class Automovil implements Comparable //Comparable<Automovil>
{
private String marca;
private String modelo;
private int anio;

public Automovil(String marca, String modelo, int anio)
{
this.marca=marca;
this.modelo=modelo;
this.anio=anio;
}

public int compareTo(Object o)
{
    Automovil otroAuto=(Automovil)o;        
    return marca.compareTo(otroAuto.marca);
    
}

/* version de compareTo con generics
public int compareTo(Automovil otroAuto)
{
    //con generics no es necesario hacer la conversion de tipos
    return marca.compareTo(otroAuto.marca);
}
*/

public String getModelo()
{ return modelo;
}

public int getAnio()
{ return anio;
}

public String toString()
{ return marca+" "+modelo+" "+anio;
}

}
