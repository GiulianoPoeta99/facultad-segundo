unit UListaPersonas; 

interface 

type 
    TElemento = record 
        nombre: string;
        edad: integer;
        sexo: char;
    end;

    TLista = ^TNodo;

    TNodo = record 
        info: TElemento;
        siguiente: TLista;
    end;


procedure crear(var lista:TLista);

procedure insertar(var lista:TLista; const e:TElemento);

procedure insertarAdelante(var lista:TLista; const e:TElemento);

function  vacia(const lista:TLista):boolean;

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

function vacia(const lista:TLista):boolean;
    begin
        vacia := lista = nil; 
    end;

BEGIN
END. 