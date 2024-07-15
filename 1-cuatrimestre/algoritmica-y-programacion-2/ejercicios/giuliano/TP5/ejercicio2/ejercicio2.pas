{
    2- Modifique el ejercicio anterior para que no sea el TDA el encargado de imprimir, sino
    que sea responsabilidad de quien lo utilice.
}
program ejercicio2;
uses crt,Ufracciones2;

var 
    fraccion1,fraccion2,suma,resta: Tfraccion;
    numerador,denominador: integer;
begin
    writeln('ingrese valores de la primera fraccion: ');
    writeln('Ingrese numerador: ');
    readln(numerador);
    writeln('Ingrese denominador: ');
    readln(denominador);
    fraccion1 := iniciarFraccion(numerador,denominador);

    writeln('ingrese valores de la segunda fraccion: ');
    writeln('Ingrese numerador: ');
    readln(numerador);
    writeln('Ingrese denominador: ');
    readln(denominador);
    fraccion2 := iniciarFraccion(numerador,denominador);

    writeln('Suma: ');
    suma := sumarFracciones(fraccion1,fraccion2);
    writeln(suma.numerador,'/',suma.denominador);

    writeln('Simplificada: ');
    SimplificarFraccion(suma);
    writeln(suma.numerador,'/',suma.denominador);

    writeln('Resta');
    resta := restarFracciones(fraccion1,fraccion2);
    writeln(resta.numerador,'/',resta.denominador);

    writeln('Simplificada: ');
    SimplificarFraccion(resta);
    writeln(resta.numerador,'/',resta.denominador);
end.