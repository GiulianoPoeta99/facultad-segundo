package asiSI;



public class Main
{
   public static void main(String[] args)
   {
     Circulo c=new Circulo(3.2,5.3,3.8);
     //c.radio=25; ahora no se puede
     System.out.println(c);
     System.out.println("Diametro: "+c.getDiametro());
     System.out.println("Circunferencia: "+c.getCircunferencia());
     System.out.println("Area: "+c.getArea());
   }
}