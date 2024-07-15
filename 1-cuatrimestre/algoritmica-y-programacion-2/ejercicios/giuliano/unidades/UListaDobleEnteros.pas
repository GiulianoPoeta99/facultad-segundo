unit UListaDobleEnteros;

interface

type 
    TElemento = integer; 
    TListaDoble = record
        cabeza,fin:^TNodo;
    end;
    TPuntero = ^TNodo;
    TNodo = record
        elemento:TElemento;
        ant,sig:TPuntero;
    end;

procedure crear (var lista:TListaDoble);

function vacia (lista:TListaDoble):boolean;

procedure insertar (var lista:TListaDoble; elemento:TElemento);

procedure insertarAscendente(var lista:TListaDoble;elemento:TElemento);

procedure insertarDescendente(var lista:TListaDoble;elemento:TElemento);

procedure listarAscendente (lista:TListaDoble);

procedure listarDescendente (lista:TListaDoble);

procedure sacar (var lista:TListaDoble; var elemento:TElemento);

procedure deliminar (var lista:TListaDoble; var elemento:TElemento);

implementation 

procedure crear (var lista:TListaDoble);
begin
    lista.fin:=nil;
    lista.cabeza:=nil;
end;

function vacia (lista:TListaDoble):boolean;
begin
    vacia:=lista.cabeza= nil;
end;

procedure insertar (var lista:TListaDoble; elemento:TElemento);
var nodo:TPuntero;
begin
    new(nodo);
    nodo^.info:=elemento;
    nodo^.sig:=nil;
    nodo^.ant:=nil;

    if (lista.cabeza = nil) then  
    begin
        lista.fin:=nodo;
        lista.cabeza:=lista.fin;
    end
    else
    begin
        lista.fin^.sig:=nodo;
        nodo^.ant:=lista.fin;
        lista.fin:=nodo;
    end;    
end;            

procedure insertarAscendente(var lista:TListaDoble;elemento:TElemento);
var nodo,Aux:Tpuntero;
begin
    new(nodo);
    nodo^.info:=elemento;
    nodo^.sig:=nil;
    nodo^.ant:=nil;
    if vacia(lista)then
    begin
        lista.fin:=nodo;
        lista.cabeza:=lista.fin;
    end
    else if (lista.cabeza^.info>elemento) then
    begin
        lista.cabeza^.ant:=nodo;
        nodo^.sig:=lista.cabeza;
            lista.cabeza:=nodo;
    end
    else 
    begin
        Aux:=lista.cabeza;        
        while (aux^.sig<>Nil)and(elemento>Aux^.sig^.info)do  
            aux:=aux^.sig;  
        nodo^.sig:=aux^.sig;
        nodo^.ant:=aux;
        aux^.sig:=nodo;
        if nodo^.sig<>nil then 
            nodo^.sig^.ant:=nodo
        else
            lista.fin:= nodo;    
        
    end;         
end;

procedure insertarDescendente(var lista:TListaDoble;elemento:TElemento);
var nodo,Aux:Tpuntero;
begin
    new(nodo);
    nodo^.info:=elemento;
    nodo^.sig:=nil;
    nodo^.ant:=nil;
    if vacia(lista)then
    begin
        lista.fin:=nodo;
        lista.cabeza:=lista.fin;
    end
    else if (lista.cabeza^.info<elemento) then
    begin
        lista.cabeza^.ant:=nodo;
        nodo^.sig:=lista.cabeza;
            lista.cabeza:=nodo;
    end
    else 
    begin
        Aux:=lista.cabeza;        
        while (aux^.sig<>Nil)and(elemento<Aux^.sig^.info)do  
            aux:=aux^.sig;  
        nodo^.sig:=aux^.sig;
        nodo^.ant:=aux;
        aux^.sig:=nodo;
        if nodo^.sig<>nil then 
            nodo^.sig^.ant:=nodo
        else
            lista.fin:= nodo;    
        
    end;         
end;

procedure listarAscendente (lista:TListaDoble);
var actual:Tpuntero;
begin
    actual:=lista.cabeza;
    while (actual<>nil) do 
    begin
        write(actual^.info,',');        
        actual:=actual^.sig;
    end; 
end;

procedure listarDescendente (lista:TListaDoble);
var actual:Tpuntero;
begin
    actual:=lista.fin;
    while (actual<>nil) do 
    begin
        write(actual^.info,',');        
        actual:=actual^.ant;
    end; 
end;

procedure deliminar (var lista:TListaDoble; var elemento:TElemento);
var actual:Tpuntero;
begin
    actual:=lista.cabeza;

    while (actual<>nil) and (actual^.info<>elemento)do 
        actual:=actual^.sig;
    
    if (actual<>nil) and (actual^.info=elemento) then 
    begin
        if (actual^.ant=nil) then 
        begin
            lista.cabeza:=actual^.sig;
                if (lista.cabeza<>nil) then
                    lista.cabeza^.ant:=nil
                else
                    lista.fin:=nil
        end 
        else
        begin
            actual^.ant^.sig := actual^.sig;
            if (actual^.sig<>nil) then 
                actual^.sig^.ant:=actual^.ant
            else
                lista.fin:=actual^.ant;
        end;   
            dispose(actual);
    end;
end;

procedure sacar (var lista:TListaDoble; var elemento:TElemento);
var nodo:Tpuntero;
begin
    nodo:=lista.cabeza;
    elemento:=nodo^.info;
    lista.cabeza:=nodo^.sig;

    if (lista.cabeza=nil) then
        lista.fin:=nil;

    dispose(nodo);
    end;

begin
end.