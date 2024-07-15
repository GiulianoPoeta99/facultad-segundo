unit UColaListaEnteros;

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
var 
    e:TElemento;
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
    aux^.sig := nil;
    // verifico si es el primer nodo a insertar
    if (cola.fin = nil) then
        cola.cab := aux 
    else
        cola.fin^.sig := aux;
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
    if(cola.cab = nil)then
        cola.fin := nil;
    dispose(cabeza);
end;


begin
    
end.