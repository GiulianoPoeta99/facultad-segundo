unit UColaCircularListaEnteros;

interface

type
    TElemento = Integer;
    TCola = record
        cab, fin : ^TNodo;
    end;
    TLista = ^TNodo;
    TNodo = record
        info: TElemento;
        sig : TLista;
    end;

procedure crear(var cola:TCola);

function vacia(const cola:TCola):boolean;

procedure meter(var cola:TCola; const E:TElemento);

procedure sacar(var cola:TCola; var E:TElemento);

implementation

procedure crear(var cola:TCola);
begin
    cola.cab := nil;
    cola.fin := nil;
end;

function vacia(const cola:TCola):boolean;
begin
    vacia := cola.cab = nil; 
end;

procedure meter(var cola:TCola; const E:TElemento);
var 
    aux:TLista;
begin
    new(aux);
    aux^.info := e;
    // verifico si es el primer nodo a insertar
    if (cola.fin = nil) then
    begin
        aux^.sig := aux;
        cola.cab := aux;
    end
    else
    begin
        aux^.sig := cola.cab;
        cola.fin^.sig := aux;
    end;
    cola.fin := aux;
end;

procedure sacar(var cola:TCola; var E:TElemento);
var
    cabeza:^TNodo;
begin
    cabeza := cola.cab;
    E := cabeza^.info;
    cola.cab := cabeza^.sig;
    //verifico si era el último
    if(cola.cab = cola.fin^.sig)then
    begin 
        cola.cab := nil;
        cola.fin := cola.cab;
    end;
    dispose(cabeza);
end;


begin
    
end.