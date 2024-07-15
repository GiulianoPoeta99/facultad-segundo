unit Uhoras;

interface

uses crt,SysUtils;

type
    Thora = record 
        hora,min,seg: integer;
    end;

procedure iniciarHora(var horas: Thora);

function imprimirFormatoCorto(horas: Thora): string;

function imprimirFormatoLargo(horas: Thora): string;

function imprimirFormatoMeridiano(horas: Thora): string;

implementation

procedure iniciarHora(var horas: Thora);
var
    hora,min,seg: integer;
begin
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
    
    horas.hora := hora;
    horas.min := min;
    horas.seg := seg;
end;

function imprimirFormatoCorto(horas: Thora): string;
var
    horaAux,minAux: string;
begin
    if (horas.hora <= 9) then begin
        horaAux := '0' + IntToStr(horas.hora);
    end else begin
        horaAux := IntToStr(horas.hora);
    end;

    if (horas.min <= 9) then begin
        minAux := '0' + IntToStr(horas.min);
    end else begin
        minAux := IntToStr(horas.min);
    end;

    imprimirFormatoCorto := horaAux + ':' + minAux;
end;

function imprimirFormatoLargo(horas: Thora): string;
var
    horaAux,minAux,segAux: string;
begin
    if (horas.hora <= 9) then begin
        horaAux := '0' + IntToStr(horas.hora);
    end else begin
        horaAux := IntToStr(horas.hora);
    end;

    if (horas.min <= 9) then begin
        minAux := '0' + IntToStr(horas.min);
    end else begin
        minAux := IntToStr(horas.min);
    end;

    if (horas.seg <= 9) then begin
        segAux := '0' + IntToStr(horas.seg);
    end else begin
        segAux := IntToStr(horas.seg);
    end;

    imprimirFormatoLargo := horaAux + ':' + minAux + ':' + segAux;
end;

function imprimirFormatoMeridiano(horas: Thora): string;
var
    horaAux,minAux,meridiano: string;
begin
    if (horas.hora <= 9) then begin
        if (horas.hora = 0) then begin
            horaAux := '12';
        end else begin
            horaAux := '0' + IntToStr(horas.hora);
        end;
    end else begin
        horaAux := IntToStr(horas.hora);
    end;

    if (horas.min <= 9) then begin
        minAux := '0' + IntToStr(horas.min);
    end else begin
        minAux := IntToStr(horas.min);
    end;

    if (horas.hora in [0..11]) then begin
        meridiano := 'AM';
    end else begin
        meridiano := 'PM';
    end;

    imprimirFormatoMeridiano := horaAux + ':' + minAux + ' ' + meridiano;
end;

begin
    
end.