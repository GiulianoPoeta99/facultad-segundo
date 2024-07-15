Program tp2_ej9;

Type 
Elementos = Set of char;

Procedure MostrarComplemento(SuComplemento:Elementos);
var
C: Char;
Begin
	For C in SuComplemento do
		write(C,' ');
	writeln();
End;

Procedure Complementar(FraseDada:String; var SuComplemento: Elementos);
var
Auxiliar,ElementosdeFrase: Elementos; c: Char;
Begin
	Auxiliar:= ['a'..'z','A'..'Z'];
	ElementosdeFrase:=[];
	
	for C in FraseDada do
	ElementosdeFrase:= ElementosdeFrase + [C];
	
	SuComplemento:= Auxiliar - ElementosdeFrase;
End;


var
Frase: String; SuComplemento: Elementos;

Begin
	SuComplemento:=[];
	Writeln('Ingrese Frase: ');
	Readln(Frase);
	Complementar(Frase,SuComplemento);
	MostrarComplemento(SuComplemento);
End.
