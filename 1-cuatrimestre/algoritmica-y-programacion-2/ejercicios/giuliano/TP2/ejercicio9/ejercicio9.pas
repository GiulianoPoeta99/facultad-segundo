{
    Escribir un programa que detecte todas las letras que NO están en una línea de texto y las
    visualice en orden alfabético
}

program ejercicio9;
uses crt;

type 
    Tabecedario = set of 'a'..'z';
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

procedure iniciarConjunto(txt: string; var conjunto: Tconjunto);
var
    i: integer;
begin
    for i:=1 to length(txt) do 
    begin
        conjunto := conjunto + [txt[i]];
    end;
end;

procedure iniciarConjuntoAbecedario(var conjunto: Tabecedario);
var
    i: char;
begin
    for i:='a' to 'z' do 
    begin
        conjunto := conjunto + [i];
    end;
end;

var
    abecedario: Tabecedario;
    complemento, conjTexto: Tconjunto;
    texto: string;
begin
    abecedario := [];
    conjTexto := [];
    complemento := [];
    writeln('Ingrese un texto: ');
    readln(texto);
    iniciarConjunto(texto,conjTexto);
    iniciarConjuntoAbecedario(abecedario);
    writeln('todas las letras que no estan en el conjunto son: ');
    complemento := (abecedario - conjTexto);
    escribirConjunto(complemento);
end.