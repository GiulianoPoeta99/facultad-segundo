{
    Una persona ha decidido realizar un viaje desde Ushuaia hasta la Quiaca con la particularidad que el mismo
    no ha sido planeado sino que irá decidiendo luego de cada localidad que transite cuál será la próxima.
    Durante el recorrido irá guardando el nombre de cada lugar, la distancia recorrida (entre lugares) y si tenía o
    no la posibilidad de cargar combustible cerca de la ruta.
    Una vez llegado a su destino final tendrá que elaborar la ruta de retorno y esto lo determinará a partir de las
    localidades transitadas pero en el sentido inverso y además filtrando aquellos lugares que no tengan una
    estación de servicio cerca de la ruta.
    Se pide un programa que simule lo descripto permitiendo:
        a) la carga de las localidades con los datos de interés.
        b) Un listado de todos los lugares y el total de kilómetros que recorrió desde Ushuaia hasta la Quiaca.
        c) Un listado de los lugares por donde debe retornar hasta Ushuaia.
    
    Un ejemplo desde Ushuaia a Caleta sería:
    Parte desde Ushuaia → [rio grande – 200 - no tiene] → [rio gallegos - 350 - si tiene] →
    [piedra buena - 250 - no tiene] → [san julián - 100 - si tiene ] →[fitz roy – 250 – no tiene] →
    Caleta Olivia.
    Recorrió 1150 kilómetros.
    Luego deberá retornar desde Caleta→ San Julián → Río Gallegos → Ushuaia.
    
    NOTA: Suponga que cuenta con el espacio suficiente para almacenar todas las localidades.
}
program ejercicio2;
uses crt,UpilaViaje,UcolaViaje;

procedure empezarViaje(var pila:Tpila; var cola:Tcola; var distTotal:integer);
var
    elementoPila: UpilaViaje.TElemento;
    elementoCola: UcolaViaje.TElemento;
    sino: char;
begin
    distTotal := 0;

    writeln('Empezo el viaje, la primer para obligatoria es Ushuaia.');
    elementoPila.nombre := 'Ushuaia';
    elementoPila.distancia := 0;
    elementoPila.combustible := True;

    elementoCola.nombre := elementoPila.nombre;
    elementoCola.distancia := elementoPila.distancia;
    elementoCola.combustible := elementoPila.combustible;

    UpilaViaje.meter(pila,elementoPila);
    UcolaViaje.meter(cola,elementoCola);

    while (elementoPila.nombre <> 'Quiaca') do begin
        writeln(elementoPila.nombre);
        writeln('Ingrese el nombre de la siguiente parada: ');
        readln(elementoPila.nombre);
        writeln('Ingrese la distancia a la siguiente parada: ');
        readln(elementoPila.distancia);
        distTotal := distTotal + elementoPila.distancia;
        writeln('Hay combustible en la parada? (s: Si; n: No)');
        readln(sino);
        if (sino = 's') then begin
            elementoPila.combustible := True;
        end else begin
            elementoPila.combustible := False;
        end;
        UpilaViaje.meter(pila,elementoPila);

        elementoCola.nombre := elementoPila.nombre;
        elementoCola.distancia := elementoPila.distancia;
        elementoCola.combustible := elementoPila.combustible;

        UcolaViaje.meter(cola,elementoCola);
    end;
end;

procedure mostrarRecorridoIda(cola:Tcola);
var
    i: integer;
    elemento: UcolaViaje.TElemento;
begin
    i := 0;
    while (not UcolaViaje.vacia(cola)) do begin
        UcolaViaje.sacar(cola,elemento);
        write('* La parada nro ',i,' fue en ',elemento.nombre,' se recorrieron ',elemento.distancia,'KM ');
        if (elemento.combustible) then 
            writeln('y se cargo combustible')
        else
            writeln('y no se cargo combustible');
        inc(i);
    end;
end;

procedure mostrarRecorridoVuelta(pila:Tpila);
var
    i: integer;
    elemento: UpilaViaje.TElemento;
begin
    i := 0;
    while (not UpilaViaje.vacia(pila)) do begin
        UpilaViaje.sacar(pila,elemento);
        write('* La parada nro ',i,' fue en ',elemento.nombre,' se recorrieron ',elemento.distancia,'KM ');
        if (elemento.combustible) then 
            writeln('y se cargo combustible')
        else
            writeln('y no se cargo combustible');
        inc(i);
    end;
end;

procedure finalizarViaje(pila:Tpila; cola:Tcola; distTotal:integer);
begin
    writeln('El recorrido de ida fue: ');
    mostrarRecorridoIda(cola);
    writeln;
    writeln('se Recorrio un total de ',distTotal,'KM');
    writeln;
    writeln('El recorrido de vuelta fue: ');
    mostrarRecorridoVuelta(pila);
end;

var
    pilaParadas: Tpila;
    colaParadas: Tcola;
    distanciaRecorrida: integer;
begin
    UpilaViaje.crear(pilaParadas);
    UcolaViaje.crear(colaParadas);
    empezarViaje(pilaParadas,colaParadas,distanciaRecorrida);
    finalizarViaje(pilaParadas,colaParadas,distanciaRecorrida);
end.