unit UcolaEnteros;

interface

const
    N=100;
Type
    TElemento = integer;
    TCola = record
        elementos:array[1..N]of TElemento;
        primero,
        ultimo,
        cantidad:integer;
    end;

//
procedure crear(var cola:TCola);
//
function vacia(const cola:TCola):boolean;
//
function llena(const cola:TCola):boolean;
//
procedure meter(var cola:TCola; const E:TElemento);
//
procedure sacar(var cola:TCola; var E:TElemento);

implementation

procedure crear(var cola:TCola);
begin
    with cola do
    begin
        primero := 1;
        ultimo := 0;
        cantidad:= 0;
    end;
end;

function vacia(const cola:TCola):boolean;
begin
    vacia := cola.cantidad=0;
end;

function llena(const cola:TCola):boolean;
begin
    llena := cola.cantidad=N;
end;

procedure meter(var cola:TCola; const E:TElemento);
begin
    with cola do
    begin
        ultimo := (ultimo mod N) + 1;
        elementos[ultimo] := E;
        cantidad := cantidad + 1;
    end;
end;

procedure sacar(var cola:TCola; var E:TElemento);
begin
    with cola do
    begin
        E := elementos[primero];
        primero := (primero mod N ) + 1 ;
        cantidad := cantidad - 1;
    end;
end;

begin
    
end.



