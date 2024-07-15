{ Consigna:
    Diseñe y codifique en Pascal un programa que lea un número entero y cargue cada dígito
    como elemento de un vector.
}

Program tp3_ej2;

Const
    Max = 100;
type    
    TVector = Array[1..Max] of integer;

function Acomodamiento(Var Vector:Tvector; NumeroEntero: Integer):Integer;
Var Aux,i: Integer;
begin
i:= 1;
  repeat
   Aux:= NumeroEntero Mod 10;
   Vector[i]:= Aux; Inc(i);
   NumeroEntero:= NumeroEntero Div 10;
  until NumeroEntero = 0; 
  Acomodamiento:=i;
end;

procedure  MostrarVector(tope:Integer; Vector:Tvector);
Var i: Integer;
begin
i:=1;
    For i:=tope downto 1 do
        write(Vector[i], ' ');
end;

Var 
NumeroEntero: Integer; Vector: Tvector; Tope:Integer;
begin
  
  Writeln('Ingrese un Numero Entero:');
  Readln(NumeroEntero);

  Tope:= Acomodamiento(Vector,NumeroEntero);
  
  MostrarVector(tope,Vector);
end.