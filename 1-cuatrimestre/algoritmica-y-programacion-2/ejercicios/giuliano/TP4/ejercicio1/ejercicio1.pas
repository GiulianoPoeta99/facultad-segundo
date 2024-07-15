{
    1- De acuerdo a la siguiente declaración de tipos:
    Type
        TipoArchivo = file of Integer;
        TipoPosicion = 0 .. MaxInt; // representa el máximo integer
    Var
        Archi : TipoArchivo;
        Posicion : TipoPosicion;

    Crear subprogramas para:
        a) Verificar la existencia del archivo, si existe abrirlo y sino crearlo.
        b) Cargar el archivo con 20 entradas de números enteros.
        c) Listar el contenido del archivo
}
program ejercicio1;
uses crt;

Type
    TipoArchivo = file of Integer;

procedure abrirCrearArchivo(var archivo: TipoArchivo);
var
    ruta,nombre: string;
begin
    writeln('Ingrese el nombre y formato del archivo: ');
    readln(nombre);
    ruta := './TP4/archivos/' + nombre;
    {$I-}
        assign(archivo,ruta);
        Reset(archivo);
    {$I+}
    if (IoResult = 0) then begin
        writeln('Encontro el archivo');
    end else begin
        writeln('No encontro el archivo');
        rewrite(archivo)
    end;
end;

procedure cargar20Entradas(var archivo: TipoArchivo);
var
    i,dato: integer;
begin
    for i:=1 to 20 do begin
        writeln('Ingrese dato nro: ',i);
        readln(dato);
        write(archivo,dato);
    end;
    writeln('no se cargan mas datos');
end;

procedure leerArchivo(var archivo: TipoArchivo);
var
    pos: integer;
begin
    reset(archivo); //tambien en ves de abrirlo otra ves, puedo usar seek
    writeln;
    writeln('Datos del archivo: ');
    while not eof(archivo) do begin
        read(archivo,pos);
        write(pos,' ;');
    end;
end;

procedure cerrarArchivo(var archivo: TipoArchivo);
begin
    close(archivo)
end;

var
    Archi : TipoArchivo;
begin
    abrirCrearArchivo(Archi);
    cargar20Entradas(Archi);
    leerArchivo(Archi);
    cerrarArchivo(Archi);
end.