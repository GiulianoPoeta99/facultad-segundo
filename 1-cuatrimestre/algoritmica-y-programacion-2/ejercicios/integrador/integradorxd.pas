Program Integradorxd(input,output);
uses crt;

Type
	TPlayer = Record		{defino el score para el player}
	Score: LongInt;
	EspejosEncontrados: Integer;
	DisparosRestantes: Integer;
	end;

	Vidrio = record		{Defino mi objeto vidrio como existente, direccion y Encontrado}
	Existe: Boolean;
	Dir: Boolean;
	Encontrado: Boolean;
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
			Matriz[i,j].Encontrado:= false;
		end;
	end;
end;

Procedure PrepararPlayer(var Player: Tplayer; Nivel:Boolean);
Begin
	Player.Score:= 0;
	Player.EspejosEncontrados:= 0;
	If Nivel = false then Player.DisparosRestantes:= 20
		else Player.DisparosRestantes:= 10;
End;

{Con este procedure cargo los vidrios en mi matriz de manera Manual}
	{
	Procedure CargarVidriosManual(var Matriz: Tmatriz);
	var i,Filas,Columnas,Aux:integer; 
	Begin
		For i:=1 to 2 do
			Begin
				Writeln('Ingrese coordenada de Filas: '); Read(Filas);
				Writeln('Ingrese coordenada de Columnas: '); Read(Columnas);
				Matriz[Filas,Columnas].Existe:= True;
				
				Writeln('Ingrese Direccion:');
				Writeln('"1" para izquierda');
				Writeln('"2" para Derecha');
				Repeat 
					Readln(Aux);
					if (Aux = 1) then Matriz[Filas,Columnas].Dir:= False;
					if (Aux = 2) then Matriz[Filas,Columnas].Dir:= True;
				Until (Aux = 1) or (Aux = 2);			
			end;
	end;
}


{Con este procedure cargo los vidrios en mi matriz de manera random}

Procedure CargarVidriosAleatoriamente(Var matriz:Tmatriz);
var i,Filas,Columnas,Aux:integer;
Begin
	For i:=1 to 5 do
		Begin
			Filas:= 	Random(9)+1;
			Columnas:= 	Random(9)+1;
			Matriz[Filas,Columnas].Existe:= True;
			
			Aux:= random(100);
			Aux:= Aux Mod 2;
			if (Aux <> 0) then Matriz[Filas,Columnas].Dir:= True;	
		end;
end;


{esta funcion es para centrar texto}
function CenterText(texto: string): string;
var  ancho: integer; i: Integer;
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
	Writeln(CenterText('Laser Mania'));
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

{Aqui Seleccionas el Nivel}
Procedure ScriptSelecctorDeNiveles(var Niveles:boolean);
var tecla:Char; 
Begin
	repeat
		clrscr;
		Niveles:= False;
		Writeln('Presione ENTER para seleccionar');
		writeln('flecha hacia arriba para mover el puntero hacia arriba');
		writeln('Flecha hacia abajo para mover el puntero hacia abajo');
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
				writeln('flecha hacia arriba para mover el puntero hacia arriba');
				writeln('Flecha hacia abajo para mover el puntero hacia abajo');
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

{Script para una pantalla de carga}
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
	clrscr;
end;

{Script para mostrar la matriz en pantalla. y Stats del Player}
Procedure ScriptMostrarPantalla(Player: Tplayer; var Matriz:Tmatriz);
var i,j: Integer;
Begin
	clrscr;
	Write('Disparos Restantes: ', 		Player.DisparosRestantes);
	Write(' |Espejos encontrados: ', 	Player.EspejosEncontrados);
	Writeln(' |Score Total: ', 			Player.Score);
	Writeln();
	Writeln('    10 11 12 13 14 15 16 17 18 19  ');
		For i:= 1 to 10 do
		Begin
			Write(10-i ,'  ');
			Write('|'); 
			For j:= 1 to 10 do
			Begin
				if (Matriz[i,j].Encontrado=true) then 
					if (Matriz[i,j].Dir=False) then Write('\ |')
						else Write('/ |')
				else
				write('__|');
			End;
			Writeln(' ', 19 +i );
		end;
	Writeln('    39 38 37 36 35 34 33 32 31 30 ');
End;

