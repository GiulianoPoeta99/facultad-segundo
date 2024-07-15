program Espejos;
(*
    Lautaro Barba
    Programa: Trabajo Práctico Integrador: Espejos.
*)

uses 
    crt,
    sysutils,
    strings;

const
	//Pruebas para el tamaño de ventana
	//SCREENHEIGHT = 30; (* Alto que tendra la pantalla de juego *)
	//SCREENWIDTH = 100; (* Ancho que tendra la pantalla de juego *)
	
	//Tamaños de ventana en uso
	SCREENHEIGHT = 30; (* Alto que tendra la pantalla de juego *)
	SCREENWIDTH = 120; (* Ancho que tendra la pantalla de juego *)
	TITULO_PROGRAMA = 'TP Integrador - Espejos'; 

type
	T_direccion = (izquierda, derecha, arriba, abajo);

	T_casilla = record
				estado: boolean;	(* False = libre; True = ocupada *)
				elemento: T_direccion;
				end;
				
	T_matriz = array [1..10, 1..10] of T_casilla;
	
var
	tablero_espejos, tablero_estimas: T_matriz;
	tipo_caja, nivel_dificultad, repetir, rendirse: boolean;
	opcion_menu, disparos, estimas, aciertos, salida, puntaje: integer;

{Inicio de procedimientos y funciones particulares del programa}

(* Procedimiento que enmarca la pantalla del programa *)
procedure Enmarcar_Pantalla ();
var 
    aux, altura, ancho: integer;
begin
	altura:= SCREENHEIGHT;
	ancho:= SCREENWIDTH;
	
	ClrScr();
	TextColor(Cyan);
	gotoxy(1, 1); (* Dibujo el marco de arriba *)
	for aux:= 1 to ancho do
		Write('#');

	for aux:= 2 to (altura - 1) do (* Dibujo el marco de la izquierda *)
		begin
		gotoxy(1, aux);
		Write('|');
		end;

	for aux:= 2 to (altura - 1) do (* Dibujo el marco de la derecha *)
		begin
		gotoxy(ancho, aux);
		Write('|');
		end;

	gotoxy(1, altura - 1); (* Dibujo el marco de abajo *)
	for aux:= 1 to ancho do
		Write('#');

	gotoxy(2, 2); (* Posiciono el cursor al comienzo del primer renglón *)
	TextColor(White);
end;

(* Procedimiento que recibe un título como string *)
	(* y lo enmarca en el centro de la ventana *)
procedure Enmarcar_Titulo (const titulo: string);
(* Para este procedimiento es necesario usar la unidad strings *)
var
	longitud: integer;
	indice: integer;
	ancho_ventana: integer;
	espacio_blanco: integer;
begin   
	(* Guardo la longitud del título *)
	longitud:= Length(titulo);

	(* Guardo la longitud de la ventana *)
	ancho_ventana:= SCREENWIDTH;
	espacio_blanco:= (ancho_ventana div 2) - (longitud div 2);

	(* Posiciono el cursor al comienzo del primer renglón disponible *)
	gotoxy(1, 2); 
  	TextColor(Cyan);
  	
	(* Dibujo el marco de arriba *)
	Write('|');
	for indice:= 1 to (espacio_blanco - 1) do
		Write(' ');
	for indice := 1 to (longitud + 4) do
		Write('-');
	WriteLn();
    
	(* Inserto el título con marcos laterales *)
	Write('|');
	for indice:= 1 to (espacio_blanco - 1) do
		Write(' ');
	WriteLn('| ', titulo,' |');

	(* Dibujo el marco de abajo *)
	write('|');
	for indice:= 1 to (espacio_blanco - 1) do
		Write(' ');
	for indice := 1 to (longitud + 4) do
		Write('-');
	WriteLn();

	(* Dibujo el segundo marco de abajo *)
	for indice:= 1 to ancho_ventana do
		Write('#');
	WriteLn();

	TextColor(White);
end;

(* Procedimiento para crear la ventana de trabajo *)
procedure Crear_Ventana ();
var
	altura, ancho: integer;
begin
	altura:= SCREENHEIGHT;
	ancho:= SCREENWIDTH;
	Window(2, 6, ancho - 1, altura - 2); (* Inicia en las coordenadas (2,6) para no pisar el marco *)
	gotoxy(1, 1); (* Posiciono el cursor al comienzo del primer renglón *)
end;

(* Procedimiento para eliminar la ventana de trabajo *)
procedure Eliminar_Ventana ();
begin
	Window(1, 1, SCREENWIDTH, SCREENHEIGHT);
	gotoxy(SCREENWIDTH, SCREENHEIGHT - 1);
	WriteLn();
	WriteLn('Dews!');
	ClrScr();
end;

