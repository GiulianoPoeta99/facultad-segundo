unit Ufecha;

interface

    type
    Tfecha = record
    Dia:  Integer;
    Mes:  Integer;
    Anio: Integer;
    end;

Procedure LeerFecha(Var Fecha:Tfecha);

Procedure ImprimirFechaCorto(Fecha:Tfecha);

Procedure ImprimirFechaLargo(Fecha:Tfecha);

Procedure ImprimirFechaTexto(Fecha:Tfecha);

implementation

    Procedure LeerFecha(Var Fecha:Tfecha);
    var D,M,A:Integer;
    begin
        Writeln('Ingrese el dia numericamente:'); Readln(D);
        Writeln('Ingrese el Mes numericamente:'); Readln(M);
        Writeln('Ingrese el Anio numericamente:'); Readln(A);
        Writeln('Gracias.');  
        Fecha.Dia :=    D;
        Fecha.Mes :=    M;
        Fecha.Anio:=    A;      
    end;

    Procedure ImprimirFechaCorto(Fecha:Tfecha);
    begin
        Writeln('Su fecha de forma corta:');
        Writeln( Fecha.Dia,' / ', Fecha.Mes);
    end;

    Procedure ImprimirFechaLargo(Fecha:Tfecha);
    begin
        Writeln('Su fecha de forma Larga:');
        Writeln( Fecha.Dia,'/ ', Fecha.Mes,'/ ', Fecha.Anio);
    end;

    Procedure ImprimirFechaTexto(Fecha:Tfecha);
    begin M:String;
        
        Case fecha.Mes of
        1:      M:= 'Enero';
        2:      M:= 'Febrero';
        3:      M:= 'Marzo';
        4:      M:= 'Abril';
        5:      M:= 'Mayo';
        6:      M:= 'Junio';
        7:      M:= 'Julio';
        8:      M:= 'Agosto';
        9:      M:= 'Septiembre';
        10:     M:= 'Octubre';
        11:     M:= 'Noviembre';
        12:     M:= 'Diciembre';
        end;
    end;



end.