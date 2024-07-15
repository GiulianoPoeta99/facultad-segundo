Program tp4_Ej2_2do;

Type
TArchivo = file of Integer;
TipoPosicion = 0 .. MaxInt; {Representa el máximo integer}


{Programa Principal}
Var
Arch : TipoArchivo;
Ruta: String;
Begin
Randomize;

	Ruta:= 'E:\ArchivoMisterioso.dat';  {Direccion  E:\}
	AbrirCrearArchivo(Arch,Ruta);
	
	{Cargar_Archivos(Arch);}
    PermitirCargarArchivos(Arch);

	ListarContenido(Arch);

    BuscarArchivo(Arch);
	
	close(Arch);
end.