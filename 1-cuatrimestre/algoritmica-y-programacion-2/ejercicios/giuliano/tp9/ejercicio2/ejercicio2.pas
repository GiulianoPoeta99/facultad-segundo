{
    Escribir una FUNCIÓN de tipo puntero que explore una lista en busca de un entero dado y 
    devuelva NIL si el entero no se encuentra en la lista o el puntero al nodo donde está el 
    entero buscado.  
}
program ejercicio1;
uses crt, UListaEnteros;

procedure cargarLista(var lista: TLista);
var
    seguirCargando: char;
    numero: TElemento;
begin
    seguirCargando := 's';
    crear(lista);
    while (seguirCargando = 's') do 
    begin
        writeln('Ingrese un elemento: ');
        readln(numero);
        insertar(lista,numero);
        writeln('Quiere ingresar otro?  s/n');
        readln(seguirCargando);
    end;
    writeln('isto');
end;

function buscarPuntero(lista: TLista; elemento: TElemento): Tlista;
begin
    buscarPuntero := nil;
    lista := lista^.siguiente;
    while ((lista <> nil) and (buscarPuntero = nil)) do 
    begin
        writeln('debug: while');
        if (elemento <> lista^.info) then
        begin
            lista := lista^.siguiente;
        end
        else
        begin
            buscarPuntero := lista;
        end;
    end;
end;

var
    lista, puntero: TLista;
    elemento: TElemento;
begin
    cargarLista(lista);
    writeln('Ingrese un elemento para buscar su puntero: ');
    readln(elemento);
    writeln('Buscando elemento...');
    puntero := buscarPuntero(lista,elemento);
    if (puntero = nil) then
    begin
        writeln('No se encontro el elemento.');
    end
    else 
    begin
        writeln('El elemento se encontro y es el ',puntero^.info);
    end;
end.