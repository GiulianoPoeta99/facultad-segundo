{
    Escribir un procedimiento que lea una cadena de caracteres que finaliza con '%' e ignore
    cualquier carácter que no sea dígito, calculando el número formado por los dígitos
}
program ejercicio10;
uses crt;

procedure decodificar(codigo: string; var decodigo: string);
var
    i: integer;
begin
    for i:=1 to length(codigo) do
    begin
        if (codigo[i] in ['0','1','2','3','4','5','6','7','8','9']) then
        begin
            decodigo := decodigo + codigo[i];
        end;
    end;
end;

var 
    codigo,decodigo: string;
begin
    codigo := '';
    decodigo := '';
    while (codigo[length(codigo)] <> '%') do
    begin 
        writeln('escriba un codigo que finalice en "%": ');
        readln(codigo)
    end;
    decodificar(codigo,decodigo);
    writeln('el numero decodificado es: ',decodigo);
end.