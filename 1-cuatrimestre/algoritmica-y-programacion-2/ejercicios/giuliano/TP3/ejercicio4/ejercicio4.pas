{
    La MODA de un arreglo es el elemento que aparece más veces en el arreglo. Si distintos
    elementos son repetidos con la misma frecuencia máxima, no hay moda. Escribir un
    programa en Pascal que acepte un arreglo e imprima su MODA o un mensaje si no la hay.
}
program ejercicio4;
uses crt;
const
    N = 10;
type
    Tvector = array[1..N] of integer;

procedure encontrarModa(vector: Tvector);
var
    i,j,moda,aux: integer;
    esModa: boolean;
begin
    moda := vector[1];
    aux := 0;

    // 1,2,2,3,4,5,6,7,8,9

    for i := 1 to N do begin
        j := i + 1;
        while ((j <= N) and (vector[i] = vector[j])) do
            j := j + 1;
        if ((j - i) > aux) then begin 
            moda := vector[i];
            aux := j - i;
            esModa := true;
        end else if (j - i = aux) then
            esModa := false;
    end;

    if (esModa) then
        writeln('La moda del vector es: ', moda)
    else
        writeln('No hay moda en el vector');
end;


var
    i: integer;
    vector: Tvector;
begin
    writeln('Cargue el vector de integers de largo ',N, ': ');
    for i:=1 to N do begin
        readln(vector[i]);
    end;
    encontrarModa(vector);
end.