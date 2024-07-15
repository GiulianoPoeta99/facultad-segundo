import java.util.Objects;

public class Persona2 implements Comparable{
    private int idPersona;
    private String nombre;
    private int altura;
 
    public Persona2(int idPersona, String nombre, int altura) {
        this.idPersona = idPersona;
        this.nombre = nombre;
        this.altura = altura;
    }
 
    public int getAltura()
    { return altura;
    }
    public int getIdPersona()
    {return idPersona;}
    @Override
    public String toString() { 
        return "Persona-> ID: "+idPersona+" Nombre: "+nombre+" Altura: "+altura+"\n";  
    }
 
    @Override
    public int compareTo(Object o) { 
        Persona2 o2=(Persona2)o;
        return this.nombre.compareTo(o2.nombre); 
    }
 
    @Override
    public int hashCode() { 
        //return altura+ nombre.hashCode() + idPersona;
        return idPersona;
    }
 
    @Override
    public boolean equals(Object obj) {
        if (obj == null) {   return false;  }
        if (getClass() != obj.getClass()) {  return false;   }
        final Persona2 other = (Persona2) obj;
        if (this.idPersona != other.idPersona) {  return false;    }
        //if (this.nombre.compareTo(other.nombre)!=0) {  return false;    }
        //if (this.altura!=other.altura){  return false;    }
        return true;
    }
}
