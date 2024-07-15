

public class MainSolidos
{
    public static void main(String[] args)
    {
       SolidoRevolucion[] arr=new SolidoRevolucion[10]; //si lo hicieron con una lista no hay problema
       arr[0]=new Esfera(3.2);
       arr[1]=new Cilindro(4.5,5.2);
       arr[2]=new Cono(1.3,3.8);
       arr[3]=new Esfera(5);
       arr[4]=new Cilindro(3.2,6);
       arr[5]=new Cono(1.5,3.2);
       arr[6]=new Esfera(4);
       arr[7]=new Cilindro(3.1,2);
       arr[8]=new Cono(9.1,7.1);
       arr[9]=new Esfera(8);
       
       double supTotal=0;
       for (SolidoRevolucion s:arr)
           supTotal+=s.getSuperficie();//polimorfismo y ligadura dinamica
       System.out.println("Area total de solidos "+supTotal);
       
       System.out.println();
       
       for (SolidoRevolucion s:arr)
       System.out.println(s);
    }
}
