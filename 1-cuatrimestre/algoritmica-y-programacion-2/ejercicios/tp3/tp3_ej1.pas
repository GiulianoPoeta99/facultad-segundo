program tp3_ej1;

Const
Max = 100;

Type 
Tvector = array [1..Max]of Integer; 

var 
Vector: Tvector; i: Integer; valor: Integer;

Begin
Randomize;
	Repeat
	Writeln('Ingrese el valor del vector de largo(entre 1 y 100): ');
	Readln(valor);
	Until (Valor >= 1) or (Valor <=100);

	For i:=1 to valor do
		Vector[i] := Random(101);
	
	Writeln('Su vector invertido es: ');
	
	For i:= Valor downto 1 do
		Write(Vector[i],' ');
End.
