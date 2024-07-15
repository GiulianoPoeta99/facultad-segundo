program eercicio1_3;
uses crt, strUtils;

type
    Tvocales = set of char;

var
    vocales : Tvocales;
    textoIngresado: string;
    largo, contador, i: integer;
begin
    vocales := ['a', 'e', 'i', 'o', 'u'];
    contador := 0;
    writeln('Ingrese un texto:');
    readln(textoIngresado);
    largo := Ord(textoIngresado[0]);
    for i:=1 to largo do
    begin
        if (textoIngresado[i] in vocales) then
        begin
            inc(contador);
        end;
    end;
    writeln('Hay un total de ',contador,' vocales en el texto');
end.