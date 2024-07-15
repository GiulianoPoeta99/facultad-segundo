unit UListaClientes; 

interface 

uses UClientes;

type  
    TLista = ^TNodoLista;

    TNodoLista = record 
        info: TElemento;
        siguiente: TLista;
    end;


procedure crear(var lista:TLista);

procedure insertar(var lista:TLista; const e:TElemento);

procedure insertarAdelante(var lista:TLista; const e:TElemento);

// procedure eliminar (var lista:TLista; const e:TElemento);

// procedure listar(lista:TLista); 

function  vacia(const lista:TLista):boolean;

// function buscar (lista:TLista; const e: TElemento):TElemento;

implementation

procedure crear (var lista: TLista); 
begin
    lista:= nil;  
end;


procedure insertar(var lista:TLista; const e:TElemento);
var 
    aux: TLista;
begin
    aux:= lista;
    if (aux <> Nil) then  
    begin 
        while (aux^.siguiente <> Nil) do
            aux := aux^.siguiente;
        new(aux^.siguiente);
        aux^.siguiente^.info := e;
        aux^.siguiente^.siguiente := Nil;
    end
    else
    begin
        New(lista);
        lista^.info := e;
        lista^.siguiente := Nil;
    end;
end;

procedure insertarAdelante (var lista: TLista; const e: TElemento);
var 
    aux: TLista; 
begin
    new(aux); 
    aux^.info:= e; 
    aux^.siguiente:= lista; 
    lista:= aux; 
end;

// procedure eliminar (var lista: TLista; const e: TElemento);
// var
//     aux, ant: TLista;
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
//         dispose(aux);
//     end;
// end;

// procedure listar(lista:TLista);
//     begin        
//         while(lista <> nil) do
//             begin
//             writeln(lista^.info);
//             lista := lista^.siguiente;
//             end;
//     end;

function vacia(const lista:TLista):boolean;
    begin
        vacia := lista = nil; 
    end;

// function buscar (lista:TLista; const e: TElemento):TElemento;
// begin
//     while (lista <> Nil) and (lista^.info <> e) do
//         lista:= lista^.siguiente;
//     if lista = Nil then 
//         buscar := -1
//     else 
//         buscar := lista^.info;
// end;

BEGIN
END.