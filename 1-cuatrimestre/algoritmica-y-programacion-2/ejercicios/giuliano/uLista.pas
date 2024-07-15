unit uLista;

interface
    type
        TElemento = Integer;

		//Otro modo de hacer la declaración.
		TPunteroNodo = ^TNodo;
        TLista = TPunteroNodo;
		TNodo = Record
            info : TElemento;
            sig  : TPunteroNodo;
        end;

    procedure crear(var lista:TLista);		
    function  vacia(const lista:TLista):boolean;
    procedure insertarAdelante(var lista:TLista; const E:TElemento);
    procedure insertarR(var lista:TLista; const E:TElemento);
    procedure insertar(var lista:TLista; const E:TElemento);
    procedure eliminar(var lista:TLista; E:TElemento);
    procedure listar(lista:TLista);
    procedure listarR(lista:TLista);
    
	procedure destruir(var lista:TLista);

implementation

    procedure crear(var lista:TLista);
    begin
       lista := nil;
    end;
		
    function vacia(const lista:TLista):boolean;
    begin
        vacia := lista = nil; 
    end;
	
    procedure insertarAdelante(var lista:TLista; const e:TElemento);
    var aux:TLista;
    
	begin
		new(aux);
		aux^.info := e;
		aux^.sig  := nil;
        
        if (lista=nil) then
			lista := aux
        else
			begin
			aux^.sig := lista;
			lista := aux;
			end;
    end;
	
	procedure insertar(var lista:TLista; const e:TElemento);
    var aux,ptr:TLista;
    
	begin
		new(aux);
		aux^.info := e;
		aux^.sig  := nil;
        
        if (lista=nil) then
			lista := aux
        else
			begin
			ptr := lista;
			while ptr^.sig <> nil do
				ptr := ptr^.sig;
			ptr^.sig := aux;
			end;
    end;
	
	procedure insertarR(var lista:TLista; const e:TElemento);
    begin
		if (lista=nil) then
			begin
			new(lista);
			lista^.info := e;
			lista^.sig  := nil;
			end
		else
			insertarR(lista^.sig, e);        	
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
        
        //verificamos si lo encontro
        if(aux <> nil) and (aux^.info = e)then
            begin
            
            //verificamos si esta al principio
            if (ant = nil)then
                lista := aux^.sig
            else
                ant^.sig := aux^.sig;	
            
            //    
            dispose(aux);
            end;
        
        
    end;

    procedure listar(lista:TLista);
    begin        
        while(lista <> nil) do
            begin
            writeln(lista^.info);
            lista := lista^.sig;
            end;
    end;
    
    procedure listarR(lista:TLista);
    begin        
        if (lista <> nil) then
			begin
			listarR(lista^.sig);
			writeln(lista^.info);
			end;
    end;
    
    procedure destruir(var lista:TLista);
    begin
    
    end;
end.
