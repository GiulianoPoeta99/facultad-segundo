{
    Diseñe y codifique en Pascal un programa que dado un vector de N elementos imprima sus
    elementos en orden inverso. No debe generarse otro vector. 
}
program ejercicio1;
const 
    N = 5;

type 
    Tvector = array[1..N] of integer;

var
    i: integer;
    vector: Tvector;
begin
    writeln('cargue el vector de integers de largo ',N, ': ');
    for i:=1 to N do begin
        readln(vector[i]);
    end;

    writeln('[');
    for i:=N downto 1 do begin
        if (i=1) then begin
            writeln(vector[i])
        end else begin
            writeln(vector[i],', ') 
        end;
    end;
    writeln(']');
end.