{
5 - Escribir un esquema y programa que inicialice con valores enteros
a cuatro conjuntos : C1,C2 , C3 , C4.
Y calcule:
1) C1 Unión C2 
2) C1 - C2 
3) C3   Unión C2 Unión C1
4) C2 Intersección C1 
5) C1 Unión  C2 Intersección  C3
}

program tp2_Ej5;

type
  Conjunto = set of Integer;

var
  C1, C2, C3, C4: Conjunto;
  C: Conjunto; {Variable temporal para cálculos}

begin
  {Inicializar los conjuntos con valores enteros}
  C1 := [1, 2, 3, 4];
  C2 := [3, 4, 5, 6];
  C3 := [5, 6, 7, 8];
  C4 := [7, 8, 9, 10];

  {1) C1 Unión C2}
  C := C1 + C2;
  WriteLn('1) C1 Unión C2: ', C);

  {2) C1 - C2}
  C := C1 - C2;
  WriteLn('2) C1 - C2: ', C);

  {3) C3 Unión C2 Unión C1}
  C := C3 + C2 + C1;
  WriteLn('3) C3 Unión C2 Unión C1: ', C);

  {4) C2 Intersección C1}
  C := C2 * C1;
  WriteLn('4) C2 Intersección C1: ', C);

  {5) C1 Unión C2 Intersección C3}
  C := C2 * C3;
  C := C1 + C;
  WriteLn('5) C1 Unión C2 Intersección C3: ', C);

end.
