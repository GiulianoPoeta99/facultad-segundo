Program tp4_ej1;
uses crt;

Type
TipoArchivo = file of Integer;
TipoPosicion = 0 .. MaxInt; // representa el máximo integer


{Funcion para verificar si existe el archivo}
Function abrirArchivo(var Arch: TipoArchivo; ruta: String):Boolean;
Begin
 
	{$I-}
		Assign(Arch, ruta);
		Reset(Arch);
	{$I+}

	abrirArchivo:= (IoResult=0);
	If not(abrirArchivo) then rewrite(Arch);
	
	Writeln('Archivo abierto');
end;

Procedure Cargar_Archivos(var Arch: TipoArchivo);
var i: Integer;
Begin
seek(arch, 0);
Writeln('Agrego los numeros: ');
For i:= 1 to 20 do
	Write(Arch, random(100));
End;

Procedure ListarContenido(var Arch: TipoArchivo);
var i, num: Integer;
Begin
Seek(Arch, 0);
For i:= 1 to 20 do 
	Begin
	Read(Arch, num);
	Write(num,' ');
	End;
End;

Var
Arch : TipoArchivo;
//Posicion : TipoPosicion;
Ruta: String;
Begin
Randomize;
	Ruta:= 'E:\Gatomagico.dat';  {Direccion  E:\}
	abrirArchivo(Arch,Ruta);
	
	Cargar_Archivos(Arch);

	ListarContenido(Arch);
	
	close(Arch);
end.
