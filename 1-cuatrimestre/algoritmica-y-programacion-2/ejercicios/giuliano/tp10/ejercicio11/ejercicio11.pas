{
    11) Realice un procedimiento que permita invertir los elementos de una Cola, para: 
        a) Cola No circular 
        b) Cola circular.
}
program ejericio11;
uses crt, UColaListaEnteros, UColaCircularListaEnteros, UPilaListaEnteros;

procedure cargarColaNumeros(var cola: UColaListaEnteros.TCola);
var
    numero: UColaListaEnteros.TElemento;
    seguirCargando: char;
begin
    seguirCargando := 's';
    UColaListaEnteros.crear(cola);
    while (seguirCargando = 's') do 
    begin
        writeln('Ingrese un numero: ');
        readln(numero);
        UColaListaEnteros.meter(cola,numero);
        writeln('Quiere seguir cargando? s/n');
        readln(seguirCargando);
    end;
end;

procedure cargarColaCircularNumeros(var cola: TCola);
var
    numero: UColaCircularListaEnteros.TElemento;
    seguirCargando: char;
begin
    seguirCargando := 's';
    UColaCircularListaEnteros.crear(cola);
    while (seguirCargando = 's') do 
    begin
        writeln('Ingrese un numero: ');
        readln(numero);
        UColaCircularListaEnteros.meter(cola,numero);
        writeln('Quiere seguir cargando? s/n');
        readln(seguirCargando);
    end;
end;

procedure invertirCola(var cola: UColaListaEnteros.TCola);
var
    pilaInversora: TPila;
    elemento: UColaListaEnteros.TElemento;
begin
    UPilaListaEnteros.crear(pilaInversora);
    while (not (UColaListaEnteros.vacia(cola))) do
    begin
        UColaListaEnteros.sacar(cola,elemento);
        UPilaListaEnteros.meter(pilaInversora,elemento);
    end;
    while (not (UPilaListaEnteros.vacia(pilaInversora))) do 
    begin
        UPilaListaEnteros.sacar(pilaInversora,elemento);
        UColaListaEnteros.meter(cola,elemento);
    end;
end;

procedure invertirColaCircular(var cola: UColaCircularListaEnteros.TCola);
var
    pilaInversora: TPila;
    elemento: UColaCircularListaEnteros.TElemento;
begin
    UPilaListaEnteros.crear(pilaInversora);
    while (not (UColaCircularListaEnteros.vacia(cola))) do
    begin
        UColaCircularListaEnteros.sacar(cola,elemento);
        UPilaListaEnteros.meter(pilaInversora,elemento);
    end;
    while (not (UPilaListaEnteros.vacia(pilaInversora))) do 
    begin
        UPilaListaEnteros.sacar(pilaInversora,elemento);
        UColaCircularListaEnteros.meter(cola,elemento);
    end;
end;

var
    colaNumeros: UColaListaEnteros.TCola;
    colaCircularNumeros: UColaCircularListaEnteros.TCola;
begin
    cargarColaNumeros(colaNumeros);
    cargarColaCircularNumeros(colaCircularNumeros);
    invertirCola(colaNumeros);
    invertirColaCircular(colaCircularNumeros);
end.