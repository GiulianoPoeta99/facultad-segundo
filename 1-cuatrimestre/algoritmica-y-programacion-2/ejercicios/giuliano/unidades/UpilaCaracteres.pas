unit UpilaCaracteres;

interface

const
    N=100;
Type
    TPila = record
        elementos:array[1..N] of char;
        indice:byte;
    end;

//init
procedure crear(var pila:TPila);
//empty
function vacia(const pila:TPila):boolean;
//full
function llena(const pila:TPila):boolean;
//push
procedure meter(var pila:TPila; E:char);
//pop
procedure sacar(var pila:TPila; var E:char);

implementation

procedure crear(var pila:TPila);
begin
    pila.indice := 0;
end;

function vacia(const pila:TPila):boolean;
begin
    vacia := pila.indice = 0;
end;

function llena(const pila:TPila):boolean;
begin
    llena := pila.indice = N;
end;

procedure meter(var pila:TPila; E:char);
begin
    with pila do begin
        indice := indice + 1;
        elementos[indice] := E;
    end;
end;

procedure sacar(var pila:TPila; var E:char);
begin
    with pila do begin
        E := elementos[indice];
        indice := indice - 1;
    end;
end;

begin
    
end.