(* Procedimiento para centrar un string en medio de la pantalla *)
procedure Centrar_Texto(const texto: string);
var
	longitud_texto: integer;
	ancho_ventana: integer;
	espacio_blanco: integer;
begin
	(* Guardo la longitud del texto *)
	longitud_texto:= Length(texto);

	(* Guardo la longitud de la ventana *)
	ancho_ventana:= SCREENWIDTH;
	espacio_blanco:= (ancho_ventana div 2) - (longitud_texto div 2) + 2;
  
	(* Inserto el texto en el centro *)
	gotoxy(espacio_blanco, WhereY()); (* Uso WhereY() para no cambiar el renglon *)
	WriteLn(texto);
end;

(* Procedimientos para imprimir las opciones del los menus *)
procedure Imprimir_opcion_uno (const opcion: integer);
begin
	ClrScr();
	Centrar_Texto('Seleccione una opcion para jugar con el tablero tapado o destapado');
	case opcion of
		0:	begin
			Centrar_Texto('[X] Tapado   ');
			Centrar_Texto('[ ] Destapado');
			end;
		1:	begin
			Centrar_Texto('[ ] Tapado   ');
			Centrar_Texto('[X] Destapado');
			end;
		end;
end;
procedure Imprimir_opcion_dos (const opcion: integer);
begin
	ClrScr();
	Centrar_Texto('Seleccione el nivel de dificultad');
	case opcion of
		0:	begin
			Centrar_Texto('[X] Nivel 1');
			Centrar_Texto('[ ] Nivel 2');
			end;
		1:	begin
			Centrar_Texto('[ ] Nivel 1');
			Centrar_Texto('[X] Nivel 2');
			end;
		end;
end;
procedure Imprimir_opcion_tres (const opcion: integer);
begin
	GotoXY(1, WhereY() - 5);
	WriteLn('Seleccione siguiente movimiento: ');
	case opcion of
		0:	begin
			WriteLn('[X] Disparar');
			WriteLn('[ ] Estimar ');
			WriteLn('[ ] Puntaje ');
			WriteLn('[ ] Rendirse');
			end;
		1:	begin
			WriteLn('[ ] Disparar');
			WriteLn('[X] Estimar ');
			WriteLn('[ ] Puntaje ');
			WriteLn('[ ] Rendirse');
			end;
		2:	begin
			WriteLn('[ ] Disparar');
			WriteLn('[ ] Estimar ');
			WriteLn('[X] Puntaje ');
			WriteLn('[ ] Rendirse');
			end;
		3:	begin
			WriteLn('[ ] Disparar');
			WriteLn('[ ] Estimar ');
			WriteLn('[ ] Puntaje ');
			WriteLn('[X] Rendirse');
			end;
		end;
end;
procedure Imprimir_opcion_cuatro (const opcion: integer);
begin
	GotoXY(1, WhereY() - 3);
	WriteLn('Fin del juego...');
	case opcion of
		0:	begin
			WriteLn('[X] Volver a Jugar ');
			WriteLn('[ ] Salir          ');
			end;
		1:	begin
			WriteLn('[ ] Volver a Jugar ');
			WriteLn('[X] Salir          ');
			end;
		end;
end;

(* Función para desplegar el menu seleccionado *)
function Menu (const tipo, cantidad_opciones: integer): integer; (* Retorna como valor la opcion elegida *)
var
	key: char;
	arrow: boolean;
	opcion: integer;
begin
	opcion:= 1000;		(* Al desplegar el menu ya se encuentra seleccionada la primera opcion *)
	Menu:= 0;
	
	case tipo of
		1:	Imprimir_opcion_uno(Menu);
		2:	Imprimir_opcion_dos(Menu);
		3:	Imprimir_opcion_tres(Menu);
		4: 	Imprimir_opcion_cuatro(Menu);
		end;

	repeat
		if (KeyPressed()) then			(* Sólo leo la tecla si se apretó en ese momento *)
			begin
			key:= ReadKey();			(* Guardo en "key" la tecla presionada *)
			if ord(key) = 0 then		(* Los caracteres especiales comienzan con este valor *)
				begin
				key:= ReadKey();		(* Tengo que leer dos veces para saber el valor del caracter especial *)
				arrow:= ord(key) in [72, 80];
				if (arrow) then 		(* Si el valor de la tecla corresponde a una flecha lo acepto como opción *)
					begin
					case ord(key) of
						72: (*arriba*)
							begin
							dec(opcion);
							Menu:= opcion MOD cantidad_opciones; (* Calculo el modulo para que no se pase de 2 o 4 opciones *)
							end;
						80: (*abajo*)
							begin
							inc(opcion);
							Menu:= opcion MOD cantidad_opciones; (* Calculo el modulo para que no se pase de 2 o 4 opciones *)
							end;
						end;
					case tipo of
						1:	Imprimir_opcion_uno(Menu);
						2:	Imprimir_opcion_dos(Menu);
						3:	Imprimir_opcion_tres(Menu);
						4: 	Imprimir_opcion_cuatro(Menu);
						end;
					end;
				end;
			end;
		until (ord(key) = 13);
