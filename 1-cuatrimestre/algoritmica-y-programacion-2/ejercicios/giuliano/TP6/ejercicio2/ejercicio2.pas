{
    2.- Dadas dos pilas de enteros llamadas Operando1 y Operando2 y una pila de caracteres que
    contiene solo '*', '+', '-', '/', recorrer las pilas de números sacando un número por vez de cada
    una y un operador de la pila de caracteres e imprimir el resultado de la operación
}
program ejercicio2;
uses crt,UpilaEnteros,UpilaCaracteres;

procedure cargarElementosInt(var sucesion: UpilaEnteros.Tpila);
var
    i,elemento: integer;
begin
    writeln('Ingrese elementos de la sucesion: ');
    for i:=1 to N do begin
        writeln('Ingrese elemento nro ',i);
        readln(elemento);
        UpilaEnteros.meter(sucesion, elemento);
    end;
end;

procedure cargarElementosChar(var sucesion: UpilaCaracteres.Tpila);
var
    i: integer;
    elemento: char;
begin
    writeln('Ingrese elementos de la sucesion: ');
    for i:=1 to N do begin
        writeln('Ingrese elemento nro ',i);
        readln(elemento);
        while ((elemento <> '*') and (elemento <> '+') and (elemento <> '-') and (elemento <> '/')) do begin
            writeln('Elija uno de estos caracteres (*, +, -, /):');
            readln(elemento);
        end;
        UpilaCaracteres.meter(sucesion, elemento);
    end;
end;

procedure calcularElementosPilas(sucesion1,sucesion2: UpilaEnteros.Tpila; caracteres: UpilaCaracteres.Tpila);
var
    i,elemento1,elemento2,resultado: integer;
    caracter: char;
begin
    for i:=1 to N do begin
        UpilaEnteros.sacar(sucesion1,elemento1);
        UpilaEnteros.sacar(sucesion2,elemento2);
        UpilaCaracteres.sacar(caracteres,caracter);

        writeln('La operacion nro ',i,' es:');
        if (caracter = '*') then begin
            writeln(elemento1,' * ',elemento2);
            resultado := elemento1 * elemento2;
        end else if (caracter = '+') then begin
            writeln(elemento1,' + ',elemento2);
            resultado := elemento1 + elemento2;
        end else if (caracter = '-') then begin
            writeln(elemento1,' - ',elemento2);
            resultado := elemento1 - elemento2;
        end else if (caracter = '/') then begin
            writeln(elemento1,' / ',elemento2);
            resultado := elemento1 div elemento2;
        end;
        writeln('El resultado es: ',resultado);
    end;
end;

var
    sucesion1,sucesion2: UpilaEnteros.Tpila;
    caracteres: UpilaCaracteres.TPila;
begin
    UpilaEnteros.crear(sucesion1);
    UpilaEnteros.crear(sucesion2);
    writeln('Sucesion 1: ');
    cargarElementosInt(sucesion1);
    writeln('Sucesion 2: ');
    cargarElementosInt(sucesion2);
    writeln('Ingrese caracteres de este tipo a su gusto (*, +, -, /)');
    cargarElementosChar(caracteres);
    calcularElementosPilas(sucesion1,sucesion2,caracteres);
end.