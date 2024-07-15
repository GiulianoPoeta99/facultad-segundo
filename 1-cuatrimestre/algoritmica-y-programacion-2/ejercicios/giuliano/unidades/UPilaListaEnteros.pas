unit UPilaListaEnteros;

interface

type
    TElemento = integer;
    TPila = ^TNodo;
    TNodo = record
        info : TElemento;
        sig  : TPila
    end;

procedure crear(var pila:TPila);

procedure meter(var pila:TPila; const E:TElemento);

function vacia(const pila:TPila):boolean;

procedure sacar(var pila:TPila; var e:TElemento);

procedure imprimir(pila: TPila);

implementation

procedure crear(var pila:TPila);
begin
    pila := nil;
end;

function vacia(const pila:TPila):boolean;
begin
    vacia := pila = nil; 
end;

procedure meter(var pila:TPila; const E:TElemento);
var
    aux:TPila;
begin
    new(aux);
    aux^.info := e;
    aux^.sig := pila;
    pila := aux; 
end;

procedure sacar(var pila:TPila; var e:TElemento);
var
    aux:TPila;
begin
    aux := pila;
    pila := pila^.sig;
    e := aux^.info;
    dispose(aux);
end;

procedure imprimir(pila: TPila);
var
    e: TElemento;
    pilaAux: TPila;
begin
    pilaAux := pila;
    write('[ ');
    while (not vacia(pilaAux)) do 
    begin
        sacar(pilaAux,e);
        write(e,' ,');
    end;
    write(' ]');
    writeln;
end;

begin
    
end.