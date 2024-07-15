unit ULista;
interface
	Type
		Telemento = record
			Nombre: string;
			edad: byte;
			sexo: char;
		end;
		Tlista = ^Tnodo;
		Tnodo = record
			info: Telemento;
			sig: Tlista;
		end;
		
			
	procedure Iniciar (var L: Tlista);
	
	Procedure InsertarPorSexo(Var LH,LM: Tlista; e: Telemento);

	procedure Listar (L: Tlista);
		

implementation
procedure Iniciar (var L: Tlista);
		begin
			L:= Nil;
		end;
	
	Procedure InsertarPorSexo (Var LH,LM: Tlista; e: Telemento);
	var
		aux1,aux2: ^Tnodo;
	begin
		If (e.sexo = 'H') then
		begin
			if LH= nil then
				begin
					new(LH);
					LH^.info:= E;
					LH^.sig:= nil
				end
			else
				begin
					aux1:= LH;
					while(aux1^.sig<> nil) do
						aux1:= aux1^.sig;
					new(aux2);
					aux2^.info:= e;
					aux1^.sig:= aux2;
			
				end;
		end;
		If (e.sexo = 'M') then
		begin
			if LM= nil then
				begin
					new(LM);
					LM^.info:= E;
					LM^.sig:= nil
				end
			else
				begin
					aux1:= LM;
					while(aux1^.sig<> nil) do
						aux1:= aux1^.sig;
					new(aux2);
					aux2^.info:= e;
					aux1^.sig:= aux2;
			
				end;
		end;
	end;

	procedure Listar (L: Tlista);
	var
		contador: byte;
	begin
		contador:= 1;
		while (L <> nil) do
		begin
			writeln(Contador,':');
			writeln(L^.info.Nombre,', ',L^.info.Edad,', ',L^.info.Sexo);
			L:=L^.sig;
			contador:= Contador + 1;
		end;
	
	end;
	
begin
end.
