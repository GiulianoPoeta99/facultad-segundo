{
    2.- Usando las operaciones básicas de pilas y colas, escribir un algoritmo que invierta los
    elementos de una cola .
}
program ejercicio2;
uses crt,UcolaEnteros,UpilaEnteros;

procedure cargarElementosCola(var sucesion: Tcola);
var
    i,elemento: integer;
begin
    i := 1;
    writeln('Ingrese elementos de la cola (-1 para finalizar): ');
    while (elemento <> -1) do begin
        writeln('Ingrese elemento nro: ', i);
        readln(elemento);
        if (elemento <> -1) then begin
            UcolaEnteros.meter(sucesion, elemento);
            inc(i);
            clrscr;
        end;
    end;
end;

procedure cargarPila(cola: Tcola; var pila: Tpila);
var
    estaVacia: boolean;
    elemento: integer;
begin
    estaVacia := UcolaEnteros.vacia(cola);
    while (not estaVacia) do begin
        UcolaEnteros.sacar(cola,elemento);
        UpilaEnteros.meter(pila,elemento);
        estaVacia := UcolaEnteros.vacia(cola);
    end;
end;

procedure cargarColaPila(var cola: Tcola; pila: Tpila);
var 
    estaVacia: boolean;
    elemento: integer;
begin
    estaVacia := UpilaEnteros.vacia(pila);
    while (not estaVacia) do begin
        UpilaEnteros.sacar(pila,elemento);
        UcolaEnteros.meter(cola,elemento);
        estaVacia := UpilaEnteros.vacia(pila);
    end;
end;

procedure imprimirCola(cola: Tcola);
var 
    estaVacia: boolean;
    elemento: integer;
begin
    estaVacia := UcolaEnteros.vacia(cola);
    while (not estaVacia) do begin
        UcolaEnteros.sacar(cola,elemento);
        write(elemento,', ');
        estaVacia := UcolaEnteros.vacia(cola);
    end;
end;

var
    cola,colaInvertida: Tcola;
    pila: Tpila;
begin
    UcolaEnteros.crear(cola);
    UcolaEnteros.crear(colaInvertida);
    UpilaEnteros.crear(pila);

    cargarElementosCola(cola);
    cargarPila(cola,pila);
    cargarColaPila(colaInvertida,pila);
    writeln('La cola invertida es: ');
    imprimirCola(colaInvertida);
end.