Procedure ScriptMostrarPantallaGanadora(Player: Tplayer);
Begin
	clrscr;
	Writeln();Writeln();Writeln();
	Writeln(CenterText('Ganaste !!!'));

	Writeln(CenterText('Score Final: '), player.Score);
	Writeln(CenterText('Disparos Restantes: '), player.DisparosRestantes);
	Writeln(CenterText('Total espejos encontrados: '), player.EspejosEncontrados);
	Writeln(CenterText('Gracias por jugar a este juego.'));
	Writeln(CenterText('Para mi fue un lindo desafio poder armarlo!'));
		
	writeln();writeln();writeln();writeln();writeln();
	writeln();writeln();writeln();writeln();writeln();
	writeln();writeln();writeln();writeln();writeln();
	writeln();writeln();writeln();writeln();writeln();
	Writeln('Presione un boton para salir.');
	Readkey;
	clrscr;
End;

Procedure ScriptMostrarPantallaGameOver(Player: Tplayer);
Begin
	clrscr;
	Writeln();Writeln();Writeln();
	Writeln(CenterText('Perdiste !!!'));

	Writeln(CenterText('Score Final: '), player.Score);
	Writeln(CenterText('Disparos Restantes: '), player.DisparosRestantes);
	Writeln(CenterText('Total espejos encontrados: '), player.EspejosEncontrados);
	Writeln(CenterText('Gracias por jugar a este juego.'));
	Writeln(CenterText('Para mi fue un lindo desafio poder armarlo!'));

	writeln();writeln();writeln();writeln();writeln();
	writeln();writeln();writeln();writeln();writeln();
	writeln();writeln();writeln();writeln();writeln();
	writeln();writeln();writeln();writeln();writeln();
	Writeln('Presione un boton para salir.');
	Readkey;
	clrscr;
End;

Procedure Disparador (var Matriz: Tmatriz; var Player:Tplayer);
var Entrada,Fila,Columna: Integer; Direccion: String; Salida:Boolean;
Begin
	ScriptMostrarPantalla(Player, matriz);
	Writeln('Por donde queres disparar: ');
	Readln(Entrada);
	dec(player.DisparosRestantes);
	inc(player.Score);
	salida:= False;
		Case entrada of
		0..9:	Begin
				Direccion:= '>';
				Fila:= 10 - entrada;
				Columna:= 0;		
				End;
		10..19:	Begin
				Direccion:= 'v';
				Fila:= 0;
				Columna:= entrada-9;
				End;
		20..29:	Begin
				Direccion:= '<';
				Fila:= ((entrada mod 10)+1);
				Columna:= 10;
				End;
		30..39:	Begin
				Direccion:= '^';
				Fila:= 10;
				Columna:= 40-entrada;
				End;
		End; 
	While (salida = False) do 
		Begin
			if (Matriz[Fila,Columna].Existe= True) then			{Si existe } 
				Begin
				if (Matriz[Fila,Columna].Dir= False) then 		{Si es izquierda: \}
					Begin
						Case direccion of
						'>':	Begin
								Direccion:= 'v';
								Writeln('reboto!');
								Fila:=Fila+1;	{me muevo hacia abajo}
								End;
						'<':	Begin
								Direccion:= '^';
								Writeln('reboto!');
								Fila:=Fila-1;	{me muevo hacia arriba}
								End;
						'^':	Begin
								Direccion:= '<';
								Writeln('reboto!'); 
								Columna:=Columna-1;	{me muevo hacia la izquierda}
								End;
						'v':	Begin
								Direccion:= '>';
								Writeln('reboto!');
								Columna:=Columna+1;	{me muevo hacia la derecha}
								End;		
						end;
					end
				else
				if (Matriz[Fila,Columna].Dir= True) then 		{Si es derecha: /}
					Begin
						Case direccion of
						'>':	Begin
								Direccion:= '^';
								Writeln('reboto!');
								Fila:=Fila-1;	{me muevo hacia arriba}
								End;
						'<':	Begin
								Direccion:= 'v';
								Writeln('reboto!');
								Fila:=Fila+1;	{me muevo hacia abajo}
								End;
						'^':	Begin
								Direccion:= '>';
								Writeln('reboto!');
								Columna:=Columna+1;	{me muevo hacia la derecha}
								End;
						'v':	Begin
								Direccion:= '<';
								Writeln('reboto!');
								Columna:=Columna-1;	{me muevo hacia la izquierda}
								End;		
						End;
					End
				end
			else 
				case direccion of
					'>':	Begin
							inc(Columna);	{Avanzo hacia la derecha}
							if (Columna = 11)  then salida:= True;
							end;
					'<':	Begin
							dec(Columna);	{Avanzo hacia la izquierda}
							if (Columna = 0)  then salida:= True;
							end;
					'^':	Begin
							dec(Fila);	{Avanzo hacia arriba}
							if (Fila = 0)  then salida:= True;
							end;
					'v':	Begin
							inc(Fila);	{Avanzo hacia Abajo}
							if (Fila = 11)  then salida:= True;
							end;
				End;
	End;
	If (Columna = 11) 		then Writeln('El rayo salio por la derecha en la Fila: ', 	Fila + 19	);		{	Derecha		}
	If (Columna = 0) 		then Writeln('El rayo salio por la izquierda en la Fila:', 	10 - Fila	);		{	Izquierda	}
	If (Fila = 0)		 	then Writeln('El rayo salio por arriba en la Columna: ', 	Columna + 9	);		{	Arriba		}
	If (Fila = 11)	 		then Writeln('El rayo salio por abajo en la Columna: ', 	40 - Columna);		{	Abajo		}
		 
