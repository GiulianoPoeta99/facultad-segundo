{
    Escribir un procedimiento que lea una cadena de CARACTERES y devuelva el conjunto
    que contiene a todas sus LETRAS mayúsculas.
}
program ConvertirMayusculas;
uses crt;

var
    cadena: string;
begin
    writeln('Ingrese una cadena en minusculas: ');
    readln(cadena);
    writeln('La cadena en mayusculas es: ', UpCase(cadena));
end.
