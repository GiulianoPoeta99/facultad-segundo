{
    1.- Escriba un TDA que permita el uso de fracciones. La funcionalidad mínima que debe
    aportar es:
        - Iniciar: iniciar una fracción a partir de un numerador y un denominador entero.
        - Sumar: retornar la suma de dos fracciones.
        - Restar: retornar la resta de dos fracciones.
        - Simplificar: retorna una fracción simplificada.
        - Imprimir: visualiza en pantalla la fracción.
}
program ejercicio1;
uses crt,Ufracciones;

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
    suma := sumarFracciones(fraccion1,fraccion2);
    writeln('Suma: ');
    leerFraccion(suma);
    writeln('Simplificada: ');
    SimplificarFraccion(suma);
    writeln('Resta');
    resta := restarFracciones(fraccion1,fraccion2);
    leerFraccion(resta);
    writeln('Simplificada: ');
    SimplificarFraccion(resta);
end.