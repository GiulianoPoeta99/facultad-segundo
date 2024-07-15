{author: Giuliano Igacio Poeta}

//NOTA: me falto hacer la parte de dibuar el tablero, pero me uede sin tiempo
program tpIntegrador;
uses crt;
const
    N = 10;

type 
    Tesquina = record
        case esEsquina: boolean of 
            True: (
                aliasX, aliasY: integer;
                direccionX, direccionY: char
            );
            False: (
                alias: integer;
                direccion: char;
            );
    end;
    Tespejo = record
        case tieneEspejo: boolean of
            True: (
                direccionEspejo: char;
                encontrado: boolean
            );
    end;
    Tpunto = record
        esquina: Tesquina;
        espejo: Tespejo;
    end;

    Ttablero = array[1..N,1..N] of Tpunto;

    Tlaser = record
        posActualX,posActualY: integer;
        dirInicial,dirActual: char;
    end;

function encontrarAlias(var laser: Tlaser; table: Ttablero):integer;
var
    ultAlias: integer;
begin
    if (laser.posActualX = 11) then begin
        laser.posActualX := 10;
    end else if (laser.posActualX = 0) then begin
        laser.posActualX := 1;
    end else if (laser.posActualY = 11) then begin
        laser.posActualY := 10;
    end else if (laser.posActualY = 0) then begin
        laser.posActualY := 1;
    end;

    if (laser.dirActual = 'n') then begin
        if (table[laser.posActualY][laser.posActualX].esquina.esEsquina = True) then begin
            ultAlias := table[laser.posActualY][laser.posActualX].esquina.aliasY
        end else begin
            ultAlias := table[laser.posActualY][laser.posActualX].esquina.alias
        end;
    end else if (laser.dirActual = 's') then begin
        if (table[laser.posActualY][laser.posActualX].esquina.esEsquina = True) then begin
            ultAlias := table[laser.posActualY][laser.posActualX].esquina.aliasY
        end else begin
            ultAlias := table[laser.posActualY][laser.posActualX].esquina.alias
        end;
    end else if (laser.dirActual = 'e') then begin
        if (table[laser.posActualY][laser.posActualX].esquina.esEsquina = True) then begin
            ultAlias := table[laser.posActualY][laser.posActualX].esquina.aliasX
        end else begin
            ultAlias := table[laser.posActualY][laser.posActualX].esquina.alias
        end;
    end else if (laser.dirActual = 'o') then begin
        if (table[laser.posActualY][laser.posActualX].esquina.esEsquina = True) then begin
            ultAlias := table[laser.posActualY][laser.posActualX].esquina.aliasX
        end else begin
            ultAlias := table[laser.posActualY][laser.posActualX].esquina.alias
        end;
    end else begin
        writeln('entro else: ERROR');
    end;
    encontrarAlias:=ultAlias;
end;

procedure iniciarEsquina(var puntoTablero: Tpunto; aliasX,aliasY: integer; dirX,dirY: char);
begin
    puntoTablero.esquina.esEsquina := True;
    puntoTablero.esquina.aliasX := aliasX;
    puntoTablero.esquina.aliasY := aliasY;
    puntoTablero.esquina.direccionX := dirX;
    puntoTablero.esquina.direccionY := dirY;
    puntoTablero.espejo.tieneEspejo := False;
end;

procedure iniciarPunto(var puntoTablero: Tpunto; alias: integer; dir: char);
begin
    puntoTablero.esquina.esEsquina := False;
    puntoTablero.esquina.alias := alias;
    puntoTablero.esquina.direccion := dir;
    puntoTablero.espejo.tieneEspejo := False;
end;

procedure inicializarTablero(var table:Ttablero);
var
    y,x:integer;
