unit ULista;
interface
	Type
		Telemento = record
			Nombre: string;
			DNI: Longint;
		end;
		Tlista = ^Tnodo;
		Tnodo = record
			info: Telemento;
			sig: Tlista;
		end;
		
			
	procedure IniciarLista (var L: Tlista);
	
	procedure insertarEnOrden(lista:TLista; e:TElemento);
	
	procedure insertarAdelante(var lista:TLista; e:TElemento);
	
	procedure insertar(var lista:TLista; e:TElemento);

	procedure Listar (L: Tlista);
		

implementation
procedure IniciarLista (var L: Tlista);
		begin
			L:= Nil;
		end;
	
procedure insertarEnOrden(lista:TLista; e:TElemento);
var aux:TLista;
begin
	new(aux);
	aux^.info := e;
	while (lista^.sig <> nil) and (lista^.sig^.info.nombre < e.nombre)do
		lista := lista^.sig;
	
	aux^.sig := lista^.sig;
	lista^.sig := aux;
end;


procedure insertarAdelante(var lista:TLista;
e:TElemento);
var aux:TLista;
begin
new(aux);
aux^.info := e;
aux^.sig := lista;
lista := aux;
end;

procedure insertar(var lista:TLista; e:TElemento);
begin
if (lista=nil) or (lista^.info.nombre > e.nombre) then
insertarAdelante(lista, e)
else
insertarEnOrden(lista, e);
end;



	procedure Listar (L: Tlista);
	var
		contador: byte;
	begin
		contador:= 1;
		while (L <> nil) do
		begin
			writeln(Contador,':');
			writeln(L^.info.Nombre,', ',L^.info.dni);
			L:=L^.sig;
			contador:= Contador + 1;
		end;
	
	end;
	
begin
end.
