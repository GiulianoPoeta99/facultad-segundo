{
    Dadas 2 secuencias de caracteres de longitud 16, programar la construcción de otra secuencia
        a) de longitud 32 que provenga de la concatenación
        b) de la concatenación que elimine los blancos finales de la primera (no hay blancos intermedios).
}

program ejercicio2;
uses crt;

procedure eliminarEspacios(var str:string);
var 
    strAux: string;
    i: integer;
begin
    strAux := ' ';
    for i:=1 to length(str) do
    begin
        if (strAux = ' ') then 
        begin
            if (str[i] = ' ') then
            begin
                strAux := copy(str,1,i-1)
            end;
        end;
    end;
    str := strAux;
end;
var
    string1,string2: string[16];

begin
    writeln('Ingrese una palabra: ');
    readln(string1);
    writeln('Ingrese una segunda palabra: ');
    readln(string2);
    writeln('La concatenacion de los 2 strings es: ',string1 + string2);
    eliminarEspacios(string1);
    writeln('La concatenacion de los 2 strings pero sin espacios en el primero es: ',string1 + string2);
end.