end;

(* Procedimiento para imprimir el tablero actual *)
 procedure Imprimir_Tablero_Espejos (const tablero: T_matriz; const tapado: boolean);
 var
	fila, columna: integer;
	ancho_ventana, espacio_blanco: integer;
	indice_izq, indice_der: integer;
begin
	ancho_ventana:= SCREENWIDTH;
	
	//Intentar cambiar el 12 por algo mas explicativo. Deberia ser la mitad del ancho del grafico
	espacio_blanco:= (ancho_ventana div 2) - 12;
	ClrScr();
	indice_izq:= 0;
	indice_der:= 20;
	
	if (tapado) then
		begin
		Centrar_Texto('Imprimiendo tablero tapado');
		WriteLn();
		gotoxy(espacio_blanco, WhereY()); (* Uso WhereY() para no cambiar el renglon *)
		WriteLn('10 11 12 13 14 15 16 17 18 19');
		gotoxy(espacio_blanco, WhereY()); (* Uso WhereY() para no cambiar el renglon *)
		WriteLn('------------------------------');
		for fila:= 1 to 10 do
			begin
			(* Inserto el texto en el centro *)
			gotoxy(espacio_blanco - 2, WhereY());
			Write(9 - indice_izq, '|');
			for columna:=1 to 10 do
				begin
				Write('   ');  
				//Write('-|-');  
				end;
			Write('|', indice_der);
			WriteLn();
			indice_izq:= indice_izq + 1;
			indice_der:= indice_der + 1;
			end;
		gotoxy(espacio_blanco, WhereY());
		WriteLn('------------------------------');
		gotoxy(espacio_blanco, WhereY());
		WriteLn('39 38 37 36 35 34 33 32 31 30');
		end
	else
		begin
		Centrar_Texto('Imprimiendo tablero destapado');
		WriteLn();
		gotoxy(espacio_blanco, WhereY()); (* Uso WhereY() para no cambiar el renglon *)
		WriteLn('10 11 12 13 14 15 16 17 18 19');
		gotoxy(espacio_blanco, WhereY()); (* Uso WhereY() para no cambiar el renglon *)
		WriteLn('------------------------------');
		for fila:= 1 to 10 do
			begin
			(* Inserto el texto en el centro *)
			gotoxy(espacio_blanco - 2, WhereY());
			Write(9 - indice_izq, '|');
			for columna:=1 to 10 do
				begin
				if (tablero[fila, columna].estado = false) then
					Write('   ')
					else
						if (tablero[fila, columna].elemento = izquierda) then
							Write(' \ ')
						else if (tablero[fila, columna].elemento = derecha) then
							Write(' / ');
				end;
			Write('|', indice_der);
			WriteLn();
			indice_izq:= indice_izq + 1;
			indice_der:= indice_der + 1;
			end;
		gotoxy(espacio_blanco, WhereY());
		WriteLn('------------------------------');
		gotoxy(espacio_blanco, WhereY());
		WriteLn('39 38 37 36 35 34 33 32 31 30');
		end;
	WriteLn();
end;

(* Procedimiento para imprimir el tablero de espejos junto 
	a las estimas para controlar el resultado obtenido *)
 procedure Comparar_Resultado (const tablero_espejos, tablero_estimas: T_matriz);
 var
	fila, columna: integer;
	ancho_ventana, espacio_blanco: integer;
	indice_izq, indice_der: integer;
