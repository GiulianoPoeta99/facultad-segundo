{
    Escribir un programa que encuentre el conjunto de todas las vocales y el conjunto de todas
    las consonantes de una línea de texto dada.
}

program ejercicio8;
uses crt;

const
    vocales = ['a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U'];

type 
    Tconjunto = set of char;

procedure escribirConjunto (conjunto: Tconjunto);
var
	i: char;
	cadena: string;
begin
	cadena:= '';
	for i in conjunto do
		cadena:= (cadena + i + ' ,');
	writeln('[', cadena, ']');
end;

procedure iniciarConjuntoVocalesYConsonantes(txt: string; var conjVocales, conjConsonantes: Tconjunto);
var
    i: integer;
begin
    for i:=1 to length(txt) do 
    begin
        if (txt[i] in vocales) then
        begin
            conjVocales := conjVocales + [txt[i]];
        end
        else
        begin
            conjConsonantes := conjConsonantes + [txt[i]];
        end;
    end;
end;

var
    textoVocales, textoConsonantes: Tconjunto;
    texto: string;
begin
    //vocales := ['a', 'e', 'i', 'o', 'u'];
    writeln('Ingrese un texto: ');
    readln(texto);
    iniciarConjuntoVocalesYConsonantes(texto,textoVocales,textoConsonantes);
    writeln('Las vocales del texto son: ');
    escribirConjunto(textoVocales);
    writeln('Las consonantes del texto son: ');
    escribirConjunto(textoConsonantes);
end.