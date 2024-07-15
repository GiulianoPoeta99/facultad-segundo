program ejercicio1;
uses crt;

type 
    Tletras = set of char;

var 
    letras: Tletras;
    letraIngresada : char;

begin
    letras := ['a', 'b', 'd', 'q'];
    readln(letraIngresada);

    if letraIngresada in letras then
        writeln('La letra ingresada es correcta')
    else 
        writeln('La letra ingresada es incorrecta');
end.