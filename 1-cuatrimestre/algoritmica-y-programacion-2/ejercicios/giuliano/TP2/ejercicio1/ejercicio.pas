{
    Escribir un programa que determine si una secuencia de caracteres ingresada de longitud
    16 es capicúa o no
}

program Ejercicio1;
uses crt;

function reversestring(s: string): string;
var
    i: integer;
begin
    for i := Length(s) downto 1 do
        reversestring := reversestring + s[i];
end;

var
    text : string;

begin
    writeln('Ingrese una palabra (16 caracteres maximo):');
    readln(text);

    if (text = reversestring(text)) then
        writeln('La palabra es capicua')
    else 
        writeln('La palabra no es capicua');

    readln;
end.
