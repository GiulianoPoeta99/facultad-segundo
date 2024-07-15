
/**
 * Write a description of class Main here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
public class Main
{
    public static void main(String[] arg)
    {
        Producto p=new HamburguesaCarne();
        p=new Jamon(p);
        p=new Queso(p);
        p=new Queso(p);
        System.out.println(p.getDescripcion());
        System.out.println(p.getPrecio());
        
    }
}
