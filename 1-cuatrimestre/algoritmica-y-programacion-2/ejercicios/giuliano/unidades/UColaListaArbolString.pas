unit UColaListaArbolString;

interface

type
    TElemento= string; 
    TArbol = ^TNodoArbol;

    TNodoArbol = record 
        info: TElemento;
        izq,der: TArbol;
    end;

    TCola = record
        cab, fin : ^TNodoCola;
    end;
    TLista = ^TNodoCola;
    TNodoCola = record
        info: TArbol;
        sig : TLista;
    end;

procedure crearCola(var cola:TCola);

function vaciaCola(const cola:TCola):boolean;

procedure meterCola(var cola:TCola; const E:TArbol);

procedure sacarCola(var cola:TCola; var E:TArbol);

implementation

procedure crearCola(var cola:TCola);
begin
    cola.cab := nil;
    cola.fin := nil;
end;

function vaciaCola(const cola:TCola):boolean;
begin
    vaciaCola := cola.cab = nil; 
end;

procedure meterCola(var cola:TCola; const E:TArbol);
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

procedure sacarCola(var cola:TCola; var E:TArbol);
var
    cabeza:^TNodoCola;
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