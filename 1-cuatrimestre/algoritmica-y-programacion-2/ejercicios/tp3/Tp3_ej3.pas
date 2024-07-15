{
    La mediana de un arreglo de números es el elemento M tal que la mitad de los números en
    el arreglo son menores o iguales a M, y la otra mitad son mayores o iguales a M. Si el arreglo
    tiene un número par de elementos, la mediana es el promedio entre los números M1 y M2
    tales que la mitad de los restantes son mayores o iguales a M1 y la mitad menores o iguales
    a M2. Escribir un programa en Pascal que acepte un arreglo de números y retorne la
    MEDIANA
}

program tp3ej3;
uses crt;

const
    n=100;
type 
    Tarreglo = array[1..n] of integer;

procedure InicializarVector (var v:Tarreglo; n:integer);
var i:Byte;
begin
    for i:=1 to n do 
        v[i]:=0;
end;

function CargarVector (var v:Tarreglo; n:integer):Integer;
var i:byte;Largo: Integer;
begin
    Writeln('Cuanto de largo queres que sea el vector?:');
    Readln(Largo);
        for i:=1 to Largo do
            v[i]:=random(11);
    writeln;
    CargarVector:= Largo;
end;

procedure InformarVector (v:Tarreglo; Largo:integer);
var i:byte;
begin
    writeln('El vector');
    for i:=1 to Largo do 
        write(v[i],' ');
    writeln;
end;

procedure Intercambiar (var n1,n2:integer);
var aux:integer;
begin
    aux:=n1;
    n1:=n2;
    n2:=aux;
end;

procedure OrdenarVector (var v:Tarreglo; Largo:integer);
var i:byte; ordenado:boolean;
begin
    ordenado:=false;
    while not(ordenado) do
    begin
        ordenado:=true;
        for i:=1 to Largo-1 do
        begin
            if (v[i]>v[i+1]) then
            begin
                Intercambiar(v[i],v[i+1]);
                ordenado:=false;
            end;
        end;
    end;
end;

procedure InformarVectorOrdenado (v:Tarreglo;Largo:integer);
var i:byte;
begin
    writeln('El vector ordenado');
    for i:=1 to Largo do 
        write(v[i],' ');
    writeln;
end;

function CalcularMediana (v:Tarreglo;Largo:integer):real;
var M1,M2,suma:integer; 
begin
    M1:=0;
    M2:=0;
    suma:=0;

    If (Largo mod 2 = 0 ) then 
        begin
        M1:= v[(Largo div 2)];
        M2:= v[((Largo div 2) + 1)];
        suma:= M1 + M2;
        CalcularMediana:= Suma / 2;
        End
    else 
        begin
        M1:= v[(Largo div 2)];
        CalcularMediana:= M1/2;
        end;
end;

procedure InformarPromedioMediana (v:Tarreglo;Largo:integer);
begin
    writeln('El promedio de la media es: ', CalcularMediana(v,Largo):3:2);
end;

{Programa Principal}
var v:Tarreglo; Largo: Integer;
begin
clrscr;
randomize;
    InicializarVector(v,n);
    Largo:= CargarVector(v,n);
    InformarVector(v,Largo);
    OrdenarVector(v,Largo);
    InformarVectorOrdenado(v,Largo);
    InformarPromedioMediana(v,Largo);
end.