begin
	ancho_ventana:= SCREENWIDTH;
	//Intentar cambiar el 35 por algo mas explicativo. Deberia ser la mitad del ancho del grafico 
	espacio_blanco:= (ancho_ventana div 2) - 35;
	indice_izq:= 0;
	indice_der:= 20;
	
	(* Imprimo el tablero de estimas al lado del de espejos para comparar visualmmente *)
	Centrar_Texto('ESPEJOS                  ||                  ESTIMAS');
	Centrar_Texto('10 11 12 13 14 15 16 17 18 19       ||      10 11 12 13 14 15 16 17 18 19  ');
	Centrar_Texto('------------------------------      ||      ------------------------------ ');
	for fila:= 1 to 10 do
		begin
		(* Inserto el texto en el centro *)
		gotoxy(espacio_blanco - 2, WhereY());
		
		(* Imprimo la primera matriz de espejos *)
		Write(9 - indice_izq, '|');
		for columna:=1 to 10 do
			begin
			if (tablero_espejos[fila, columna].estado = false) then
				Write('   ')
				else
					if (tablero_espejos[fila, columna].elemento = izquierda) then
						Write(' \ ')
					else if (tablero_espejos[fila, columna].elemento = derecha) then
						Write(' / ');
			end;
		Write('|', indice_der, '   ||    ', 9 - indice_izq, '|');
		
		(* Imprimo la segunda matriz de estimas *)
		for columna:=1 to 10 do
			begin
			if (tablero_estimas[fila, columna].estado = false) then
				begin
				Write('   ');
				end
			else
				begin
					if (tablero_estimas[fila, columna].elemento = izquierda) then
						begin
						Write(' X ');
						end 
					else if (tablero_estimas[fila, columna].elemento = derecha) then
						begin
						Write(' X ');
						end;
				end;
			end;
		Write('|', indice_der);
		WriteLn();
		indice_izq:= indice_izq + 1;
		indice_der:= indice_der + 1;
		end;
	Centrar_Texto('------------------------------      ||      ------------------------------');
	Centrar_Texto('39 38 37 36 35 34 33 32 31 30       ||      39 38 37 36 35 34 33 32 31 30 ');
	WriteLn();
end;

(* Procedimiento para imprimir el tablero actual *)
 procedure Imprimir_Tablero_Laser (const tablero: T_matriz);
 var
	fila, columna: integer;
	ancho_ventana, espacio_blanco: integer;
	indice_izq, indice_der: integer;
begin
	ancho_ventana:= SCREENWIDTH;
	espacio_blanco:= (ancho_ventana div 2) - 12;
	ClrScr();
	indice_izq:= 0;
	indice_der:= 20;
	
	Centrar_Texto('Imprimiendo tablero destapado');
	WriteLn();
	gotoxy(espacio_blanco, WhereY()); (* Uso WhereY() para no cambiar el renglon *)
	WriteLn('10 11 12 13 14 15 16 17 18 19');
	gotoxy(espacio_blanco, WhereY()); (* Uso WhereY() para no cambiar el renglon *)
	WriteLn('------------------------------');
	for fila:= 1 to 10 do
		begin
		(* Inserto el texto en el centro *)
		gotoxy(espacio_blanco - 2, WhereY());
		Write(9 - indice_izq, '|');
		for columna:=1 to 10 do
			begin
			if (tablero[fila, columna].estado = false) then
				Write('   ')
				else
					if (tablero[fila, columna].elemento = izquierda) or (tablero[fila, columna].elemento = derecha) then
						Write('---')
					else if (tablero[fila, columna].elemento = arriba) or (tablero[fila, columna].elemento = abajo) then
						Write(' | ');
			end;
		Write('|', indice_der);
		WriteLn();
		indice_izq:= indice_izq + 1;
		indice_der:= indice_der + 1;
		end;
	gotoxy(espacio_blanco, WhereY());
	WriteLn('------------------------------');
	gotoxy(espacio_blanco, WhereY());
	WriteLn('39 38 37 36 35 34 33 32 31 30');
	WriteLn();
end;

(* Procedimiento para inicializar el tablero sin espejos *)
procedure Inicializar_Tablero (var tablero: T_matriz);
var
	fila, columna: integer;
begin
	for fila:= 1 to 10 do
		for columna:= 1 to 10 do
			begin
			tablero[fila, columna].estado:= false;
			tablero[fila, columna].elemento:= izquierda;
			end;
end;

(* Procedimiento para contar los espejos del tablero *)
function Contar_Objetos (const tablero: T_matriz): integer;
var
	cantidad: integer;
	fila, columna: integer;
begin
	cantidad:= 0;
	
	(* Recorro toda la matriz y cuento un objeto si la casilla esta ocupada *)
	for fila:= 1 to 10 do
		for columna:= 1 to 10 do
			begin
			if (tablero[fila, columna].estado = true) then
				cantidad:= cantidad + 1;
			end;
	Contar_Objetos:= cantidad;
end;

(* Procedimiento para eliminar los simbolos no numericos de una cadena de texto *)
procedure Eliminar_Simbolos (var cadena: string);
type
	Tconjunto_digitos = set of char;
var
	digitos: Tconjunto_digitos;
	indice: integer;
begin
	digitos:= ['0'..'9'];
	indice:= 1;
	while (indice <= Length(cadena)) do
		begin
		if (cadena[indice] in digitos) then
			indice:= indice + 1
		else
			Delete(cadena, indice, 1);
		end;
	Delete(cadena, indice, 1);
end;

(* Pocedimiento para leer un numero entero *)
function LeerNumero (): integer;
var
	texto: string;
begin
	LeerNumero:= -1;
	ReadLn(texto);
	Eliminar_Simbolos(texto);
	if (Length(texto)>0) then
		LeerNumero:= StrToInt(texto);
end;


