{
    Escribir un programa en Pascal para generar los conjuntos A y B de la siguiente manera:
        A : múltiplos de 6;
        B : complemento de A con respecto a BASE.
}

program ejercicio6;
uses crt;

const
    N = 50;

type
    Tbase = 1..N;
    Tconjunto = set of Tbase;

procedure escribirConjunto (conjunto: Tconjunto);
var
	i: byte;
begin
	for i in conjunto do 
        write(i, ' ,');
    writeln;
end;

procedure iniciarConjuntoComplemento(var conjunto: Tconjunto; multiplos: Tconjunto);
var
    i: integer;
begin
    for i:=1 to N do
    begin
        if (not (i in multiplos)) then
        begin
            conjunto := conjunto + [i];
        end;
    end;
end;

procedure iniciarConjuntoMultiplo(var conjunto: Tconjunto);
var
    i: integer;
begin
    for i:=1 to N do 
    begin
        if ((i mod 6) = 0) then
        begin
            conjunto := conjunto + [i];
        end;
    end;
end;

var
    multiplos, complemento: Tconjunto;
begin
    multiplos := [];
    complemento := [];
    iniciarConjuntoMultiplo(multiplos);
    iniciarConjuntoComplemento(complemento,multiplos);
    writeln('Los multiplos de 6 son: ');
    escribirConjunto(multiplos);
    writeln('y el complemento del conjuto y los multplos es: ');
    escribirConjunto(complemento);
end.