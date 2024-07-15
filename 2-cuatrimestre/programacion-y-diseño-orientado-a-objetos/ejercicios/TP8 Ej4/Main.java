public class Main
{
    public static void main(String[] args)
    {
        ListaEmpleados miLista = new ListaEmpleados();
        
        //Agregar Empleados
        miLista.addEmpleado(new Jefe("Perez", "García", 70000));
        miLista.addEmpleado(new Comision("Gomez", "José", 35000, 150));
        miLista.addEmpleado(new Subordinado("Malcom", "EldenMedio", 1300));
        miLista.addEmpleado(new PorHora("Saca", "Ammstrong", 40, 10));
        miLista.addEmpleado(new PorHora("Mingo", "Manolo", 40, 5));
        miLista.addEmpleado(new PorHora("Alargaz", "Eusebio", 40, 2));
        miLista.listarSueldo();
        
        //Serializador s = new Serializador(miLista);
        //DeSerializador ds = new DeSerializador();
        //miLista = ds.getLista();
        //miLista.listarSueldo();
        
        System.out.println();
        
        CodificaXML c = new CodificaXML(miLista);
        DecodificaXML dx = new DecodificaXML();
        miLista = dx.getLista();
        miLista.listarSueldo();
    }
}