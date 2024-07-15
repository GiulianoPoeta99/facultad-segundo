{
    Diseñe y codifique en Pascal un programa que lea un número entero y cargue cada dígito como elemento de un vector
}
program ejercicio2;
uses crt;
const
    N=100;

type
    Tvector = array[1..N] of integer;

var
    numero,i: integer;
    vector: Tvector;
begin
    i := 0;
    writeln('ingrese un numero: ');
    readln(numero);
    while (numero > 0) do begin
        inc(i);
        vector[i] := numero mod 10;
        numero := numero div 10;   
    end;

    write('[');
    for i:=i downto 1 do begin
        if (i = 1) then begin
            write(vector[i])
        end else begin
            write(vector[i],', ') 
        end;
    end;
    write(']');
end.