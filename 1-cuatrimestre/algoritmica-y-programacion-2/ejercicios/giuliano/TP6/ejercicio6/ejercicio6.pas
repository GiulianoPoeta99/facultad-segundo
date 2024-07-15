{
    6.- Conviértase las siguientes expresiones infijas en expresiones pre y postfijas
        a) ( x + m ) / ( p + q )
        b) x + m / p + q
        c) ( (m+o) + p * (q+r) + s ) * (t+u)
        d) ((( a-b) - c) - d) - e
}
program ejercicio6;
uses crt,UpilaCaracteres;

procedure cambiarInPreFija(expresion: string; simbolos: Tpila; var resultado: string);
var
    i: integer;
begin
    resultado := '';
    for i:=length(expresion) downto 1 do begin
        if (expresion[i] in ['+','-','*','*','/','(',')']) then begin
            if (expresion[i] = ')') then begin
                meter(simbolos,expresion[i]);
            end;
        end else begin
            resultado := resultado +expresion[i];
        end;
    end;
end;

var
    expresion,resultado: string;
    simbolos: Tpila
begin
    writeln('Ingrese una expresion en notacion infija: ');
    readln(expresion);
    crear(simbolos);
    cambiarInPreFija(expresion,simbolos,resultado);
    writeln('La expresion infija: ',expresion);
    writeln('En notacion prefija es: ',resultado);
    
    {cambiarInPostFija(expresion,simbolos,resultado);
    writeln('La expresion infija: ',expresion);
    writeln('En notacion postfija es: ',resultado);}
end.