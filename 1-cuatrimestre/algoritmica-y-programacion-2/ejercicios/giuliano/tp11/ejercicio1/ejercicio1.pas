{
    Escribir un programa en Pascal que forme una lista simplemente encadenada y ordenada 
    de enteros positivos que se van leyendo. El proceso finaliza con un entero negativo. 
    Escriba el procedimiento que imprima lista anterior.
}
program eercicio1;
uses crt, UListaOrdenadaEnteros; 

procedure cargarLista(var lista: TLista);
var
    elemento: TElemento;
begin
    writeln('Ingrese un numero positivo:');
    readln(elemento);
    while (elemento >= 0) do
    begin
        insertarAscendente(lista,elemento);
        writeln('Ingrese otro numero o un numero menor  0 para terminar de cargar:');
        readln(elemento);
    end;
end;

var
    lista: TLista;
begin
    crear(lista);
    cargarLista(lista);
    listar(lista);
end.