{
    5- Escribir un TDA para manipular fecha y hora. Utilice las unidades que ya tiene para generar esta nueva.
        - Incorpore al TDA la posibilidad de retornar la fecha y la hora en distintos formatos (ej
        para las 24/03/2020 15:30hs):
            - Formato corto sin hora DD/MM = 24/03
            - Formato largo sin hora DD/MM/AAAA = 24/03/2020
            - Formato textual sin hora DD/m/AAAA = 24 MAR 2020
            - Formato corto con hora DD/MM – HH:mm = 24/03 - 15:30
            - Formato largo con hora DD/MM/AAAA – HH:mm:ss = 24/03/2020 - 15:30:00
            - Formato textual con hora DD/m/AAAA – hh:mm:mm aa = 24 MAR 2020 - 3:30 PM
}
program ejercicio5;
uses crt,Ufechahora;

var
    fechaHora: TfechaHora;
    formato: string;
begin
    iniciarFechaHora(fechaHora);
    writeln;
    formato := imprimirFormatoCortoSinHora(fechaHora);
    writeln(formato);
    writeln;
    formato := imprimirFormatoLargoSinHora(fechaHora);
    writeln(formato);
    writeln;
    formato := imprimirFormatoTextualSinHora(fechaHora);
    writeln(formato);
    writeln;
    formato := imprimirFormatoCortoConHora(fechaHora);
    writeln(formato);
    writeln;
    formato := imprimirFormatoLargoConHora(fechaHora);
    writeln(formato);
    writeln;
    formato := imprimirFormatoTextualConHora(fechaHora);
    writeln(formato);
    writeln;
end.