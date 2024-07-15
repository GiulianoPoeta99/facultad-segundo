{
    5.- Escribir un programa que determine cuando una secuencia de caracteres que finaliza con
    un punto (.) es una expresión matemática balanceada, o sea que todo paréntesis, corchete y
    llave que se abre tiene su correspondiente que se cierra.
}
program ejercicio5;
uses crt,UpilaCaracteres;

procedure cargarElementos(var sucesion: Tpila);
var
    i: integer;
    elemento: char;
begin
    i := 1;
    writeln('Ingrese la expresion matematica');
    while (elemento <> '.') do begin
        writeln('Ingrese elemento nro ',i);
        readln(elemento);
        if (i = N) then begin
            while (elemento <> '.') do begin
                writeln('El ultimo elemento tiene que ser un "."');
                readln(elemento);
            end;
        end;
        meter(sucesion, elemento);
        inc(i);
    end;
end;

function analizarExpresion(sucesion: Tpila): boolean;
var
    parentesis,corchetes,llaves:integer;
    elemento: char;
    estaVacia: boolean;
begin
    parentesis := 0;
    corchetes := 0;
    llaves := 0;
    estaVacia := vacia(sucesion);
    while (not estaVacia) do begin
        sacar(sucesion,elemento);
        if ((elemento = '(') or (elemento = ')')) then begin
            if (elemento = '(') then begin
                inc(parentesis);
            end else begin
                dec(parentesis)
            end;
        end else if ((elemento = '[') or (elemento = ']')) then begin
            if (elemento = '[') then begin
                inc(corchetes);
            end else begin
                dec(corchetes);
            end;
        end else if ((elemento = '{') or (elemento = '}')) then begin
            if (elemento = '{') then begin
                inc(llaves);
            end else begin
                dec(llaves);
            end;
        end;
        estaVacia:= vacia(sucesion);
    end;

    if ((parentesis = 0) and (corchetes = 0) and (llaves = 0)) then begin
        analizarExpresion := True;
    end else begin
        analizarExpresion := False;
    end;
end;

var
    sucesion: Tpila;
    expresion: boolean;
begin
    crear(sucesion);
    cargarElementos(sucesion);
    expresion := analizarExpresion(sucesion);

    if (expresion) then begin
        writeln('La expresion esta balanceada.');
    end else begin
        writeln('La expresion no esta balanceada.');
    end;
end.