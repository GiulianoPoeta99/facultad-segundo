{
    Escribir un programa en Pascal que genere una lista de NODOS que contengan los 20 
    primeros términos de la serie de Fibonacci. 
    
    Escribir luego una función que devuelva el primer elemento de la serie que sea mayor que 
    un número N dado.
}
program ejercicio4;
uses crt, UListaEnteros;

procedure crearListaFibonacci(var lista: TLista);
var
    n1, n2, aux, i: integer;
begin
    crear(lista);
    n1 := 0;
    n2 := 1;
    insertar(lista,n1);
    insertar(lista,n2);
    for i:=3 to 20 do
    begin
        aux := n1 + n2;
        insertar(lista,aux);
        // writeln(aux);
        n1 := n2;
        n2 := aux;
    end;
end;

function buscarEementoLista(lista: TLista;  elemento: integer): integer;
begin
    while ((lista <> nil) and (lista^.info <= elemento)) do
    begin
        // writeln(lista^.info);
        lista := lista^.siguiente;
    end;
    buscarEementoLista := lista^.info;
end;

var
    lista: TLista;
    numeroBusq , elementoEncontrado: integer;
begin
    crearListaFibonacci(lista);
    writeln('Ingrese un numero para buscar: ');
    readln(numeroBusq);
    // writeln(lista^.info);
    elementoEncontrado := buscarEementoLista(lista,numeroBusq);
    if (elementoEncontrado <> -1) then 
    begin
        writeln('El primer elementos mayor encontrado es: ', elementoEncontrado);
    end
    else 
    begin
        writeln('No se encontro un elemento mayor a ', numeroBusq);
    end;
end.