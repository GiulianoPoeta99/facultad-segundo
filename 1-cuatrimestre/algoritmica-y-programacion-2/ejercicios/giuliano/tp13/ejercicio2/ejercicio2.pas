{
    El campo de información de los nodos de un árbol binario contiene palabras de tres letras. 
    Mostrar  cómo  quedaría  el  árbol  después  de  leer  las  siguientes  palabras  (en  ese  orden). 
    Suponer el árbol vacío antes de iniciar la carga. 

    FIA    DOY    LEY    HAY    EGO    ELE    BIO    BUS    ZOO
}
program ejercicio2;
uses crt,UArbolString,UColaListaArbolString;

procedure cargarArbol(var arbol: TArbol);
var
    elemento: TElemento;
    i: integer;
begin
    writeln('Ingresa la siguiente secuencia: FIA, DOY, LEY, HAY, EGO, ELE, BIO, BUS y ZOO');
    for i:=1 to 9 do
    begin
        readln(elemento);
        meterArbol(arbol,elemento);
    end; 
end;

var
    arbol: TArbol;
begin
    crearArbol(arbol);
    cargarArbol(arbol);
    writeln('================================================================');
    listarEnOrden(arbol);
end.