Unit UListaOrdenadaClientes; 

interface 

uses UClientes;

type 
    TListaOrdenada = ^TNodoOrdenado;

    TNodoOrdenado = record 
        info: TElemento;
        siguiente: TListaOrdenada;
    end;

procedure crear(var lista:TListaOrdenada);

// procedure insertarAscendente (var lista: TListaOrdenada; e: TElemento);

// procedure insertarDescendente (var lista: TListaOrdenada; e: TElemento);

// procedure listar (lista:TListaOrdenada); 

// procedure eliminar (var lista:TListaOrdenada; const e:TElemento);

// function  vacia(const lista:TListaOrdenada):boolean;


implementation

procedure crear (var lista: TListaOrdenada); 
begin
    lista:= nil;  
end;


// procedure insertarEnOrdenAscendente(lista:TListaOrdenada; e:TElemento);
// var 
//     aux:TListaOrdenada;
// begin
//     new(aux);
//     aux^.info := e;
//     //busco la posición del nodo observando al siguiente 
//     while (lista^.siguiente <> nil) and (lista^.siguiente^.info < e) do
//         lista := lista^.siguiente;
//     aux^.siguiente := lista^.siguiente;
//     lista^.siguiente := aux;
// end;

// procedure insertarEnOrdenDescendente(lista:TListaOrdenada; e:TElemento);
// var 
//     aux:TListaOrdenada;
// begin
//     new(aux);
//     aux^.info := e;
//     //busco la posición del nodo observando al siguiente 
//     while (lista^.siguiente <> nil) and (lista^.siguiente^.info > e) do
//         lista := lista^.siguiente;
//     aux^.siguiente := lista^.siguiente;
//     lista^.siguiente := aux;
// end;

procedure insertarAdelante(var lista:TListaOrdenada; e:TElemento);
var 
    aux:TListaOrdenada; 
begin
    new(aux);
    aux^.info := e;
    aux^.siguiente := lista;
    lista := aux;
end;


// procedure insertarAscendente (var lista: TListaOrdenada; e: TElemento);
// begin
//     if ((lista = nil) or (lista^.info > e)) then
//         insertarAdelante(lista, e)
//     else
//         insertarEnOrdenAscendente(lista, e);
// end;

// procedure insertarDescendente (var lista: TListaOrdenada; e: TElemento);
// begin
//     if ((lista = nil) or (lista^.info < e)) then
//         insertarAdelante(lista, e)
//     else
//         insertarEnOrdenDescendente(lista, e);
// end;

// procedure listar (lista:TListaOrdenada); 
// begin
//     write('[');
//     while(lista <> nil) do
//     begin
//         write(lista^.info);
//         lista := lista^.siguiente;
//         write(', ');
//     end;
//     writeln(']');
// end;


// procedure eliminar (var lista: TListaOrdenada; const e: TElemento);
// var
//     aux, ant: TListaOrdenada;
// begin
//     aux := lista; 
//     ant := NIL;
//     while ((aux <> nil) and (e > aux^.info)) do
//     begin
//         ant := aux;
//         aux := aux^.siguiente;
//     end;
//     //verificamos si lo encontro
//     if(aux <> nil) and (aux^.info = e)then
//     begin 
//         //verificamos si esta al principio
//         if (ant = nil)then
//             lista := aux^.siguiente
//         else
//             ant^.siguiente := aux^.siguiente;	
//             dispose(aux);
//     end;
// end;

// function vacia(const lista:TListaOrdenada):boolean;
// begin
//     vacia := lista = nil; 
// end;


END.