begin
    for y:=1 to N do begin
        for x:=1 to N do begin
            //inicio primero las esquinas en un procedimiento aparte
            if ((y = 1) and (x = 1)) then
                iniciarEsquina(table[y][x], 9, 10, 'o', 's')
            else if ((y = 1) and (x = 10)) then
                iniciarEsquina(table[y][x], 20, 19, 'e', 's')
            else if ((y = 10) and (x = 1)) then
                iniciarEsquina(table[y][x], 0, 39, 'o', 'n')
            else if ((y = 10) and (x = 10)) then
                iniciarEsquina(table[y][x], 29, 30, 'e', 'n')
            else begin //aca voy a iniciar las aristas y los puntos centrales
                if (y = 1) then begin
                    if (x = 2) then begin
                        iniciarPunto(table[y][x],(table[y][x-1].esquina.aliasY + 1),'s')
                    end
                    else if (x <> 10) then begin
                        iniciarPunto(table[y][x],(table[y][x-1].esquina.alias + 1),'s')
                    end;
                end
                else if (y = 10) then begin
                    if (x = 2) then begin
                        iniciarPunto(table[y][x],(table[y][x-1].esquina.aliasY - 1),'n')
                    end
                    else if (x <> 10) then begin
                        iniciarPunto(table[y][x],(table[y][x-1].esquina.alias - 1),'n')
                    end;
                end
                else begin
                    if (x = 1) then begin
                        if (y = 2) then begin
                            iniciarPunto(table[y][x],(table[y-1][x].esquina.aliasX - 1),'o')
                        end
                        else begin
                            iniciarPunto(table[y][x],(table[y-1][x].esquina.alias - 1),'o')
                        end;
                    end
                    else if (x = 10) then begin
                        if (y = 2) then
                        begin
                            iniciarPunto(table[y][x],(table[y-1][x].esquina.aliasX + 1),'e')
                        end
                        else begin
                            iniciarPunto(table[y][x],(table[y-1][x].esquina.alias + 1),'e')
                        end;
                    end
                    else begin
                        iniciarPunto(table[y][x],-1,' ') //es un alias que no se puede pedir, representa el null
                    end;
                end;
            end;
        end;
    end;
end;

procedure iniciarEspejosEjercicio (var table: Ttablero);
var
    x,y:integer;
begin
    //primer espejo 10,1
    x:=10;
    y:=1;
    table[y][x].espejo.tieneEspejo := True;
    table[y][x].espejo.direccionEspejo := 'd';
    table[y][x].espejo.encontrado := False;
    //segundo espejo 3,5
    x:=3;
    y:=5;
    table[y][x].espejo.tieneEspejo := True;
    table[y][x].espejo.direccionEspejo := 'i';
    table[y][x].espejo.encontrado := False;
    //tercer espejo 1,7
    x:=1;
    y:=7;
    table[y][x].espejo.tieneEspejo := True;
    table[y][x].espejo.direccionEspejo := 'd';
    table[y][x].espejo.encontrado := False;
    //cuarto espejo 3,9
    x:=3;
    y:=9;
    table[y][x].espejo.tieneEspejo := True;
    table[y][x].espejo.direccionEspejo := 'i';
    table[y][x].espejo.encontrado := False;
    //quinto espejo 8,9
    x:=8;
    y:=9;
    table[y][x].espejo.tieneEspejo := True;
    table[y][x].espejo.direccionEspejo := 'd';
end;

procedure iniciarEspejosRandom (var table: Ttablero);
var
    x,y,i: integer;
    direccion: char;
begin
    for i:=1 to 5 do begin
        y := Random(10)+1;
        x := Random(10)+1;
        if (Random(2) = 0) then begin
            direccion := 'd'
        end else begin
            direccion := 'i';
        end;

        table[y][x].espejo.tieneEspejo := True;
        table[y][x].espejo.direccionEspejo := direccion;
        table[y][x].espejo.encontrado := False;
    end;
    writeln('Los 5 espejos fueron generados...')
end;

procedure iniciarLaser(var laser: Tlaser; posicion: integer; table: Ttablero);
var
    y,x: integer;
