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
        1:      M:=Enero;
        2:      M:=Enero;
        3:      M:=Enero;
        4:      M:=Enero;
        5:      M:=Enero;
        6:      M:=Enero;
        7:      M:=Enero;
        8:      M:=Enero;
        9:      M:=Enero;
        10:     M:=Enero;
        11:     M:=Enero;
        12:     M:=Enero;
        end;
    end;



end.