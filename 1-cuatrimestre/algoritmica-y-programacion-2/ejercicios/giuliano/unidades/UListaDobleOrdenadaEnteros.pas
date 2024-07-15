unit UListaDobleOrdenadaEnteros;

interface

type 
    TElemento = integer;
    TPuntero = ^TNodo;
    TListaDobleOrdenada = record
        cabeza,fin:TPuntero;
    end;
    TNodo = record
        elemento:TElemento;
        ant,sig:TPuntero; 
    end;

procedure crear(var lista:TListaDobleOrdenada);

function vacia(lista:TListaDobleOrdenada):boolean;

procedure insertarAdelante(var lista:TListaDobleOrdenada; elemento:TElemento);

procedure insertarAtras(var lista:TListaDobleOrdenada; elemento:TElemento);

procedure insertarOrdenado(var lista:TListaDobleOrdenada; elemento:TElemento);

procedure insertar(var lista:TListaDobleOrdenada; elemento:TElemento);

function buscar(lista:TListaDobleOrdenada; elemento:TElemento):TElemento;

procedure eliminar(var lista:TListaDobleOrdenada; elemento:TElemento);

procedure listar(lista:TListaDobleOrdenada);

procedure listarInverso(lista:TListaDobleOrdenada);

procedure primerElemento(var lista:TListaDobleOrdenada; var elemento:TElemento);

procedure ultimoElemento(var lista:TListaDobleOrdenada; var elemento:TElemento);

implementation 

procedure crear(var lista:TListaDobleOrdenada);
begin
    lista.cabeza:=nil;
    lista.fin:=nil;
end;

function vacia(lista:TListaDobleOrdenada):boolean;
begin
    vacia:= lista.cabeza = nil;
end;

procedure insertarAdelante(var lista:TListaDobleOrdenada; elemento:TElemento);
var nuevoNodo:TPuntero;
begin
    new(nuevoNodo);
    nuevoNodo^.elemento:=elemento;
    nuevoNodo^.ant:=nil;
    nuevoNodo^.sig:=nil;
    if (lista.cabeza = nil) then    
        begin 
            lista.fin:=nuevoNodo;
            lista.cabeza:=lista.fin;
        end
    else
        begin 
            lista.cabeza^.ant:=nuevoNodo;
            nuevoNodo^.sig:=lista.cabeza;
        end;   
    lista.cabeza:=nuevoNodo;
end;

procedure insertarAtras(var lista:TListaDobleOrdenada; elemento:TElemento);
var nuevoNodo:TPuntero;
begin
    new(nuevoNodo);
    nuevoNodo^.elemento:=elemento;
    nuevoNodo^.sig:=nil;
    nuevoNodo^.ant:=nil;
    if (lista.fin = nil) then    
        begin 
            lista.cabeza:=nuevoNodo;
            lista.fin:=nuevoNodo;
        end
    else
        begin 
            lista.fin^.sig:= nuevoNodo;
            nuevoNodo^.ant:= lista.fin;
        end;
    lista.fin:=nuevoNodo;
end;

procedure insertarOrdenado(var lista: TListaDobleOrdenada; elemento: TElemento);
var
    aux, nodo: TPuntero;
begin
    new(nodo);
    nodo^.elemento := elemento;
    aux := Lista.cabeza;
    nodo^.sig := nil;
    nodo^.ant := nil;
    
    if elemento > lista.fin^.elemento then
    begin
        nodo^.ant:=lista.fin;
        lista.fin^.sig:=nodo;
        lista.fin:=nodo;
    end
    else
    begin
        while (aux^.sig<>nil)and(aux^.sig^.elemento < elemento)do
            aux:=aux^.sig; 
        nodo^.ant:=aux;
        nodo^.sig:=aux^.sig;
        if aux^.sig<>nil then 
            aux^.sig^.ant:=nodo;    
        aux^.sig:=nodo;        
    end;
end;

procedure insertar (var lista:TListaDobleOrdenada;  elemento:TElemento);
begin
    if (lista.cabeza = nil) or (lista.cabeza^.elemento > elemento) then
        insertarAdelante(lista, elemento)
    else
        insertarOrdenado(lista, elemento);
end;

function buscar (lista:TListaDobleOrdenada; elemento:TElemento):TElemento;
var viajero:TPuntero;
begin 
    viajero:= lista.cabeza;
    while (viajero^.elemento <> elemento) do 
        viajero:=viajero^.sig;
    if (viajero^.elemento = elemento) then 
        buscar:=viajero^.elemento
    else 
        writeln('no encontrado');
end;   

procedure eliminar (var lista:TListaDobleOrdenada; elemento:TElemento);
var deletear:TPuntero;
begin 
    deletear:=lista.cabeza;
    if (deletear^.elemento = elemento) then 
            deletear:=deletear^.sig
    else 
        begin 
            while (deletear^.elemento <> elemento) do
                deletear:=deletear^.sig;
            if (deletear^.elemento = elemento) then 
            begin 
                    deletear^.ant^.sig:= deletear^.sig;
                    deletear^.sig^.ant:= deletear^.ant; 
            end;
    end;
    dispose(deletear);
end;

procedure listar (lista:TListaDobleOrdenada);
var nuevoNodo:TPuntero;
begin
    nuevoNodo:=lista.cabeza;
    while (nuevoNodo <> nil) do 
    begin 
        writeln(nuevoNodo^.elemento,', ');
        nuevoNodo:=nuevoNodo^.sig;
    end;
    writeln;
end;

procedure listarInverso (lista:TListaDobleOrdenada);
var aux:TPuntero;
begin
    aux:=lista.fin;
    while (aux <> nil) do 
    begin 
        writeln(aux^.elemento,', ');
        aux:=aux^.ant;
    end;
    writeln;
end;

procedure primerElemento(var lista:TListaDobleOrdenada; var elemento:TElemento);
begin 
    elemento:=lista.cabeza^.elemento;
    lista.cabeza:=lista.cabeza^.sig;

    if (lista.cabeza=nil) then 
        lista.fin:=nil;
end;

procedure ultimoElemento(var lista:TListaDobleOrdenada; var elemento:TElemento);
begin 
    elemento:=lista.fin^.elemento;
    lista.fin:=lista.fin^.ant;

    if (lista.fin=nil) then           
        lista.cabeza:=nil;
end;


begin
end.