Program companias;

Const
Max = 10;
Type
    TSeguroDeVida = record
    Beneficiario:       String;
    ValorDelAsegurado:  LongInt;
    TitularPoliza:      String;
    NumeroDePoliza:     String;
    CostoDePoliza:      LongInt;
    end;

    TSeguroDeAutos = record
    NroMotor:           LongInt;
    Chasis:             String;
    Patente:            String;
    TipoVehiculo:       String;
    ValorAuto:          LongInt;
    TitularPoliza:      String;
    NumeroDePoliza:     String;
    CostoDePoliza:      LongInt;
    end;
    
    TPoliza = Record
    SeguroDeVida: TSeguroDeVida;
    SeguroDeAutos:TSeguroDeAutos;
    end;

    TlistaDePolizas= Array[1..20] of TPoliza;

    TEmpresaDeSeguros = record
    Nombre: String;
    ListaDePolizas: TlistaDePolizas;
    End;

    TEmpresas = array [1..20] of TEmpresaDeSeguros; 


Procedure CargarSeguroDeVida(var Empresa1:TEmpresas);
Var palabras:String; num:LongInt; validar:Boolean; I:Integer;
begin
I:=1;
    Validar:=False;
    Writeln('Ingresar Poliza (Y)es, (N)o'); 
    repeat
        Readln(palabras); 
    until (palabras = 'Y');
    If (palabras = 'Y') then Validar:=True;

    If (Validar = True) then
    Begin
        WriteLn('Ingrese Nombre del Beneficiario:'); 
        Readln(palabras);
        Empresa1[1].ListaDePolizas[i].SeguroDeVida.Beneficiario:= Palabras;
    end;

end;

Procedure CargarDatosCompaniaDeSeguro(var Empresa1: TEmpresas);
var Name:String; Seleccionador:Integer;
begin 

  Writeln('ingrese el nombre de la empresa:'); Readln(Name);
  Empresa1[1].Nombre:= Name;

  Writeln('Ingrese tipo de poliza para cargar: ');
  Writeln('1) Seguro de Vida');
  Writeln('2) Seguro de Auto');
  Writeln('3) Salir');

  repeat
    Readln(Seleccionador); 
  until (Seleccionador = 1) or (Seleccionador = 2) or (Seleccionador = 3) ;
  
  If (Seleccionador = 1) then CargarSeguroDeVida(Empresa1);

  If (Seleccionador = 2) then CargarSeguroDeAutos(Empresa1);  
end;


{Programa Principal}
Var Empresa1:TEmpresas;

Begin
    CargarDatosCompaniaDeSeguro(Empresa1);
    
    
End.