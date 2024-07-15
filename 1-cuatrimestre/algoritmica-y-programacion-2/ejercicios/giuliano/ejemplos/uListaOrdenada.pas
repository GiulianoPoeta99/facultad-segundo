unit uListaOrdenada;

interface
    type
        TElemento = Integer;

        TLista = ^TNodo;
        TNodo = Record
            info : TElemento;
            sig  : TLista
        end;

    procedure crear(var lista:TLista);		
    function vacia(const lista:TLista):boolean;
    procedure insertar(var lista:TLista; const E:TElemento);
    procedure eliminar(var lista:TLista; E:TElemento);
    procedure listar(lista:TLista);

implementation

    procedure crear(var lista:TLista);
    begin
       lista := nil;
    end;
		
    function vacia(const lista:TLista):boolean;
    begin
        vacia := lista = nil; 
    end;
	
    procedure insertar(var lista:TLista; const e:TElemento);
    
        procedure insertarAdelante(var lista:TLista; const e:TElemento);
        var aux:TLista;
        begin
            new(aux);
            aux^.info := e;
            aux^.sig  := lista;
            lista := aux;
        end;
        
        procedure insertarEnOrden(lista:TLista; const e:TElemento);
        var aux:TLista;
        begin
            new(aux);
            aux^.info := e;
            
            writeln('mirando el nodo ...',lista^.sig^.info);
            
            //busco la posición del nodo
            while (lista^.sig <> nil) and (lista^.sig^.info < e)do
               begin
                 writeln('se miro el nodo ...',lista^.sig^.info);            
                 lista := lista^.sig; 
               end; 
            
            aux^.sig := lista^.sig;
            lista^.sig := aux;

            writeln('saliendo...');
        end;
        
    begin
      
        if (lista=nil) or (lista^.info > e) then
          
           insertarAdelante(lista, e)

        else
          
           insertarEnOrden(lista, e);   
    end;
	
    procedure eliminar(var lista:TLista; e:TElemento);
    var 
        aux, ant: Tlista;
    begin
        aux := lista; 
        ant := NIL;
        
        while(aux <> nil) and (e > aux^.info) do
            begin
            ant := aux;
            aux := aux^.sig;
            end;
        
        if(aux <> nil) and (aux^.info = e)then
            begin
            if (ant = nil)then
                lista := nil
            else
                ant^.sig := aux^.sig	
            end;
        
        dispose(aux);
    end;

    procedure listar(lista:TLista);
    begin        
        while(lista <> nil) do
            begin
            writeln(lista^.info);
            lista := lista^.sig;
            end;
    end;
end.
