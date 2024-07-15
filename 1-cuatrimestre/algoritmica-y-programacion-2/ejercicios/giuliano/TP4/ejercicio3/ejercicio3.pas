{
    3- Generar un archivo con los datos personales de los clientes de un comercio. Estos datos
    son: Nombre, Dirección, Teléfono, Tope de Crédito.
        a) Realizar un subprograma que reciba el archivo generado e imprima su contenido.
        b) Actualizar el archivo anteriormente generado aumentando en un 20 % el tope de
        crédito.
}
program ejercicio3;
uses crt;

type
    Tdatos = record
        nombre,direccion,telefono: string;
        TopeCredito: integer;
    end;

    Tarchivo = file of Tdatos;

procedure abrirCrearArchivo(var archivo: Tarchivo);
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
        writeln('Se borrara y se creara de nuevo');
        rewrite(archivo);
    end else begin
        writeln('No encontro el archivo');
        rewrite(archivo)
    end;
end;

procedure cargarXEntradas(var archivo: Tarchivo);
var
    i,entradas: integer;
    dato: Tdatos;
begin
    i := 1;
    entradas := 0;
    writeln('Cuantas entradas quiere ingresar?');
    readln(entradas);
    writeln('Ingrese valores hasta llegar a ',entradas,' entradas');
    writeln('Ingrese dato nro: ',i);
    while (i <= entradas) do begin
        writeln('ingrese nombre completo: ');
        readln(dato.nombre);
        writeln('Ingrese la direccion: ');
        readln(dato.direccion);
        writeln('ingrese el numero de telefono: ');
        readln(dato.telefono);
        writeln('Ingrese el tope de credito: ');
        readln(dato.TopeCredito);
        write(archivo,dato);
        clrscr;
        inc(i);
    end;
    writeln('se finalizo la carga');
end;

procedure leerArchivo(var archivo: Tarchivo);
var
    pos: Tdatos;
begin
    seek(archivo,0);
    writeln('Datos del archivo: ');
    while (not eof(archivo)) do begin
        read(archivo,pos);
        writeln;
        writeln('Nombre: ',pos.nombre);
        writeln('Direccion: ',pos.direccion);
        writeln('Telefono: ',pos.telefono);
        writeln('Tope de credito: ',pos.TopeCredito);
        writeln;
        writeln('===================================');
    end;
end;

procedure actualizarTope(var archivo: Tarchivo);
var
    dato: Tdatos;
begin
    seek(archivo,0);
    while (not eof(archivo)) do begin
        read(archivo,dato);
        dato.TopeCredito := round(dato.TopeCredito * 1.2); // aumentar el tope de crédito en un 20%
        seek(archivo, filepos(archivo)-1);
        write(archivo,dato);
    end;
    writeln('Tope de credito actualizado en un 20%');
end;

procedure cerrarArchivo(var archivo: Tarchivo);
begin
    close(archivo)
end;

var
    archivo: Tarchivo;
begin
    abrirCrearArchivo(archivo);
    cargarXEntradas(archivo);
    leerArchivo(archivo);
    actualizarTope(archivo);
    leerArchivo(archivo);
    cerrarArchivo(archivo);
end.