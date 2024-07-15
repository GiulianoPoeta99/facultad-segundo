{
    Escribir un programa en Pascal que cuente la cantidad de palabras que hay en una secuencia
    de longitud <= 255 , sabiendo que las palabras se separan por uno o más blancos .
}

program ejercicio3;
uses crt;

function contarPalabras(txt:string): integer;
var
    contador, i: integer;
begin
    contador := 1;
    for i:=1 to length(txt) do
    begin
        if (txt[i] = ' ')  then
        begin
            if (txt[i-1] <> ' ') then
            begin
                inc(contador);
            end;
        end;
    end;
    contarPalabras := contador;    
end;

var 
    texto: string[255];
begin
    writeln('Ingrese un texto (maximo 255 caracteres): ');
    readln(texto);
    writeln('En el texto hay un total de ',contarPalabras(texto),' palabras.');
end.