(* Procedimiento para cargar los espejos en el tablero *)
procedure Cargar_Espejos_Manual (var tablero: T_matriz; const tapado: boolean);
var
	cantidad, fila, columna: integer;
	direccion: string;
begin
	cantidad:= Contar_Objetos(tablero);
	
	(* Leo las filas y columnas segun lo ve el usuario *)
	while (cantidad < 5) do
		begin
		Imprimir_Tablero_Espejos(tablero, tapado);
		WriteLn('Ingrese ', cantidad + 1,' espejo');
		repeat
			Write('Fila (0-9): ');
			//ReadLn(fila);
			fila:= LeerNumero();
			until (fila >= 0) and (fila <= 9);
		repeat
			Write('Columna (10-19): ');
			//ReadLn(columna);
			columna:= LeerNumero();
			until (columna >= 10) and (columna <= 19);
		Write('Direccion (I=izquierda, D=derecha): ');
		ReadLn(direccion);
	
		(* Transformo el ingreso a posiciones reales dentro de la matriz *)
		fila:= 10 - fila;
		columna:= columna - 9;
		
		(* Guardo el espejo *)
		tablero[fila, columna].estado:= true;
		
		(* Guardo su direccion *)
		if (direccion = 'i') or (direccion = 'I') or (direccion = 'izq') or (direccion = 'Izq') or (direccion = 'izquierda') or (direccion = 'Izquierda') then
			tablero[fila, columna].elemento:= izquierda
		else if (direccion = 'd') or (direccion = 'D') or (direccion = 'der') or (direccion = 'Der') or (direccion = 'derecha') or (direccion = 'Derecha') then
			tablero[fila, columna].elemento:= derecha;
		(* Si no elijo ninguna direccion, por defecto se guarda para la izquierda *)
		
		(* Repito la operacion hasta que el tablero tenga los 5 espejos *)
		cantidad:= Contar_Objetos(tablero);
		end;
end;

(* Procedimiento para cargar las estimas del jugador en el tablero *)
procedure Cargar_Estimas (var tablero: T_matriz);
var
	cantidad, fila, columna: integer;
	direccion: string;
begin
	cantidad:= Contar_Objetos(tablero);
	Imprimir_Tablero_Espejos(tablero, true);
	
	WriteLn('----------------------');
	WriteLn('| Selecciono Estimar |');
	WriteLn('----------------------');
	WriteLn('Ingrese ', cantidad + 1,' estima');
	repeat
		Write('Fila (0-9): ');
		//ReadLn(fila);
		fila:= LeerNumero();
		until (fila >= 0) and (fila <= 9);
	repeat
		Write('Columna (10-19): ');
		//ReadLn(columna);
		columna:= LeerNumero();
		until (columna >= 10) and (columna <= 19);
	Write('Direccion (I=izquierda, D=derecha): ');
	ReadLn(direccion);

	(* Transformo el ingreso a posiciones reales dentro de la matriz *)
	fila:= 10 - fila;
	columna:= columna - 9;
	
	(* Guardo la estima *)
	tablero[fila, columna].estado:= true;
	
	(* Guardo su direccion *)
	if (direccion = 'i') or (direccion = 'I') or (direccion = 'izq') or (direccion = 'Izq') or (direccion = 'izquierda') or (direccion = 'Izquierda') then
		tablero[fila, columna].elemento:= izquierda
	else if (direccion = 'd') or (direccion = 'D') or (direccion = 'der') or (direccion = 'Der') or (direccion = 'derecha') or (direccion = 'Derecha') then
		tablero[fila, columna].elemento:= derecha;
	(* Si no elijo ninguna direccion, por defecto se guarda para la izquierda *)
end;

(* Procedimiento para cargar los espejos en el tablero de manera aleatoria*)
procedure Cargar_Espejos_Aleatorio (var tablero: T_matriz; const tapado: boolean);
var
	cantidad, fila, columna: integer; 
begin
	Randomize(); (* Para que random funcione correctamente y no devuelva siempre lo mismo *)
	
	cantidad:= Contar_Objetos(tablero);
	while (cantidad < 5) do		
		begin
		fila:= Random(999) mod 11;
		if (fila = 0) then
			fila:= fila + 1;
			
		columna:= Random(999) mod 11;
		if (columna = 0 ) then
			columna:= columna + 1;
		
		(* Guardo el espejo *)
		tablero[fila, columna].estado:= true;
		if (((Random(999) + 1) mod 2) = 0) then	(* Elijo direccion aleatoria *)
			tablero[fila, columna].elemento:= izquierda
		else
			tablero[fila, columna].elemento:= derecha;
			
		cantidad:= Contar_Objetos(tablero);	
		end;
end;