End;

Procedure SeleccionadorDeVidrios(var Matriz: Tmatriz; var Player:Tplayer);
var Fila,Columna,Dir: Integer; posElegida:Boolean;
Begin
	ScriptMostrarPantalla(Player, Matriz);
	player.Score:=player.Score + 2;
	Writeln('Donde crees que hay un vidrio?');
	Writeln('Ingrese coordenada de Fila');
	Writeln('Donde Fila comienza desde 0 hasta 9'); Readln(Fila);			Fila:= 10-Fila;
	Writeln('Ingrese coordenada de Columna:');
	Writeln('Donde Columna comienza desde 10 hasta 19'); Readln(Columna); 	Columna:=Columna-9;
	Writeln('Y que direccion tiene?' );
	Writeln('"1" para Izquierda(\)' );
	Writeln('"2" para Derecha(/)' );  Readln(Dir);
	if (Dir=1) then posElegida:=false;
	if (Dir=2) then posElegida:=true;
	 
	If (Matriz[Fila,Columna].Existe = True) and (posElegida = Matriz[Fila,Columna].Dir) then 
		Begin
		Writeln('Encontraste un espejo!!!');
		If (Matriz[Fila,Columna].Encontrado = False) Then inc(Player.EspejosEncontrados);
		Matriz[Fila,Columna].Encontrado:=True;
		end
	else
		Writeln('Aqui no hay un espejo, o pusiste mal su direccion');
End;

Procedure MenuOpciones(Var Matriz: Tmatriz; var Player:Tplayer);
var boton: integer;
Begin
	Writeln('Disparar   		(1)');
	Writeln('Seleccionar Vidrio	(2)');
	readln(boton);
	
	If (boton = 1) then Disparador(Matriz,Player)
	else 
	If (boton = 2) then SeleccionadorDeVidrios(Matriz,Player);	
End;

{Programa Principal}
var
Matriz:Tmatriz; Nivel:Boolean; Player: TPlayer;
Begin
Randomize();
 
	ScripInicio();
	
	LimpiarMatriz(Matriz);

	ScriptInicioDelJuego();

	{CargarVidriosManual(Matriz);}
	CargarVidriosAleatoriamente(Matriz);
		
	ScriptSelecctorDeNiveles(Nivel);
	
	PrepararPlayer(Player, nivel);	
	
	Repeat
		ScriptMostrarPantalla(Player,Matriz);
		
		MenuOpciones(Matriz, Player);
		Writeln('Presione ENTER para continuar'); Readkey;

	Until (Player.DisparosRestantes = 0) or (Player.EspejosEncontrados = 5);
	
	If (Player.EspejosEncontrados = 5) then	
		ScriptMostrarPantallaGanadora(player);
	
	If (Player.DisparosRestantes = 0) And (Player.EspejosEncontrados < 5) then	
	ScriptMostrarPantallaGameOver(player);
	
end.