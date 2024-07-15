{
    3.- Una sección de un ministerio distribuye números para la atención del público, con un
    máximo de 50 números y luego comienza a atender. Suponga que todas las personas que retiran
    número se quedan en la cola hasta que los atienden.
    Para cada persona se conoce la siguiente información:
        * nombre y apellido
        * tiempo requerido para su atención (generado de manera aleatoria).
    Sabiendo que se atiende 90 minutos, simular el proceso de atención, hasta que la suma de los
    tiempos de atención supere los 90 minutos disponibles. Informar:
        a) el número de personas atendidas
        b) la cantidad de personas que quedaron sin atender
        c) el nombre de la última persona atendida y el de la primera sin atender (si existe)
}
program ejercicio3;
uses crt,UcolaAtencionPublico;

const
    LARGO = 5;
    NOVENTA_MIN = 90;

procedure cargarCola(var cola: Tcola);
var
    i:integer;
    elemento: TElemento;
begin
    i := 1;
    while (i <= LARGO) do begin
        writeln('Ingrese datos cliente en cola nro: ',i);
        writeln('  * Nombre: ');
        writeln('  * Apellido: ');
        readln(elemento.nombre);
        readln(elemento.apellido);
        elemento.tiempo := random(15); // 15 minutos

        meter(cola,elemento);
        inc(i);
    end;
end;

procedure atenderClientes(cola: Tcola);
var 
    elemento,ultimoAtendido,primeroSinAtender: TElemento;
    tiempoCierre: LongInt;
    cantidadAtendidos,cantidadNoAtendidos: integer;
    estaVacia: boolean;
begin
    tiempoCierre := 0;
    cantidadAtendidos := 0;
    cantidadNoAtendidos := LARGO;
    estaVacia := vacia(cola);
    while ((not estaVacia) and (tiempoCierre < NOVENTA_MIN)) do begin
        sacar(cola,elemento);
        writeln('Siguiente atendido: ',elemento.nombre,' ',elemento.apellido);
        tiempoCierre := tiempoCierre + elemento.tiempo;
        inc(cantidadAtendidos);
        dec(cantidadNoAtendidos);
        estaVacia := vacia(cola);
        ultimoAtendido := elemento;
    end; 

    if (tiempoCierre >= NOVENTA_MIN) then begin
        writeln('Se alcanzo el limite de tiempo.');
    end else begin
        writeln('Se atendieron a todos los usuarios.');
    end;

    writeln('Estadisticas: ');
    writeln('  * Tiempo usado: ',tiempoCierre);
    writeln('  * Personas atendidas: ',cantidadAtendidos);
    writeln('  * Personas sin atender: ',cantidadNoAtendidos);
    writeln('  * Ultimo atendido: ',ultimoAtendido.nombre,' ',ultimoAtendido.apellido);

    if (not estaVacia) then begin
        sacar(cola,primeroSinAtender);
        writeln('  * Primero sin atender: ', primeroSinAtender.nombre,' ',primeroSinAtender.apellido);
    end;

end;

var
    cola: Tcola;
begin
    Randomize;
    crear(cola);
    cargarCola(cola);
    atenderClientes(cola);
end.