(* Procedimiento para realizar los disparos *)
function Realizar_Disparo (const tablero_espejos: T_matriz; const tapado: boolean; const disparos: integer): integer;
var
	tablero_laser: T_matriz;
	fila, columna: integer;
	direccion_aux: T_direccion;
	ingreso, salida: integer;
	ultimo_paso: boolean;
begin
			salida:= 0;
			Inicializar_Tablero(tablero_laser);
			ultimo_paso:= false;
			
			Imprimir_Tablero_Espejos(tablero_espejos, tapado);
			WriteLn('Realizando Disparo!!!');
			WriteLn('Desde que direccion desea realizar el disparo (disparos = ',disparos,'): ');
			repeat
				Write('Ingreso (0-39): ');
				//ReadLn(ingreso);
				ingreso:= LeerNumero();
				until (ingreso >= 0) and (ingreso <= 39);
			
			(* Primero transformo el ingreso a la casilla correspondiente de la matriz *)
			case (ingreso) of
				0..9:	begin
						fila:= 10 - ingreso;
						columna:= 1;
						direccion_aux:= derecha;
						end;
				10..19:	begin
						fila:= 1;
						columna:= ingreso - 9;
						direccion_aux:= abajo;
						end;
				20..29:	begin
						fila:= ingreso - 19;
						columna:= 10;
						direccion_aux:= izquierda;
						end;
				30..39:	begin
						fila:= 10;
						columna:= 40 - ingreso;
						direccion_aux:= arriba;
						end;
				end;
				
			(* Dibujo el recorrido del laser hasta que llegue al ultimo paso *)
			repeat 
				(* Si encuentro un espejo cambio la direccion del laser (teniendo en cuenta la direccion del espejo) *)
				if (tablero_espejos[fila, columna].estado = true) then 
					begin											   
					case tablero_espejos[fila, columna].elemento of
						izquierda:	begin
									case direccion_aux of			
										izquierda:	direccion_aux:= arriba;
										derecha: 	direccion_aux:= abajo;
										arriba: 	direccion_aux:= izquierda;
										abajo: 		direccion_aux:= derecha;

										end;
									end;
						derecha:	begin
									case direccion_aux of
										izquierda: 	direccion_aux:= abajo;
										derecha: 	direccion_aux:= arriba;
										arriba:		direccion_aux:= derecha;
										abajo: 		direccion_aux:= izquierda;
										end;
									end;
						end;
					end;
				
				(* Cargo los datos del recorrido del laser para esa casilla *)
				tablero_laser[fila, columna].estado:= true;
				tablero_laser[fila, columna].elemento:= direccion_aux;
				
				(* Aumento la fila o columna dependiendo la direccion "para dar un paso" *)
				case direccion_aux of
					izquierda:	begin
								if (columna > 1) then
									columna:= columna - 1
								else
									ultimo_paso:= true;
								end;
					derecha:	begin
								if (columna < 10) then
									columna:= columna + 1
								else
									ultimo_paso:= true;
								end;
					arriba:		begin
								if (fila > 1) then
									fila:= fila - 1
								else
									ultimo_paso:= true;
								end;
					abajo:		begin
								if (fila < 10) then
									fila:= fila + 1
								else
									ultimo_paso:= true;
								end;
					end;
				
				(* Controlo si esta en un borde con direccion a ese mismo borde *)
				until (ultimo_paso);
			
			(* Imprimo graficamente el recorrido del laser (siempre que se juegue a caja destapada *)
			if (tapado = false) then
				begin
				Imprimir_Tablero_Laser(tablero_laser);
				WriteLn();
				WriteLn('Continuar...');
				ReadKey();
				end;
				
			Imprimir_Tablero_Espejos(tablero_espejos, tapado);
			
			(* Asigno en salida el valor correspondiente *)
			(* Para los lados sin esquinas *)
			if (fila >= 2) and (fila <= 9) and (columna = 1) then
				salida:= 10 - fila
			else if (fila >= 2) and (fila <= 9) and (columna = 10) then
				salida:= fila + 19
			else if (columna >= 2) and (columna <= 9) and (fila = 1)  then
				salida:= columna + 9
			else if (columna >= 2) and (columna <= 9) and (fila = 10) then
				salida:= 40 - columna;
			
			(* Para las esquinas tengo que tener en cuenta la direccion *)
			if (fila = 1) and (columna = 1) then
				begin
				if (tablero_laser[fila, columna].elemento = izquierda) then
					salida:= 9
				else
					salida:= 10;
				end
			else if (fila = 1) and (columna = 10) then
				begin
				if (tablero_laser[fila, columna].elemento = arriba) then
					salida:= 19
				else
					salida:= 20;
				end
			else if (fila = 10) and (columna = 1) then
				begin
				if (tablero_laser[fila, columna].elemento = abajo) then
					salida:= 39
				else
					salida:= 0;
				end
			else if (fila = 10) and (columna = 10) then
				begin
				if (tablero_laser[fila, columna].elemento = derecha) then
					salida:= 29
				else
					salida:= 30;
				end;

			(* Devuelvo al programa la posicion de salida *)
			Realizar_Disparo:= salida;
			WriteLn('El Disparo ingreso por: ', ingreso, '.');
end;

(* Funcion para controlar las estimas correctas *) 
function Controlar_Estimas(const tablero_espejos, tablero_estimas: T_matriz): integer;
var
	fila, columna, aciertos: integer;
begin
	aciertos:= 0;
	for fila:= 1 to 10 do
		for columna:= 1 to 10 do
			begin
			if (tablero_espejos[fila, columna].estado = true) and (tablero_estimas[fila, columna].estado = true)  then
				if(tablero_espejos[fila, columna].elemento = tablero_estimas[fila, columna].elemento) then
					aciertos:= aciertos + 1;
			end;
	Controlar_estimas:= aciertos;
end;

(* Funcion para controlar las estimas correctas *) 
function Calcular_Puntaje(const tablero_estimas: T_matriz; const disparos, aciertos: integer): integer;
begin
	Calcular_Puntaje:= 0;
	Calcular_Puntaje:= disparos;
	Calcular_Puntaje:= Calcular_Puntaje + (2 * Contar_Objetos(tablero_estimas));
	Calcular_Puntaje:= Calcular_Puntaje - (aciertos);
end;

{Final de procedimientos y funciones particulares del programa}

{Programa Principal}
begin
	(* Primero preparo la ventana del juego *)
    Enmarcar_Pantalla();
    Enmarcar_Titulo(TITULO_PROGRAMA);
    Crear_Ventana();
  
    Centrar_Texto('JUGAR...');
    ReadKey();
		
	repeat
		(* Inicializo Opciones por defecto *)
		disparos:= 20; 				(* Cantidad de disparos para nivel 1 *)
		tipo_caja:= true;	 		(* Tipo de tablero tapado *)
		nivel_dificultad:= true;	(* Dificultad en Nivel 1 *)
		estimas:= 0;				(* Intentos para adivinar *)
		aciertos:= 0;				(* Aciertos en las estimas *)
		puntaje:= 0;				(* Puntaje inicial *)
		rendirse:= false;			
		repetir:= false;
		
		(* Despliego el primer menu *)
		(* Para elegir el tipo de tablero *)
		ClrScr();
		Imprimir_opcion_uno(0);
		opcion_menu:= Menu(1, 2);
		case opcion_menu of
			0:	begin
				tipo_caja:= true;
				WriteLn();
				Centrar_Texto('-----------------------------');
				Centrar_Texto('| Selecciono tablero Tapado |');
				Centrar_Texto('-----------------------------');
				end;
			1:	begin
				tipo_caja:= false;
				WriteLn();
				Centrar_Texto('--------------------------------');
				Centrar_Texto('| Selecciono tablero Destapado |');
				Centrar_Texto('--------------------------------');
				end;
			end;
		ReadKey();

		(* Despliego el segundo menu *)
		(* Para elegir la dificultad *)
		opcion_menu:= Menu(2, 2);
		case opcion_menu of
			0:	begin
				nivel_dificultad:= true;
				WriteLn();
				Centrar_Texto('----------------------');
				Centrar_Texto('| Selecciono Nivel 1 |');
				Centrar_Texto('----------------------');
				end;
			1:	begin
				nivel_dificultad:= false;
				WriteLn();
				Centrar_Texto('----------------------');
				Centrar_Texto('| Selecciono Nivel 2 |');
				Centrar_Texto('----------------------');
				end;
			end;
		ReadKey();

		(* Preparo los tableros *)    
		Inicializar_Tablero(tablero_espejos); 	(* Dejo vacio el tablero *)
		Inicializar_Tablero(tablero_estimas);	(* Dejo vacio el tablero *)
		
		(* Se pueden cargar los espejos de dos maneras *)
		//Cargar_Espejos_Manual(tablero_espejos, tipo_caja);
		Cargar_Espejos_Aleatorio(tablero_espejos, tipo_caja);

		(* Imprimo el tablero para comenzar *)
		Imprimir_Tablero_Espejos(tablero_espejos, tipo_caja);
	
		(* Comienzo el juego *)
		if (nivel_dificultad = true) then
			begin
			disparos:= 20;
			end
		else if (nivel_dificultad = false) then
			begin
			disparos:= 10;
			end;

		repeat
			(* Menu que permite seleccionar el siguiente movimiento *) 
			WriteLn();				//Estos son necesarios para el menu
			WriteLn();				//Estos son necesarios para el menu
			WriteLn();				//Estos son necesarios para el menu
			WriteLn();				//Estos son necesarios para el menu
			WriteLn();				//Estos son necesarios para el menu
			Imprimir_opcion_tres(0);
			opcion_menu:= Menu(3, 4);
			case opcion_menu of
				0:	begin	(* Realizar disparo *)
					salida:= Realizar_Disparo(tablero_espejos, tipo_caja, disparos);
					WriteLn('El Disparo salio por: ', salida, '.');
					disparos:= disparos - 1;
					end;
					
				1:	begin	(*Realizar estima *)
					Cargar_Estimas(tablero_estimas);
					Imprimir_Tablero_Espejos(tablero_espejos, tipo_caja);
					
					if (aciertos = (Controlar_Estimas(tablero_espejos, tablero_estimas) - 1)) then
						WriteLn('Correcto!! Encontraste la pantalla Numero: ', aciertos + 1)
					else
						WriteLn('Fallo... estima incorrecta...');
					
					(* Guardo las estimas y los aciertos de la ronda *)
					estimas:= Contar_Objetos(tablero_estimas);
					aciertos:= Controlar_Estimas(tablero_espejos, tablero_estimas);
					end;
					
				2:	begin	(* Muestra el puntaje actual *)
					ClrScr();
					Imprimir_Tablero_Espejos(tablero_espejos, tipo_caja);
					if (nivel_dificultad) then
						begin
						puntaje:= Calcular_Puntaje(tablero_estimas, 20-disparos, aciertos);
						WriteLn('Cantidad de disparos realizados: ', 20 - disparos, ' (x +1)')
						end
					else
						begin
						puntaje:= Calcular_Puntaje(tablero_estimas, 10-disparos, aciertos);
						WriteLn('Cantidad de disparos realizados: ', 10 - disparos, ' (x +1)');
						end;
					WriteLn('Cantidad de estimas realizados: ', estimas, ' (x +2)');
					WriteLn('Cantidad de estimas acertadas: ', aciertos, ' (x -1)');
					WriteLn('Puntaje total: ', puntaje);
					WriteLn('Continuar...');
					ReadKey();
					ClrScr();
					end;
					
				3:	begin	(* Se rinde *)
					ClrScr();
					Centrar_Texto('Suerte la proxima...');
					ReadKey();
					rendirse:= true;
					end;
				end;
			(* Se termina la ronda cuando me quedo sin disparos, estime 5 veces o me rendi *)
			until (disparos = 0) or (estimas = 5) or (rendirse);

		(* Termino de completar las estimas si me quede sin disparos *)
		ClrScr();
		if (rendirse = false) then
			begin
			if (disparos = 0) then (* Finalizo la ronda por falta de disparos *)
				begin
				WriteLn('Sin disparos!!');
				WriteLn('Complete las estimas faltantes...');
				ReadKey();
				while (estimas <=4) do
					begin
					Cargar_Estimas(tablero_estimas);
					estimas:=Contar_Objetos(tablero_estimas);
					end;
				end
			else	(* Finalizo la ronda por falta de estimas *)
				WriteLn('Sin estimas!!');
			end;
		
		(* Imprimo en pantalla los datos de la partida *)
		ClrScr();
		if (nivel_dificultad) then
			begin
			puntaje:= Calcular_Puntaje(tablero_estimas, 20-disparos, aciertos);
			WriteLn('Cantidad de disparos realizados: ', 20 - disparos, ' (+1)')
			end
		else
			begin
			puntaje:= Calcular_Puntaje(tablero_estimas, 10-disparos, aciertos);
			WriteLn('Cantidad de disparos realizados: ', 10 - disparos, ' (+1)');
			end;
		WriteLn('Cantidad de estimas realizados: ', estimas, ' (+2)');
		WriteLn('Cantidad de estimas acertadas: ', aciertos, ' (-1)');
		WriteLn('Puntaje total: ', puntaje);
		
		(* Imprimo en pantalla los tableros uno al lado del otro para comparar *)
		Comparar_Resultado(tablero_espejos, tablero_estimas);
		WriteLn();
		WriteLn('Continuar...');
		ReadKey();


		(* Menu para salir o reiniciar *)
		ClrScr();
		WriteLn();				//Estos son necesarios para el menu
		WriteLn();				//Estos son necesarios para el menu
		WriteLn();				//Estos son necesarios para el menu
		Imprimir_opcion_cuatro(0);//Imprimo el primer menu del juego
		opcion_menu:= Menu(4, 2);
			case opcion_menu of
				0:	repetir:= true;
				1:	repetir:= false;
				end;
		until not(repetir);
	
    (* Elimino la ventana del juego para limpiar la terminal *)
    ClrScr();
    WriteLn('Fin del juego');
    WriteLn('Dews!');
    ReadKey();
    Eliminar_Ventana();
end.
