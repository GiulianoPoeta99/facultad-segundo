unit uLista;

interface

type
    Telemento = Variant;
    Tlista = ^Nodo;
    Tnodo = ^Nodo;
    Nodo = record   
        info : TElemento;
        next : Tlista;
    end;

procedure iniciar(var lista : Tlista);

procedure agregar_final(var lista : Tlista; elemento : Telemento);

procedure agregar_adelante(var lista : Tlista; elemento : Telemento);

procedure borrar(var lista : Tlista; elemento : Telemento); 

procedure leer_lista(lista : Tlista);

function acceder_posicion(lista : Tlista; pos:Integer): Telemento;

function buscar(lista : Tlista ; elemento : Telemento): Telemento;

implementation

procedure iniciar(var lista : Tlista);
begin
  if (lista^.next <> Nil) then 
    begin
        iniciar(lista^.next);
        lista := Nil
    end;
    
end;

procedure agregar_final(var lista : Tlista; elemento : Telemento);
var 
    nuevo_nodo : Tnodo;
begin
    nuevo_nodo := lista;
    if nuevo_nodo <> Nil then
        begin 
            while nuevo_nodo^.next <> Nil do 
                nuevo_nodo := nuevo_nodo^.next;
                new(nuevo_nodo^.next);
                nuevo_nodo^.next^.info := elemento;
                nuevo_nodo^.next^.next := Nil;
        end
    else
        begin
            New(lista);
            lista^.info := elemento;
            lista^.next := Nil;
        end;
end;

procedure agregar_adelante(var lista : Tlista ; elemento : Telemento);
var 
    nuevo_nodo : Tnodo;
begin
    New(nuevo_nodo);
    nuevo_nodo^.info := elemento;
    nuevo_nodo^.next := lista;
    lista := nuevo_nodo;
end;

procedure borrar(var lista:Tlista ; elemento : Telemento);
var aux, pre_aux : Tlista;
begin
    pre_aux:= nil;
    aux := lista;
    while (aux <> nil) and (aux^.info <> elemento) do
      begin
        pre_aux := aux;
        aux := aux^.next;
      end;
    
    if (aux <> nil) and (lista^.info = elemento)then 
        begin
          if pre_aux = Nil then 
            lista := aux^.next
        end
    else 
        pre_aux^.next := aux^.next;
    Dispose(aux);
end;

procedure leer_lista(lista : Tlista);
begin
    Write('[');
    While lista <> Nil do 
        begin
          Write(' ',lista^.info,' ');
          lista:= lista^.next;
        end;
    WriteLn(']');
end;

function acceder_posicion(lista : Tlista; pos:Integer): Telemento;
var 
    npos: Integer;
begin
    npos := 0; //la lista tiene posicion 0
    while (npos < pos) and (lista <> Nil) do 
        begin
          inc(npos);
          lista:= lista^.next;
        end; 
    
    if (npos <> pos) then 
        begin
            acceder_posicion := lista^.info;  
        end
end;

function buscar (lista:Tlista; elemento : Telemento):Telemento;
begin
    while (lista^.info <> elemento) and (lista <> Nil) do
        lista:= lista^.next;
    
    if lista = Nil then 
        buscar := -1
    else 
        buscar := lista^.info;
end;
end.
