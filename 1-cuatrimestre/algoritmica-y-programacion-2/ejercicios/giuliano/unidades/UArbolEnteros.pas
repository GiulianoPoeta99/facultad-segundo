unit UArbolEnteros;

Interface 

uses UColaListaArbolEnteros;

procedure crearArbol(var arbol:TArbol);

procedure meterArbol(var arbol:TArbol; const e:TElemento);

function vaciaArbol(arbol:TArbol):boolean;

function buscarArbol(arbol:TArbol; const e:TElemento):TArbol;

procedure eliminarArbol(var arbol:TArbol; e:TElemento);

procedure listarEnOrden(arbol:TArbol);

procedure listarPreOrden(arbol: TArbol);

procedure listarPostOrden(arbol: TArbol);

procedure listarPorNivel(nodo:TArbol);

implementation 

procedure crearArbol(var arbol:TArbol);
begin
    arbol := nil;
end;

procedure meterArbol(var arbol:TArbol; const e:TElemento);
var
    aux: TArbol;
begin
    if (arbol = nil) then
    begin 
        crearArbol(aux);
        arbol^.info := e;
    end
    else 
        if e < arbol^.info then
            meterArbol(arbol^.izq, e) 
        else  
            meterArbol(arbol^.der, e)
end;

function vaciaArbol(arbol:TArbol):boolean;
begin
    vaciaArbol := arbol = nil;
end;

function buscarArbol(arbol:TArbol; const e:TElemento):TArbol;
begin
    while (arbol<>nil) and (arbol^.info<>e) do
    begin
        if(arbol^.info>e)then
            arbol := arbol^.izq 
        else
            arbol := arbol^.der; 
    end;
    buscarArbol := arbol;
end;

procedure buscarEliminar(arbol: TArbol; const e: TElemento; var nodoEliminar, nodoPadre: TArbol);
begin
    if (arbol = nil) then
    begin
        nodoEliminar := nil;
        nodoPadre := nil;
    end
    else if (arbol^.info = e) then
    begin
        nodoEliminar := arbol;
        nodoPadre := nil;
    end
    else if (e < arbol^.info) then
    begin
        if (arbol^.izq <> nil) and (arbol^.izq^.info = e) then
        begin
            nodoEliminar := arbol^.izq;
            nodoPadre := arbol;
        end
        else
            buscarEliminar(arbol^.izq, e, nodoEliminar, nodoPadre);
    end
    else
    begin
        if (arbol^.der <> nil) and (arbol^.der^.info = e) then
        begin
            nodoEliminar := arbol^.der;
            nodoPadre := arbol;
        end
        else
            buscarEliminar(arbol^.der, e, nodoEliminar, nodoPadre);
    end;
end;

procedure eliminarHoja(var arbol,nEliminar,nPadre:TArbol);
begin
    //es raiz
    if(nPadre=nil)then
        arbol := nil
    else
    begin
        //verifico cual tengo que borrar
        if(nPadre^.der = nEliminar)then
            nPadre^.der := nil
        else
            nPadre^.izq := nil;
    end;
    dispose(nEliminar);
end;

procedure eliminarConHijoIzquierdo(var arbol, nEliminar, nPadre:TArbol);
begin
    if(nPadre= nil)then
        arbol := nEliminar^.izq
    else
    begin
        //verifico cual le asigno al padre
        if(nPadre^.izq = nEliminar)then
            nPadre^.izq := nEliminar^.izq
        else
            nPadre^.der := nEliminar^.izq;
    end;
    dispose(nEliminar);
end;

procedure eliminarConHijoDerecho(var arbol, nEliminar, nPadre:TArbol);
begin
    if(nPadre= nil)then
        arbol := nEliminar^.der
    else
    begin
        //verifico cual le asigno al padre
        if(nPadre^.der = nEliminar)then
            nPadre^.der := nEliminar^.der
        else
            nPadre^.izq := nEliminar^.der;
    end;
    dispose(nEliminar);
end;

procedure eliminarConAmbosHijos(var nEliminar, padre:TArbol);
var temporal:TArbol;
begin
    //busco el menor del subárbol derecho (más grandes)
    padre:= nEliminar;
    temporal := nEliminar^.der;
    //busco el nodo temporal (más chico)
    while(temporal^.izq <> nil)do
    begin
        padre:= temporal;
        temporal := temporal^.izq;
    end;
    nEliminar^.info := temporal^.info;
    // verifico con quien conecto al padre
    if(padre = nEliminar)then //no se avanzo en la búsqueda del temp.
        padre^.der := temporal^.der
    else 
        padre^.izq := temporal^.der;
    //
    dispose(temporal);
end;


procedure eliminarArbol(var arbol:TArbol; e:TElemento);
var
    nEliminar,nPadre: TArbol;
begin
    //busca e en el árbol. Retorna en nElimnar el nodo a eliminar...
    buscarEliminar(arbol, e, nEliminar, nPadre);
    if(nEliminar=nil)then
        writeln('el nodo no se encuentra en el árbol')
    else
    begin
        // verificamos bajo qué situación nos encontramos
        if(nEliminar^.izq = nil)and(nEliminar^.der = nil)then
            //
            eliminarHoja(arbol, nEliminar, nPadre)
        else if(nEliminar^.der = nil)then
            //
            eliminarConHijoIzquierdo(arbol, nEliminar, nPadre)
        else if(nEliminar^.izq = nil)then
            //
            eliminarConHijoDerecho(arbol, nEliminar, nPadre)
        else
            //
            eliminarConAmbosHijos(nEliminar, nPadre);
    end;
end;

procedure listarEnOrden(arbol:TArbol);
begin
    if(arbol<>NIL) then 
    begin 
        listarEnOrden(arbol^.izq); 
        writeln(arbol^.info); 
        listarEnOrden(arbol^.der); 
    end;
end;

procedure listarPreOrden(arbol: TArbol);
begin
    if arbol <> nil then
    begin
        writeln(arbol^.info);
        listarPreOrden(arbol^.izq);
        listarPreOrden(arbol^.der);
    end;
end;

procedure listarPostOrden(arbol: TArbol);
begin
    if arbol <> nil then
    begin
        listarPostOrden(arbol^.izq);
        listarPostOrden(arbol^.der);
        writeln(arbol^.info);
    end;
end;

procedure listarPorNivel(nodo:TArbol);
var
    cola :TCola;
begin
    crearCola(cola); 
    meterCola(cola, nodo);
    while (not vaciaCola(cola)) do
    begin
        sacarCola(cola, nodo);
        writeln(nodo^.info);
        if (nodo^.izq <> nil) then
            meterCola(cola, nodo^.izq); 
        if (nodo^.der <> nil) then
            meterCola(cola, nodo^.der); 
    end;
end;

begin
end.