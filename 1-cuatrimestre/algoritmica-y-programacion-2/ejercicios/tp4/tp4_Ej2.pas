{
    Dada la definición del ejercicio anterior se pide.
    a) Permitir la carga de números, puede utilizar un valor específico para terminar.
    b) Listar los elementos del archivo.
    c) Buscar un elemento en el archivo e indicar que posición que ocupa dentro del
    mismo o -1 en caso de no estar.
    1. suponiendo un archivo desordenado.
    2. suponiendo el archivo ordenado en forma creciente. En ambos casos se
    considera que no hay registros repetidos dentro del archivo.
    d) Localizar el elemento de mayor valor dentro del archivo (los elementos no están
    ordenados) e imprimirlo junto con la posición que ocupa.
    e) Generar otro archivo, ArchiPares, con los elementos pares de Archi.
}
Program tp4_Ej2;

Type
TipoArchivo = file of Integer;
TipoPosicion = 0 .. MaxInt; // representa el máximo integer


{Funcion para verificar si existe el archivo}
Function AbrirCrearArchivo(var Arch: TipoArchivo; ruta: String):Boolean;
Begin
 
	{$I-}
		Assign(Arch, ruta);
        Reset(Arch);
	{$I+}

	AbrirCrearArchivo:= (IoResult=0);
	If not(AbrirCrearArchivo) then rewrite(Arch);
	
	Writeln('Archivo abierto');
end;

{
    Procedure Cargar_Archivos(var Arch: TipoArchivo);
    var i: Integer;
    Begin
    seek(arch, 0);
    Writeln('Agrego los numeros: ');
    For i:= 1 to 20 do
        Write(Arch, random(100));
    End;
}

Procedure ListarContenido(var Arch: TipoArchivo);
var i, num,valor: Integer;
Begin
    seek(arch, 0);
    Valor:= filesize(arch);
    For i:= 1 to valor do 
        Begin
        Read(Arch, num);
        Write(num,' ');
        End;
End;

Procedure PermitirCargarArchivos(var Arch: TipoArchivo);
var valor: Integer; 
Begin
    valor:=1;
    Rewrite(Arch);
    Writeln('Ingrese numeros("00" para terminar): ');
    
    readln(valor);
    While (valor > 0) do
    begin
        write(arch, Valor);
        readln(valor);
    end;
End;

Procedure BuscarArchivo(var Arch:TipoArchivo);
var numero,elemento, posicion :Integer;
Begin
Writeln('Ingrese que elemento quiere buscar: ');
Readln(elemento);
Seek(arch, 0);
read(arch, numero);
While (elemento <> numero) and not(Eof(Arch)) do
        Begin
        read(arch, numero);
        end;
    if elemento <> numero then Writeln('Elemento No encontrado')
    else
    Begin
    posicion:= filepos(Arch)-1;
    Writeln('archivo encontrado, pos: ', posicion);
    end;
end;

Var
Arch : TipoArchivo;
//Posicion : TipoPosicion;
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