{

}
program ejercicio9;
uses crt,Math;

type
    Tindex = set of char;
    Tforma = record
    case tipo: char of
        'T': (
            lado1,lado2,lado3: integer
        );
        'R': (
            base,altura: integer;
        );
        'C': (
            lado: integer;
        );
        'X': (
            radio: integer;
        );
    end;

procedure iniciarForma (var forma: Tforma; seleccion: char);
begin
    if (seleccion = 'T') then begin
        forma.tipo := seleccion;
        writeln('Ingrese el valor de los 3 lados del triangulo:');
        readln(forma.lado1);
        readln(forma.lado2);
        readln(forma.lado3)
    end else if (seleccion = 'R') then begin
        forma.tipo := seleccion;
        writeln('Ingrese el valor de la base y la altura del rectangulo:');
        readln(forma.base);
        readln(forma.altura)
    end else if (seleccion = 'C') then begin
        forma.tipo := seleccion;
        writeln('Ingrese el valor de los lados del cuadrado:');
        readln(forma.lado)
    end else if (seleccion = 'X') then begin
        forma.tipo := seleccion;
        writeln('Ingrese el valor del radio del circulo:');
        readln(forma.radio)
    end;
end;

procedure calcularArea(forma: Tforma);
var
    p,aux,area: real;
begin
    p:=0;
    if (forma.tipo = 'T') then begin
        p := round((forma.lado1 + forma.lado2 + forma.lado3) / 2);
        aux:= p*((p - forma.lado1) * (p - forma.lado2) * (p - forma.lado3));
        area:=sqrt(aux);
    end else if (forma.tipo = 'R') then begin
        area := forma.base * forma.altura
    end else if (forma.tipo = 'C') then begin
        area := sqr(forma.lado)
    end else if (forma.tipo = 'X') then begin
        area := Pi * sqr(forma.radio)
    end;
    writeln('El area de la figura es: ',area:0:2);
end;

var
    formaIngresada: char;
    indice: Tindex;
    forma: Tforma;
begin
    indice := ['T','R','C','X'];
    writeln('Ingrese la forma que quiera utilizando: ');
    writeln('   * Triangulo (T)');
    writeln('   * Rectangulo (R)');
    writeln('   * Cuadrado (C)');
    writeln('   * Circulo (X)');
    readln(formaIngresada);
    writeln;
    while (not (formaIngresada in indice)) do begin
        writeln('Ingrese un valor correcto: ');
        readln(formaIngresada);
        writeln
    end;

    iniciarForma(forma,formaIngresada);
    calcularArea(forma);
end.