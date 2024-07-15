{
    2- Dada la definición del ejercicio anterior se pide.
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
program ejercicio2;
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

procedure cargarXEntradas(var archivo: TipoArchivo);
var
    i,dato: integer;
begin
    i := 1;
    dato := 0;
    writeln('Ingrese valores hasta llegar a ',20,' entradas o ingrese -1 para finalizar.');
    writeln('Ingrese dato nro: ',i);
    while ((i <= 20) and (dato <> -1)) do begin
        readln(dato);
        if (dato = -1) then begin
            writeln('No se cargan mas');
        end else begin
            write(archivo,dato);
            inc(i);
            writeln('Ingrese dato nro: ',i);
        end;
    end;
    writeln('se finalizo la carga');
end;

procedure leerArchivo(var archivo: TipoArchivo);
var
    pos: integer;
begin
    seek(archivo,0);
    writeln('Datos del archivo: ');
    while (not eof(archivo)) do begin
        read(archivo,pos);
        write(pos,' ;');
    end;
end;

procedure buscarElemento(var archivo: TipoArchivo);
var
    pos,busqueda,encontrado,posEncontrado: integer;
begin
    seek(archivo,0);
    writeln;
    writeln('que elemento busca?');
    readln(busqueda);
    encontrado := -1;
    while (not eof(archivo)) do begin
        read(archivo,pos);
        if (pos = busqueda) then begin
            posEncontrado := filepos(archivo);
            encontrado := pos;
        end;
    end;

    if (encontrado = -1) then begin
        writeln('no se encontro el elemento');
    end else begin
        writeln('el elemento ',encontrado,' se encuentra en la pos ',posEncontrado);
    end;
end;

procedure buscarMayorElemento(var archivo: TipoArchivo);
var
    pos,mayor: integer;
begin
    seek(archivo,0);
    writeln;
    mayor := -1;
    while (not eof(archivo)) do begin
        read(archivo,pos);
        if (pos > mayor) then begin
            mayor := pos;
            seek(archivo,0);
        end;
    end;
    writeln('El mayor elemento es: ',mayor);
end;

procedure buscarPares(var archivo,archivoPar: TipoArchivo);
var
    pos: integer;
begin
    seek(archivo,0);
    writeln;
    while (not eof(archivo)) do begin
        read(archivo,pos);
        if ((pos mod 2) = 0) then begin
            write(archivoPar,pos);
        end;
    end;
end;

procedure cerrarArchivo(var archivo: TipoArchivo);
begin
    close(archivo)
end;

var
    Archi,archivoPares: TipoArchivo;
begin
    randomize;
    abrirCrearArchivo(Archi);
    cargarXEntradas(Archi);
    leerArchivo(Archi);
    buscarElemento(Archi);
    buscarMayorElemento(Archi);
    abrirCrearArchivo(archivoPares);
    buscarPares(Archi,archivoPares);
    leerArchivo(archivoPares);
    cerrarArchivo(Archi);
    cerrarArchivo(archivoPares);
end.