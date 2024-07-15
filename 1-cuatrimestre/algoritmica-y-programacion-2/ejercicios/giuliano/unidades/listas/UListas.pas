Unit UListas; 

interface 

type 
    TElementos: integer; 
    TLista = ^TNodo;

    TNodo = record 
        e: TElementos;
        siguiente: TLista;
    end;


procedure crear(var lista:TLista);
procedure insertar(var lista:TLista;var  e:TElementos);
procedure eliminar (var lista:TLista; var e:TElementos);
procedure listar(lista:TLista); 
function  vacia(const lista:TLista):boolean;
function buscar (lista:TLista; const e: TElemento):TElemento;



implementation

procedure inicializar(var lista: TLista); 
begin
    lista:= nil;  
end;

procedure insertar (var lista: TLista; const e: TElemento);
var 
    aux: TLista; 
begin
    new(aux); 
    aux^.e:= e; 
    aux^.siguiente:= lista; 
    lista:= aux; 
end;

procedure eliminar (var lista: TLista; e: TElemento);
var
    aux, ant: TLista;
begin
    aux := lista; 
    ant := NIL;
    while ((aux <> nil) and (e > aux^.info)) do
    begin
        ant := aux;
        aux := aux^.sig;
    end;
    //verificamos si lo encontro
    if(aux <> nil) and (aux^.info = e)then
    begin 
        //verificamos si esta al principio
        if (ant = nil)then
            lista := aux^.sig
        else
            ant^.sig := aux^.sig;	
        dispose(aux);
    end;
end;

procedure listar(lista:TLista);
    begin        
        while(lista <> nil) do
            begin
            writeln(lista^.info);
            lista := lista^.sig;
            end;
    end;

function vacia(const lista:TLista):boolean;
    begin
        vacia := lista = nil; 
    end;

function buscar (lista:TLista; const e: TElemento):TElemento;
begin
    while (lista^.info <> e) and (lista <> Nil) do
        lista:= lista^.siguiente;
    if lista = Nil then 
        buscar := -1
    else 
        buscar := lista^.info;
end;


END