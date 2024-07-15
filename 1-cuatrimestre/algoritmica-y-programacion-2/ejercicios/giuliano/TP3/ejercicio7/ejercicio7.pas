{
    Escribir un programa en Pascal que lea una matriz cuadrada de enteros y la descomponga
    en dos matrices, una simétrica B y otra antisimétrica C tales que:
    B[I,J] = ( A[I,J] + A[J,I]) / 2 = B[J,I] C[I,J] = (A[I,J] - A[J,I]) / 2 = -C[J,I]
    Imprimir las tres matrices.
}
program ejercicio7;
uses crt;
const
    N=3;

type 
    Tmatriz = array[1..N,1..N] of integer;

procedure escribirMatriz(matriz:Tmatriz);
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

var
    A,B,C: Tmatriz;
    i,j:integer;

begin
    writeln('Ingrese los elementos de la matriz:');
    for i := 1 to N do begin
        for j := 1 to N do begin
            read(A[i,j]);
        end;
    end;

    for i := 1 to N do begin
        for j := 1 to N do begin
            B[i,j] := (A[i,j] + A[j,i]) div 2;
            C[i,j] := (A[i,j] - A[j,i]) div 2;
        end;
    end;
    
    writeln;
    escribirMatriz(A);
    writeln;
    escribirMatriz(B);
    writeln;
    escribirMatriz(C);
end.
