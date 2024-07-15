Program integrador;
uses crt;

Type
	TPlayer = Record		{defino el score para el player o players}
	Score: LongInt;
	VidriosEncontrados: Integer;
	DisparosRealizados: Integer;
	CantidadDeDisparos: Integer;
	end;

	Vidrio = record		{Defino mi objeto vidrio cmo existente y direccion}
	Existe: Boolean;
	Dir: Boolean;
	end;

	Tmatriz = array[1..10, 1..10] of vidrio; {mi matriz de vidrios}
	
{Proceso para limpiar mi matriz}
Procedure LimpiarMatriz(var Matriz: Tmatriz);
var i,j:integer;
Begin
for i:=1 to 10 do
	Begin
		For j:=1 to 10 do
			Begin
				Matriz[i,j].Existe:= false;
				Matriz[i,j].Dir:= false;
			end;
	end;
end;

{Con este procedure cargo los vidrios en mi matriz de manera random}
Procedure CargarVidrios(Var matriz:Tmatriz);
var i,x,y,Aux:integer;
Begin
For i:=1 to 5 do
	Begin
		x:= Random(10);
		y:= Random(10);
		Matriz[x,y].Existe:= True;
		
		aux:= random(1);
		if (Aux = 0) then Matriz[x,y].Existe:= True
			else Matriz[x,y].Dir:= False;	
	end;
end;

{esta funcion es para centrar texto}
function CenterText(texto: string): string;
var
  ancho: integer; i: Integer;
begin
  ancho := (80 - Length(texto)) div 2; // 80 es el ancho de la pantalla
  CenterText := '';
  for i := 1 to ancho do
    CenterText := CenterText + ' ';
  CenterText := CenterText + texto;
end;

{Primera pantalla del juego}
Procedure ScriptInicioDelJuego();
Begin
clrscr;
Writeln();Writeln();Writeln();
Writeln(CenterText('Bienvenido al juego Integrador:'));
Writeln(CenterText('Lazer Mania'));
Writeln(CenterText('Disenado y Programado por:'));
Writeln(CenterText('Franco Joaquin Gomez')); 
writeln();writeln();writeln();writeln();writeln();
writeln();writeln();writeln();writeln();writeln();
writeln();writeln();writeln();writeln();writeln();
writeln();writeln();writeln();writeln();writeln();
Writeln('Presione un boton para comenzar.');
Readkey;
clrscr;
End;

