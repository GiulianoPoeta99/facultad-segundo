{
    4- Escriba un TDA para manipular el tiempo. Se debe poder iniciar una hora pasando los
    argumentos hora, minutos y segundos.
        - Incorpore al TDA la posibilidad de retornar la hora en distintos formatos (ej para
        las 15:30hs):
            - Formato corto HH:mm = 15:30
            - Formato largo HH:mm:ss = 15:30:00
            - Formato meridiano hh:mm aa = 3:00 PM
}
program ejercicio4;
uses crt,Uhoras;

var
    hora: Thora;
    formato: string;
begin
    iniciarHora(hora);
    writeln;
    formato := imprimirFormatoCorto(hora);
    writeln(formato);
    writeln;
    formato := imprimirFormatoLargo(hora);
    writeln(formato);
    writeln;
    formato := imprimirFormatoMeridiano(hora);
    writeln(formato);
end.