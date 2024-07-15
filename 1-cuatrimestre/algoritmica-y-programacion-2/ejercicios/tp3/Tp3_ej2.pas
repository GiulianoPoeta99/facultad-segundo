{ Consigna:
    Diseñe y codifique en Pascal un programa que lea un número entero y cargue cada dígito
    como elemento de un vector.
}

Program tp3_ej2;

Const
    Max = 100;
type    
    TVector = Array[1..Max] of integer;

function Acomodamiento(Var Vector:Tvector; NumeroEntero: Integer;Max:Integer):Integer;
Var i: Integer;
begin
i:= 1;
    While (NumeroEntero > 0) And (i <= Max) do
    begin
    Vector[i] := NumeroEntero mod 10;
    NumeroEntero := NumeroEntero div 10;
    i := i + 1;
    end;
Acomodamiento:=i;
end;

procedure  MostrarVector(tope:Integer; Vector:Tvector);
Var i: Integer;
begin
i:=1;
    For i:=tope-1 downto 1 do
        write(Vector[i], ' ');
end;

Procedure LimpiarVector(var Vector:TVector;Max:Integer);
Var i:Integer;
begin
    For i:=1 to Max do
        Vector[i]:= 0;
End;

Var 
NumeroEntero: Integer; Vector: Tvector; Tope:Integer;
begin
  LimpiarVector(Vector,Max);

  Writeln('Ingrese un Numero Entero:');
  Readln(NumeroEntero);

  Tope:= Acomodamiento(Vector,NumeroEntero,Max);
  
  MostrarVector(tope,Vector);
end.