begin
    for y:=1 to N do begin
        for x:=1 to N do begin
            if (table[y][x].esquina.esEsquina = True) then begin
                if (table[y][x].esquina.aliasX = posicion) then begin
                    laser.posActualX := x;
                    laser.posActualY := y;
                    laser.dirInicial := table[y][x].esquina.direccionX;
                    laser.dirActual := table[y][x].esquina.direccionX
                end else if (table[y][x].esquina.aliasY = posicion) then begin
                    laser.posActualX := x;
                    laser.posActualY := y;
                    laser.dirInicial := table[y][x].esquina.direccionY;
                    laser.dirActual := table[y][x].esquina.direccionY
                end;
            end else begin
                if (table[y][x].esquina.alias = posicion) then begin
                    laser.posActualX := x;
                    laser.posActualY := y;
                    laser.dirInicial := table[y][x].esquina.direccion;
                    laser.dirActual := table[y][x].esquina.direccion
                end;
            end;
        end;
    end;
end;

procedure cambiarDireccion (var laser: Tlaser; dirEspejo: char);
begin
    if (laser.dirActual = 'n') then begin
        if (dirEspejo = 'd') then begin
            laser.dirActual := 'e';
            dec(laser.posActualX)
        end else if (dirEspejo = 'i') then begin
            laser.dirActual := 'o';
            inc(laser.posActualX)
        end;
    end else if (laser.dirActual = 's') then begin
        if (dirEspejo = 'd') then begin
            laser.dirActual := 'e';
            dec(laser.posActualX)
        end else if (dirEspejo = 'i') then begin
            laser.dirActual := 'o';
            inc(laser.posActualX)
        end;
    end else if (laser.dirActual = 'e') then begin
        if (dirEspejo = 'd') then begin
            laser.dirActual := 's';
            inc(laser.posActualY)
        end else if (dirEspejo = 'i') then begin
            laser.dirActual := 'n';
            dec(laser.posActualY)
        end;
    end else if (laser.dirActual = 'o') then begin
        if (dirEspejo = 'd') then begin
            laser.dirActual := 'n';
            dec(laser.posActualY)
        end else if (dirEspejo = 'i') then begin
            laser.dirActual := 's';
            inc(laser.posActualY)
        end;
    end;
end;

procedure moverLaser(var laser:Tlaser; table: Ttablero);
var
    salioLaser: boolean;
    continuar,trazar: char;
    ultAlias: integer;
    posEspejo,direccionComp: string;
begin
    salioLaser := False;
    writeln('¿Quiere ver el recorrido del laser?');
    writeln('  * s: Si.');
    writeln('  * n: No.');
    writeln('  * v: Si y quiero ver los rebotes.');
    readln(trazar);
    clrscr;
    while ((trazar <> 's') and (trazar <> 'n') and (trazar <> 'v')) do begin
        writeln('Elija una opcion correcta...');
        writeln('  * s: Si.');
        writeln('  * n: No.');
        writeln('  * v: Si y quiero ver los rebotes.');
        readln(trazar);
        clrscr;
    end;
    while (salioLaser = False) do begin
        if ((trazar = 's') or (trazar = 'v')) then begin
            writeln('Presione 2 veces "enter" para continuar...');
            readln(continuar);
            clrscr;
        end;
        if (
            (laser.posActualX = 11) or
            (laser.posActualX = 0) or
            (laser.posActualY = 11) or
            (laser.posActualY = 0) 
        ) then begin
            ultAlias := encontrarAlias(laser,table);
            writeln('El laser salio por el borde con alias: ',ultAlias);
            writeln;
            salioLaser := True
        end else begin
            if (laser.dirActual = 'n') then begin
                direccionComp := 'NORTE'
            end else if (laser.dirActual = 's') then begin
                direccionComp := 'SUR'
            end else if (laser.dirActual = 'e') then begin
                direccionComp := 'ESTE'
            end else if (laser.dirActual = 'o') then begin
                direccionComp := 'OESTE'
            end;
            if ((trazar = 's') or (trazar = 'v')) then begin
                writeln('El laser esta en la pos [',laser.posActualX,',',laser.posActualY,'] y con direccion ',direccionComp);
            end;
            if (table[laser.posActualY][laser.posActualX].espejo.tieneEspejo = True) then begin
                if (table[laser.posActualY][laser.posActualX].espejo.direccionEspejo = 'i') then begin
                    posEspejo := '\';
                end else begin
                    posEspejo := '/';
                end;

                if (trazar = 'v') then begin
                    writeln('Encontro un espejo con direccion: ',posEspejo);
                end;

                cambiarDireccion(laser,table[laser.posActualY][laser.posActualX].espejo.direccionEspejo)
            end else begin
                if (laser.dirActual = 'n') then begin
                    dec(laser.posActualY);
                end else if (laser.dirActual = 's') then begin
                    inc(laser.posActualY)
                end else if (laser.dirActual = 'e') then begin
                    dec(laser.posActualX)
                end else if (laser.dirActual = 'o') then begin
                    inc(laser.posActualX)
                end else begin
                    writeln('entro else: ERROR');
                end;
            end;
        end;
    end;