{Segunda pantalla del juego}
{Seleccionador de niveles}
Procedure ScriptSelecctorDeJugadores(var Cantidad:boolean; var Players: Tplayer);
var tecla:Char; 
Begin
repeat
	clrscr;
	Cantidad:= False;
	Writeln('Presione ENTER para seleccionar');
	writeln('Flecha hacia abajo para mover el puntero hacia abajo');
	writeln('flecha hacia arriba');
	writeln();writeln();writeln();
	Writeln(CenterText('Seleccione jugadores:'));
	Writeln(CenterText('--> 1 Player'));
	Writeln(CenterText('2 Players'));
	writeln();writeln();writeln();writeln();writeln();
	writeln();writeln();writeln();writeln();writeln();
	writeln();writeln();writeln();writeln();writeln();
	writeln();writeln();writeln();
	Writeln('Presione un boton para comenzar.');

	tecla:= readkey;
	If (tecla = #80) then 
		Begin
			clrscr;
			Cantidad:= True;
			Writeln('Presione ENTER para seleccionar');
			writeln('Flecha hacia abajo para mover el puntero hacia abajo');
			writeln('flecha hacia arriba');
			writeln();writeln();writeln();
			Writeln(CenterText('Seleccione jugadores:'));
			Writeln(CenterText(' 1 Player'));
			Writeln(CenterText('-->2 Players'));
			writeln();writeln();writeln();writeln();writeln();
			writeln();writeln();writeln();writeln();writeln();
			writeln();writeln();writeln();writeln();writeln();
			writeln();writeln();writeln();
			Writeln('Presione un boton para comenzar.');
			tecla:= readkey;
			
		end;
	until (ord(tecla) = 13);
clrscr;
//If (Cantidad= false) then 
End;

Procedure ScriptSelecctorDeNiveles(var Niveles:boolean);
var tecla:Char; 
Begin
repeat
	clrscr;
	Niveles:= False;
	Writeln('Presione ENTER para seleccionar');
	writeln('Flecha hacia abajo para mover el puntero hacia abajo');
	writeln('flecha hacia arriba');
	writeln();writeln();writeln();
	Writeln(CenterText('Seleccione Nivel de dificultad:'));
	Writeln(CenterText('--> Nivel 1'));
	Writeln(CenterText('Nivel 2'));
	writeln();writeln();writeln();writeln();writeln();
	writeln();writeln();writeln();writeln();writeln();
	writeln();writeln();writeln();writeln();writeln();
	writeln();writeln();writeln();
	Writeln('Presione un boton para comenzar.');

	tecla:= readkey;
	If (tecla = #80) then 
		Begin
			clrscr;
			Niveles:= True;
			Writeln('Presione ENTER para seleccionar');
			writeln('Flecha hacia abajo para mover el puntero hacia abajo');
			writeln('flecha hacia arriba');
			writeln();writeln();writeln();
			Writeln(CenterText('Seleccione Nivel de dificultad:'));
			Writeln(CenterText('Nivel 1'));
			Writeln(CenterText('--> Nivel 2'));
			writeln();writeln();writeln();writeln();writeln();
			writeln();writeln();writeln();writeln();writeln();
			writeln();writeln();writeln();writeln();writeln();
			writeln();writeln();writeln();
			Writeln('Presione un boton para comenzar.');
			tecla:= readkey;
			
		end;
	until (ord(tecla) = 13);
clrscr;
End;

Procedure ScripInicio();
Begin
clrscr;
Writeln();Writeln();Writeln();
Writeln(CenterText('Estamos crafteando la super matriz misteriosa'));
Writeln(CenterText('Espere unos momentos porfavor'));
writeln();writeln();writeln();writeln();writeln();
writeln();writeln();writeln();writeln();writeln();
writeln();writeln();writeln();writeln();writeln();
writeln();writeln();writeln();writeln();writeln();
delay(4000);
end;

Procedure ScriptMostrarPantalla(var Matriz:Tmatriz; Cantidad: Boolean; Niveles:Boolean; var Players: Tplayer);
var boton: Integer; x,y: Integer;
Begin
Boton:=0;
clrscr;
if Cantidad= false then Write('Jugando: Player 1')
else Write('Jugando: Player 2');

Writeln();Writeln();Writeln();
Writeln(CenterText('   39  38  37  36  35  34  33  32  31  30     '));
Writeln(CenterText('   ___ ___ ___ ___ ___ ___ ___ ___ ___ ___    '));
Writeln(CenterText('0 |   |   |   |   |   |   |   |   |   |   | 29'));
Writeln(CenterText('  |___|___|___|___|___|___|___|___|___|___|   '));
Writeln(CenterText('1 |   |   |   |   |   |   |   |   |   |   | 28'));
Writeln(CenterText('  |___|___|___|___|___|___|___|___|___|___|   '));
Writeln(CenterText('2 |   |   |   |   |   |   |   |   |   |   | 27'));
Writeln(CenterText('  |___|___|___|___|___|___|___|___|___|___|   '));
Writeln(CenterText('3 |   |   |   |   |   |   |   |   |   |   | 26'));
Writeln(CenterText('  |___|___|___|___|___|___|___|___|___|___|   '));
Writeln(CenterText('4 |   |   |   |   |   |   |   |   |   |   | 25'));
Writeln(CenterText('  |___|___|___|___|___|___|___|___|___|___|   '));
Writeln(CenterText('5 |   |   |   |   |   |   |   |   |   |   | 24'));
Writeln(CenterText('  |___|___|___|___|___|___|___|___|___|___|   '));
Writeln(CenterText('6 |   |   |   |   |   |   |   |   |   |   | 23'));
Writeln(CenterText('  |___|___|___|___|___|___|___|___|___|___|   '));
Writeln(CenterText('7 |   |   |   |   |   |   |   |   |   |   | 22'));
Writeln(CenterText('  |___|___|___|___|___|___|___|___|___|___|   '));
Writeln(CenterText('8 |   |   |   |   |   |   |   |   |   |   | 21'));
Writeln(CenterText('  |___|___|___|___|___|___|___|___|___|___|   '));
Writeln(CenterText('9 |   |   |   |   |   |   |   |   |   |   | 20'));
Writeln(CenterText('  |___|___|___|___|___|___|___|___|___|___|   '));
Writeln(CenterText('   10  11  12  13  14  15  16  17  18  19     '));

if (Niveles = false) then Players.CantidadDeDisparos:= 20
 else  Players.CantidadDeDisparos:= 10;
writeln('Cantidad de Disparos Restantes: ', Players.CantidadDeDisparos);
writeln('Espejos encontrados: ', Players.VidriosEncontrados);

Writeln('Indicar espejo: 1');
Writeln('Indicar Disparo: 2');
Readln(boton);	
If (boton = 1) Then 
	Begin
	Writeln('Indique coordenada x:'); Readln(x);
	Writeln('Indique coordenada y:'); Readln(y);
	if (Matriz[x,y].Existe= True) then 
		Begin
		Writeln('Encontraste un espejo!');
		Players.VidriosEncontrados:=Players.VidriosEncontrados+1;
		Matriz[x,y].Existe:= False;
		End;
	End;

End;

var
Matriz:Tmatriz; Cantidad:Boolean; Niveles:Boolean; Players: TPlayer;
Begin
	ScripInicio();
	
	LimpiarMatriz(Matriz);
	
	CargarVidrios(Matriz);
	
	ScriptInicioDelJuego();
	
	ScriptSelecctorDeJugadores(Cantidad,Players);
	
	ScriptSelecctorDeNiveles(Niveles);
	
	ScriptMostrarPantalla(Matriz, Cantidad,Niveles, Players);
	
	

end.
