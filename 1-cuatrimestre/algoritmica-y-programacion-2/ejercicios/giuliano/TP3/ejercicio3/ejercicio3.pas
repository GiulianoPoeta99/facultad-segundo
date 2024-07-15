{
    La mediana de un arreglo de números es el elemento M tal que la mitad de los números en
    el arreglo son menores o iguales a M, y la otra mitad son mayores o iguales a M. Si el arreglo
    tiene un número par de elementos, la mediana es el promedio entre los números M1 y M2
    tales que la mitad de los restantes son mayores o iguales a M1 y la mitad menores o iguales
    a M2. Escribir un programa en Pascal que acepte un arreglo de números y retorne la
    MEDIANA
}
program ejercicio3;
uses crt;
const
    M = 10;
type
    Tvector = array[1..M] of integer;

procedure ordenarVector(var vector: Tvector);
var
    i,j,temp: integer;
begin
    for i := 1 to (M - 1) do
        for j := 1 to (M - i) do
            if vector[j] > vector[j+1] then
            begin
                // Intercambiar los elementos vector[j] y vector[j+1]
                temp := vector[j];
                vector[j] := vector[j+1];
                vector[j+1] := temp;
            end;
end;

var
    vector: Tvector;
    i: integer;
    mediana: real;
begin
    writeln('Cargue el vector de integers de largo ',M, ': ');
    for i:=1 to M do begin
        readln(vector[i]);
    end;

    ordenarVector(vector);
    if ((M mod 2) = 0) then begin
        mediana := (vector[M div 2] + vector[(M div 2)+1])/2;
        writeln('La mediana del vector es: ',round(mediana * 100) / 100:0:2);
    end else begin
        writeln('La mediana del vector es: ',vector[M div 2]);
    end;
end.