end;

procedure estimarEspejo (var table: Ttablero; var puntaje,espejosEncontrados: integer);
var 
    seleccionX,seleccionY,coordX,coordY,x,y: integer;
begin
    writeln('Seleccione la posicion del espejo en el eje Y (0 a 9): ');
    readln(seleccionY);
    clrscr;
    while ((seleccionY <= 0) or (seleccionY >= 11)) do begin
        writeln('Elija una opcion correcta entre 0 y 9:');
        readln(seleccionY);
        clrscr;
    end;

    writeln('Seleccione la posicion del espejo en el eje X (10 a 19): ');
    readln(seleccionX);
    clrscr;
    while ((seleccionX <= 9) or (seleccionX >= 20)) do begin
        writeln('Elija una opcion correcta entre 10 y 19:');
        readln(seleccionX);
        clrscr;
    end;
    writeln('Usted selecciono la ubicacion: [',seleccionX,',',seleccionY,']');

    for y:=1 to N do begin
        for x:=1 to N do begin
            if (table[y][x].esquina.esEsquina = True) then begin
                if (seleccionX = table[y][x].esquina.aliasX) then begin
                    coordX := x;
                end else if (seleccionY = table[y][x].esquina.aliasX) then begin
                    coordY := y;
                end;
                if (seleccionX = table[y][x].esquina.aliasY) then begin
                    coordX := x;
                end else if (seleccionY = table[y][x].esquina.aliasY) then begin
                    coordY := y;
                end;
            end else begin
                if (seleccionX = table[y][x].esquina.alias) then begin
                    coordX := x;
                end;
                if (seleccionY = table[y][x].esquina.alias) then begin
                    coordY := y;
                end
            end;
        end;
    end;
    writeln('Las coordenadas traducidas son: [',coordX,',',coordY,']');
    writeln;
    if (table[coordY][coordX].espejo.tieneEspejo = True) then begin
        writeln('Encontro un espejo');
        if (table[coordY][coordX].espejo.encontrado = True) then begin
            writeln('Ya encontro este espejo.')
        end else begin 
            table[coordY][coordX].espejo.encontrado := True;
            inc(espejosEncontrados)
        end;
    end else begin
        writeln('Fallo +2 puntos.');
        puntaje := puntaje + 2
    end;
end;

procedure mostrarEstadisticas(puntaje,tiros,espejos,nivel: integer; rendirse: boolean; table: Ttablero);
begin
    writeln;
    writeln('Estadisticas de la partida:');
    writeln('  * Nivel: ',nivel);
    writeln('  * Puntaje Total: ',puntaje,'.');
    writeln('  * Cantidad de tiros realizados: ',tiros,'.');
    if (rendirse = True) then begin
        writeln('  * Se rindio: Si.')
    end else begin
        writeln('  * Se rindio: No.')
    end;

    writeln('  * Cantidad de espejos encontrados: ',espejos,'.');
    if (rendirse = True) then begin
        writeln;
        writeln('PERDISTE: sacaste la bandera blanca.');
    end else begin
        if (espejos = 5) then begin
            writeln;
            writeln('GANASTE: encontraste todos los espejos.')
        end else begin
            writeln('PERDISTE: no lograste encontrar todos los espejos.')
        end;
    end;
    writeln;
    writeln('Gracias por jugar...');
    writeln('¡GG!');
