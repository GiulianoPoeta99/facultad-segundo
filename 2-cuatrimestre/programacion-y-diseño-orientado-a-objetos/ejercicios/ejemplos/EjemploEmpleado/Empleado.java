

public class Empleado
{
    private String apellido,nombre;
    private MiFecha fechContratacion, fechCumpleanios;
    private static int cant=0;
    
    public Empleado(String apellido,String nombre,MiFecha fechContratacion,MiFecha fechCumpleanios )
    { this.apellido=apellido;
      this.nombre=nombre;
      this.fechContratacion=fechContratacion;
      this.fechCumpleanios=fechCumpleanios;
      cant++;
    }
    @Override
    public void finalize()
    {cant--;
    }
    public String cadenaFechaContratacion()
    {
        return fechContratacion.toString();//return ""+fechContratacion; (porque sobreescribi to string en MiFecha)
    }
     public String cadenaFechaCumpleanios()
    {
        return fechCumpleanios.toString();//return ""+fechCumpleanios;
    }
    public static int getCantidad()
    {return cant;
    }
}
