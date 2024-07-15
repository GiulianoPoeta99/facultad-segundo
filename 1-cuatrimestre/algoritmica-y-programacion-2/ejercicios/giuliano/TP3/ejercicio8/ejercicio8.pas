

program ejercicio8;
uses crt;
const
    N = 3;
type
    Trala = array[1..N,1..N] of integer;
    Tcompacta = array[1..((N*N) div 2),1..3] of integer;
    
procedure escribirMatrizRala(matriz:Trala);
var
    i,j:integer;
begin
    for i := 1 to N do begin
        for j := 1 to N do begin
            if (j=N) then begin
                write(matriz[i,j])
            end else begin
                write(matriz[i,j],', ')
            end;
        end;
        writeln;
    end;
end;

procedure escribirMatriz(matriz:Tcompacta);
var
    i,j:integer;
begin
    for i := 1 to ((N*N) div 2) do begin
        for j := 1 to 3 do begin
            if (j=3) then begin
                write(matriz[i,j])
            end else begin
                write(matriz[i,j],', ')
            end;
        end;
        writeln;
    end;
end;

procedure contarElementos(rala:Trala; var nulos,noNulos:integer);
var
    i,j:integer;
begin
    nulos:=0;
    noNulos:=0;
    for i := 1 to N do begin
        for j := 1 to N do begin
            if (rala[i,j] = 0) then begin
                inc(nulos)
            end else begin
                inc(noNulos)
            end;
        end;
    end;
    writeln('no nulos')
end;

procedure acomodarMatriz(var compacta: Tcompacta; rala:Trala; nulos,noNulos:integer);
var
    i,j,k: integer;
begin
    compacta[1,1]:=N;
    compacta[1,2]:=N;
    compacta[1,3]:=noNulos;
    k:=2;
    for i:=1 to N do begin
        for j:=1 to N do begin
            if (rala[i,j] <> 0) then begin
                compacta[k,1]:=i;
                compacta[k,2]:=j;
                compacta[k,3]:=rala[i,j];
                inc(k);
            end;
        end;
    end;
end;

var
    i,j,ceros,elementos:integer;
    rala: Trala;
    compacta: Tcompacta;
begin
    writeln('Ingrese los elementos de la matriz rala:');
    for i := 1 to N do begin
        for j := 1 to N do begin
            read(rala[i,j]);
        end;
    end;
    writeln;
    escribirMatrizRala(rala);
    writeln;

    contarElementos(rala,ceros,elementos);
    acomodarMatriz(compacta,rala,ceros,elementos);

    escribirMatriz(compacta);
end.