end;

var
    tablero: Ttablero;
    laser: Tlaser;
    nivel,tiros,contTiros,posLaser,distriLaser,opciones,puntajeTotal,espejosEncontrados: integer;
    rendirse: boolean;
begin
    Randomize;
    inicializarTablero(tablero);
    nivel := 0;
    opciones := 0;
    posLaser := -1;
    distriLaser := -1;
    rendirse := False;
    puntajeTotal := 0;
    espejosEncontrados := 0;

    writeln('Hola bienvenido a este TP.');
    writeln('El objetivo del mismo es encontrar 5 espejos en un tablero disparando lasers desde los laterales y luego estimar donde estan los espejos.');
    writeln('Empecemos...');
    writeln;
    writeln('¿Que distribucion de espejos quiere usar? ');
    writeln('  * Tipo 1: Ejemplo del TP.');
    writeln('  * Tipo 2: Agregar aleatoriamente.');
    readln(distriLaser);
    clrscr;
    while ((distriLaser <> 1) and (distriLaser <> 2) and (distriLaser <> 3)) do begin
        writeln('Elija una opcion correcta...');
        writeln('  * Tipo 1: Ejemplo del TP.');
        writeln('  * Tipo 2: Agregar aleatoriamente.');
        readln(distriLaser);
        clrscr;
    end;
    if (distriLaser = 1) then begin 
        iniciarEspejosEjercicio(tablero);
    end else begin
        iniciarEspejosRandom(tablero);
    end;
    writeln;
    writeln('Ingrese nivel a jugar:');
    writeln('  * Nivel 1: 20 tiros.');
    writeln('  * Nivel 2: 10 tiros.');
    readln(nivel);
    clrscr;
    while ((nivel <> 1) and (nivel <> 2)) do begin
        writeln('Elija una opcion correcta...');
        writeln('  * Nivel 1: 20 tiros.');
        writeln('  * Nivel 2: 10 tiros.');
        readln(nivel);
        clrscr;
    end;
    if (nivel = 1) then begin 
        tiros := 20
    end else begin
        tiros := 10
    end;

    contTiros:=0;
    while ((contTiros <= tiros) and (rendirse <> True) and (espejosEncontrados <> 5)) do begin
        writeln('¿Que quiere hacer?');
        writeln('  * 1: Disparar laser.');
        writeln('  * 2: Estimas posicion espejo.');
        writeln('  * 3: Ver puntaje.');
        writeln('  * 4: Rendirse.');
        readln(opciones);
        clrscr;
        while ((opciones <> 1) and (opciones <> 2) and (opciones <> 3) and (opciones <> 4)) do begin
            writeln('Elija una opcion correcta...');
            writeln('  * 1: Disparar laser.');
            writeln('  * 2: Estimas posicion espejo.');
            writeln('  * 3: Ver puntaje y espejos encontrados.');
            writeln('  * 4: Rendirse.');
            readln(opciones);
            clrscr;
        end;

        if (opciones = 1) then begin
            writeln('Ingrese la posicion de donde saldra el laser nro ',contTiros,' (0 a 39): ');
            readln(posLaser);
            while ((posLaser >= 40) or( posLaser < 0)) do begin
                writeln('Ingrese una posicion valida de donde saldra el laser nro ',contTiros,' (0 a 39): ');
                readln(posLaser);
            end;
            iniciarLaser(laser,posLaser,tablero);
            clrscr;
            moverLaser(laser,tablero);
            inc(puntajeTotal);
            inc(contTiros);
        end else if (opciones = 2) then begin
            estimarEspejo(tablero,puntajeTotal,espejosEncontrados)
        end else if (opciones = 3) then begin
            writeln('Su puntaje actual es de: ',puntajeTotal);
            writeln('Encontro un total de ',espejosEncontrados,' espejos')
        end else if (opciones = 4) then begin
            rendirse:=True;
        end;
    end; 
    mostrarEstadisticas(puntajeTotal,contTiros,espejosEncontrados,nivel,rendirse,tablero)
end.