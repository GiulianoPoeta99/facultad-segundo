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
unit UfechaHora;

interface

uses crt,SysUtils,Ufechas,Uhoras;

type
    TfechaHora = record 
        fecha: Ufechas.Tfecha;
        hora: Uhoras.Thora;
    end;

procedure iniciarFechaHora(var fechaHora: TfechaHora);

function imprimirFormatoCortoSinHora(fechaHora: TfechaHora): string;

function imprimirFormatoLargoSinHora(fechaHora: TfechaHora): string;

function imprimirFormatoTextualSinHora(fechaHora: TfechaHora): string;

function imprimirFormatoCortoConHora(fechaHora: TfechaHora): string;

function imprimirFormatoLargoConHora(fechaHora: TfechaHora): string;

function imprimirFormatoTextualConHora(fechaHora: TfechaHora): string;

implementation

procedure iniciarFechaHora(var fechaHora: TfechaHora);
var
    anio,mes,dia,hora,min,seg: integer;
begin
    writeln('Ingrese el anio: ');
    readln(anio);
    writeln('Ingrese el mes: ');
    readln(mes);
    //while ((mes <= 0) and (mes >= 13)) do begin
    while (not (mes in [1..12])) do begin
        writeln('Ingrese un mes correcto: ');
        readln(mes);
    end;

    writeln('Ingrese un dia: ');
    readln(dia);
    if (mes in [1,3,5,7,8,10,12]) then begin
        while (not (dia in [1..31])) do begin
            writeln('Ingrese un dia valido (1 a 31): ');
            readln(dia);
        end;
    end else if (mes in [4,6,9,11]) then begin
        while (not (dia in [1..30])) do begin
            writeln('Ingrese un dia valido (1 a 30): ');
            readln(dia);
        end;
    end else begin
        while (not (dia in [1..28])) do begin
            writeln('Ingrese un dia valido (1 a 28): ');
            readln(dia);
        end;
    end;
    
    fechaHora.fecha.anio := anio;
    fechaHora.fecha.mes := mes;
    fechaHora.fecha.dia := dia;

    writeln('Ingrese la hora: ');
    readln(hora);
    while (not (hora in [0..24])) do begin
        writeln('Ingrese una hora correcta: ');
        readln(hora);
    end;

    writeln('Ingrese el minuto: ');
    readln(min);
    while (not (min in [0..59])) do begin
        writeln('Ingrese un minuto correcto: ');
        readln(min);
    end;

    writeln('Ingrese los segundos: ');
    readln(seg);
    while (not (seg in [0..59])) do begin
        writeln('Ingrese una cantidad valida: ');
        readln(seg);
    end;
    
    fechaHora.hora.hora := hora;
    fechaHora.hora.min := min;
    fechaHora.hora.seg := seg;
end;

function imprimirFormatoCortoSinHora(fechaHora: TfechaHora): string;
var
    fecha: string;
begin
    fecha := Ufechas.imprimirFormatoCorto(fechaHora.fecha);
    imprimirFormatoCortoSinHora := fecha;
end;

function imprimirFormatoLargoSinHora(fechaHora: TfechaHora): string;
var
    fecha: string;
begin
    fecha := Ufechas.imprimirFormatoLargo(fechaHora.fecha);
    imprimirFormatoLargoSinHora := fecha;
end;

function imprimirFormatoTextualSinHora(fechaHora: TfechaHora): string;
var
    fecha: string;
begin
    fecha :=  Ufechas.imprimirFormatoTextual(fechaHora.fecha);
    imprimirFormatoTextualSinHora := fecha;
end;

function imprimirFormatoCortoConHora(fechaHora: TfechaHora): string;
begin
    imprimirFormatoCortoConHora :=  Ufechas.imprimirFormatoCorto(fechaHora.fecha) + ' ' + Uhoras.imprimirFormatoCorto(fechaHora.hora);
end;

function imprimirFormatoLargoConHora(fechaHora: TfechaHora): string;
begin
    imprimirFormatoLargoConHora :=  Ufechas.imprimirFormatoLargo(fechaHora.fecha) + ' ' + Uhoras.imprimirFormatoLargo(fechaHora.hora);
end;

function imprimirFormatoTextualConHora(fechaHora: TfechaHora): string;
begin
    imprimirFormatoTextualConHora :=  Ufechas.imprimirFormatoTextual(fechaHora.fecha) + ' a las ' + Uhoras.imprimirFormatoMeridiano(fechaHora.hora);
end;

begin
    
end.