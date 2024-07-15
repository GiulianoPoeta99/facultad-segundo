{
    Escriba un programa que lea una sucesión de números enteros, que finaliza con 0, y los imprima en orden inverso
}
program ejercicio1;
uses crt,UpilaEnteros;

procedure cargarElementos(var sucesion: Tpila);
var
    i,elemento: integer;
begin
    writeln('Ingrese elementos de la sucesion: ');
    for i:=1 to N do begin
        writeln('Ingrese elemento nro ',i);
        readln(elemento);
        if (i = N) then begin
            while (elemento <> 0) do begin
                writeln('El ultimo elemento tiene que ser 0');
                readln(elemento);
            end;
        end;
        meter(sucesion, elemento);
    end;
end;

procedure imprimirInvertido(sucesion: Tpila);
var
    i,elemento: integer;
begin
    for i:=1 to N do begin
        sacar(sucesion,elemento);
        write(elemento,', ');
    end;
end;

var
    sucesion: Tpila;
begin
    crear(sucesion);
    cargarElementos(sucesion);
    imprimirInvertido(sucesion);
end.