unit UListaEmpleados;

interface 

type 
    TElemento= record
        nombre: string[20]; 
        nroEmp: integer; 
        codigoDpto: char; 
        hrSemana: integer; 
        salario: real;
    end;

    TLista = ^TNodo;

    TNodo = record 
        info: TElemento;
        siguiente: TLista;
    end;


procedure crear(var lista:TLista);

procedure insertar(var lista:TLista; const e:TElemento);

procedure insertarAdelante(var lista:TLista; const e:TElemento);

function vacia(const lista:TLista):boolean;

procedure eliminarTodosPorHsSemanales (var lista: TLista; const e: TElemento);

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

procedure eliminarTodosPorHsSemanales (var lista: TLista; const e: TElemento);
var
    aux, ant: TLista;
begin
    aux := lista; 
    ant := NIL;
    while (aux <> nil) do
    begin
        if (aux^.info.hrSemana < 40) then
        begin
            if (ant = nil) then 
            begin
                aux := aux^.siguiente;
            end 
            else
            begin
                ant^.siguiente := aux^.siguiente;
                aux := ant;
            end;
        end;
        ant := aux;
        aux := aux^.siguiente;
    end;
    lista := ant;
    dispose(ant);
end;

BEGIN
END.