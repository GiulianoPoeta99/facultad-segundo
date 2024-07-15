
/**
 * Write a description of class MiFecha here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class MiFecha
{
    // instance variables - replace the example below with your own
    //private int[] dias={}
    private int dia,mes,anio;
    
    public MiFecha(int dia,int mes,int anio)
    { this.dia=dia;
        this.mes=mes;
        this.anio=anio;
    }
    
    @Override
    public String toString()
    { return (dia<10?"0":"")+dia+"/"+(mes<10?"0":"")+mes+"/"+anio;
    }
    
}
