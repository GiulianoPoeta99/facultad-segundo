{
    3- Escriba un TDA para manipular fechas. Se debe poder iniciar una fecha pasando los
    argumentos año, mes y día.
        - Incorpore al TDA la posibilidad de retornar la fecha en distintos formatos (ej para el 24 de marzo de 2020):
            - Formato corto DD/MM = 24/03
            - Formato largo DD/MM/AAAA = 24/03/2020
            - Formato textual DD/m/AAAA = 24 MAR 2020
}
program ejercicio3;
uses crt,Ufechas;

var
    fecha: Tfecha;
    formato: string;
begin
    iniciarFecha(fecha);
    writeln;
    formato := imprimirFormatoCorto(fecha);
    writeln(formato);
    writeln;
    formato := imprimirFormatoLargo(fecha);
    writeln(formato);
    writeln;
    formato := imprimirFormatoTextual(fecha);
    writeln(formato);
end.