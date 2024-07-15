{
    Escribir un esquema y programa que inicialice con valores enteros a cuatro conjuntos : C1,
    C2 , C3 , C4 y calcule
}
program ejercicio5;
uses crt;

type
    Tconjunto = set of byte;

procedure escribirConjunto (conjunto: Tconjunto);
var
	i: byte;
begin
	for i in conjunto do 
        write(i, ' ,');
    writeln;
end;

procedure iniciarConjunto(var largo: integer; posicion:integer; var conjunto: Tconjunto);
var
    i: integer;
    aux: byte;
begin
    conjunto := [];
    writeln('Ingrese el largo del conjunto nro ', posicion,':');
    readln(largo);
    for i:=1 to largo do 
    begin
        writeln('ingrese el valor nro ',i,' del conjunto ',posicion);
        readln(aux);
        conjunto := conjunto + [aux];
    end;
end;

var 
    largo1, largo2, largo3, largo4, largo5: integer;
    c1, c2, c3, c4, c5, c1uc2, c1difc2, c3uc2uc1, c2nc1, c1uc2nc3: Tconjunto;
begin
    iniciarConjunto(largo1, 1, c1);
    iniciarConjunto(largo2, 2, c2);
    iniciarConjunto(largo3, 3, c3);
    iniciarConjunto(largo4, 4, c4);
    iniciarConjunto(largo5, 5, c5);

    //hago las operaciones
    c1uc2 := c1 + c2;
    c1difc2 := c1- c2;
    c3uc2uc1 := (c3 + c2) + c1;
    c2nc1 := c2 * c1;
    c1uc2nc3 := (c1 + c2) * c3;

    writeln('la union de c1 y c2 es:');
    escribirConjunto(c1uc2);

    writeln('la diferencia de c1 y c2 es:');
    escribirConjunto(c1difc2);

    writeln('la union de c3, c2 y c1 es:');
    escribirConjunto(c3uc2uc1);

    writeln('la interseccion de c2 y c1 es:');
    escribirConjunto(c2nc1);

    writeln('la union de c1 y c2 y la interseccion con c3 es:');
    escribirConjunto(c1uc2nc3);
end.
