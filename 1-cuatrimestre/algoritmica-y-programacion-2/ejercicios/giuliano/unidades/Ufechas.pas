unit Ufechas;

interface

uses crt,SysUtils;

type
    Tfecha = record 
        anio,mes,dia: integer;
    end;

procedure iniciarFecha(var fecha: Tfecha);

function imprimirFormatoCorto(fecha: Tfecha): string;

function imprimirFormatoLargo(fecha: Tfecha): string;

function imprimirFormatoTextual(fecha: Tfecha): string;


implementation

procedure iniciarFecha(var fecha: Tfecha);
var
    anio,mes,dia: integer;
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
    
    fecha.anio := anio;
    fecha.mes := mes;
    fecha.dia := dia;
end;

function imprimirFormatoCorto(fecha: Tfecha): string;
var
    diaAux,mesAux:string;
begin
    if (fecha.dia <= 9) then begin
        diaAux := '0' + IntToStr(fecha.dia);
    end else begin
        diaAux := IntToStr(fecha.dia);
    end;

    if (fecha.mes <= 9) then begin
        mesAux := '0' + IntToStr(fecha.mes);
    end else begin
        mesAux := IntToStr(fecha.mes);
    end;

    imprimirFormatoCorto := diaAux + '/' + mesAux;
end;

function imprimirFormatoLargo(fecha: Tfecha): string;
var
    diaAux,mesAux:string;
begin
    if (fecha.dia <= 9) then begin
        diaAux := '0' + IntToStr(fecha.dia);
    end else begin
        diaAux := IntToStr(fecha.dia);
    end;

    if (fecha.mes <= 9) then begin
        mesAux := '0' + IntToStr(fecha.mes);
    end else begin
        mesAux := IntToStr(fecha.mes);
    end;

    imprimirFormatoLargo := diaAux + '/' + mesAux + '/' + IntToStr(fecha.anio);
end;

function imprimirFormatoTextual(fecha: Tfecha): string;
var
    diaAux,mesAux:string;
begin
    if (fecha.dia <= 9) then begin
        diaAux := '0' + IntToStr(fecha.dia);
    end else begin
        diaAux := IntToStr(fecha.dia);
    end;

    case fecha.mes of
        1: mesAux := 'enero';
        2: mesAux := 'febrero';
        3: mesAux := 'marzo';
        4: mesAux := 'abril';
        5: mesAux := 'mayo';
        6: mesAux := 'junio';
        7: mesAux := 'julio';
        8: mesAux := 'agosto';
        9: mesAux := 'septiembre';
        10: mesAux := 'octubre';
        11: mesAux := 'noviembre';
        12: mesAux := 'diciembre';
    end;

    imprimirFormatoTextual := diaAux + ' de ' + mesAux + ' de ' + IntToStr(fecha.anio);
end;

begin
    
end.