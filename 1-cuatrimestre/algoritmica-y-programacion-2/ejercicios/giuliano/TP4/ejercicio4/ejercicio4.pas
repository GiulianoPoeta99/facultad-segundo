{
    4- Realizar un subprograma que actualice el archivo de clientes en función de los
    movimientos.
        El archivo de cliente contiene el código de cliente, nombre y saldo.
        El archivo de movimientos contiene el código de cliente, tipo de operación
        (1: crédito,2: débito) y monto de la operación.
    Actualice el archivo de clientes teniendo en cuenta los movimientos que se han producido
    Precondiciones:
        ▪ los archivos, en todos los casos se encuentran ordenados por el código de cliente.
        ▪ los clientes del archivo de movimientos existen en el de clientes.
}
program ejercicio3;
uses crt;

type
    Tdatos = record
        nombre,direccion,telefono: string;
        TopeCredito,nroCliente,saldo: integer;
    end;

    Tmovimientos = record 
        nroCliente,tipoOperacion,monto: integer;
    end;

    TarchivoCliente = file of Tdatos;
    TarchivoMovimientos =  file of Tmovimientos;
    

procedure abrirCrearArchivoClientes(var archivo: TarchivoCliente);
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

procedure abrirCrearArchivoMovimientos(var archivo: TarchivoMovimientos);
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

procedure cargarXEntradasClientes(var archivo: TarchivoCliente);
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
        writeln('Ingrese nro de cliente: ');
        readln(dato.nroCliente);
        writeln('ingrese nombre completo: ');
        readln(dato.nombre);
        writeln('Ingrese la direccion: ');
        readln(dato.direccion);
        writeln('ingrese el numero de telefono: ');
        readln(dato.telefono);
        writeln('Ingrese el tope de credito: ');
        readln(dato.TopeCredito);
        writeln('ingrese saldo inicial: ');
        readln(dato.saldo);

        write(archivo,dato);
        clrscr;
        inc(i);
    end;
    writeln('se finalizo la carga');
end;

procedure leerArchivoCliente(var archivo: TarchivoCliente);
var
    pos: Tdatos;
begin
    seek(archivo,0);
    writeln('Datos del archivo: ');
    while (not eof(archivo)) do begin
        read(archivo,pos);
        writeln;
        writeln('Nro Cliente: ',pos.nroCliente);
        writeln('Nombre: ',pos.nombre);
        writeln('Direccion: ',pos.direccion);
        writeln('Telefono: ',pos.telefono);
        writeln('Tope de credito: ',pos.TopeCredito);
        writeln('Saldo actual: ',pos.saldo);
        writeln;
        writeln('===================================');
    end;
end;

procedure leerArchivoMovimiento(var archivo: TarchivoMovimientos);
var
    pos: Tmovimientos;
begin
    seek(archivo,0);
    writeln('Datos del archivo: ');
    while (not eof(archivo)) do begin
        read(archivo,pos);
        writeln;
        writeln('Nro Cliente: ',pos.nroCliente);
        writeln('Operacion: ',pos.tipoOperacion);
        writeln('Direccion: ',pos.monto);
        writeln;
        writeln('===================================');
    end;
end;

procedure ordenarArchivoNroCliente(var archivo: TarchivoCliente);
var
    datos: array of Tdatos;
    i, j, n: integer;
    temp: Tdatos;
begin
    seek(archivo, 0);
    n := 0;
    while (not eof(archivo)) do begin
        setlength(datos, n + 1);
        read(archivo, datos[n]);
        inc(n);
    end;

    // ordenamiento burbuja
    for i := n - 1 downto 1 do begin
        for j := 0 to i - 1 do begin
            if datos[j].nroCliente > datos[j + 1].nroCliente then begin
                temp := datos[j];
                datos[j] := datos[j + 1];
                datos[j + 1] := temp;
            end;
        end;
    end;

    seek(archivo, 0);
    for i := 0 to n - 1 do begin
        write(archivo, datos[i]);
    end;
end;

procedure actualizarTope(var archivo: TarchivoCliente);
var
    dato: Tdatos;
begin
    seek(archivo,0);
    while (not eof(archivo)) do begin
        read(archivo,dato);
        dato.TopeCredito := round(dato.TopeCredito * 1.2); 
        seek(archivo, filepos(archivo)-1);
        write(archivo,dato);
    end;
end;

procedure actualizarSaldo(var archivo: TarchivoCliente; cliente,saldo: integer);
var
    datos: array of Tdatos;
    i,n: integer;
begin
    setlength(datos,0);
    seek(archivo, 0);
    n := 0;
    while (not eof(archivo)) do begin
        setlength(datos, n + 1);
        writeln(length(datos));
        read(archivo, datos[n]);
        inc(n);
    end;

    seek(archivo,0);
    for i:=1 to length(datos) do begin
        if (cliente = datos[i].nroCliente) then begin
            datos[i].saldo := datos[i].saldo + saldo;
            write(archivo,datos[i]);
        end;
        write(archivo,datos[i]);
    end;
end;

procedure cargarDatoMovimiento(var archivo: TarchivoMovimientos; monto,operacion,cliente: integer);
var
    dato: Tmovimientos;
begin
    dato.nroCliente := cliente;
    dato.tipoOperacion := operacion;
    dato.monto := monto;
    write(archivo,dato);
end;

procedure regitrarOperacion(var archClientes: TarchivoCliente; var archMovimientos: TarchivoMovimientos);
var
    datos: array of Tdatos;
    i,n,operacion,monto,cliente: integer;
    valido: boolean;
begin
    valido:=False;
    writeln('que operacion quiere relizar? ');
    writeln('  * 1: credito (+)');
    writeln('  * 2: debito (-)');
    readln(operacion);
    while ((operacion <> 1) and (operacion <> 2)) do begin
        writeln('ingrese un valor valido');
        readln(operacion);
    
    end;
    writeln('Ingrese un monto: ');
    readln(monto);
    if (operacion = 2) then begin
        monto := monto * -1;
    end;

    setlength(datos,0);
    seek(archClientes, 0);
    n := 0;
    while (not eof(archClientes)) do begin
        setlength(datos, n + 1);
        writeln(length(datos));
        read(archClientes, datos[n]);
        inc(n);
    end;

    writeln('Ingrese un numero de cliente: ');
    readln(cliente);
    for i:=1 to length(datos) do begin
        if (cliente = datos[i].nroCliente) then begin
            valido := True;
        end;
    end;
    while (valido <> True) do begin
        writeln('Ingrese un nro de cliente valido: ');
        for i:=1 to length(datos) do begin
            if (cliente = datos[i].nroCliente) then begin
                valido := True;
            end;
        end;
    end;
    
    cargarDatoMovimiento(archMovimientos,monto,operacion,cliente);
    actualizarSaldo(archClientes,cliente,monto);
end;

var
    archivoCliente: TarchivoCliente;
    archivoMovimientos: TarchivoMovimientos;
    a:string;
    operacion: integer;
begin
    operacion := 0;
    abrirCrearArchivoClientes(archivoCliente);
    cargarXEntradasClientes(archivoCliente);
    leerArchivoCliente(archivoCliente);
    readln(a);
    actualizarTope(archivoCliente);
    leerArchivoCliente(archivoCliente);
    readln(a);
    ordenarArchivoNroCliente(archivoCliente);
    leerArchivoCliente(archivoCliente);
    readln(a);
    clrscr;
    abrirCrearArchivoMovimientos(archivoMovimientos);

    writeln('tiene que registrar al menos una operacion: ');
    regitrarOperacion(archivoCliente,archivoMovimientos);

    while (operacion <> 2) do begin
        writeln('Quiere registrar otra operacion? (1: si, 2: no)');
        readln(operacion);
        if (operacion = 1) then begin
            regitrarOperacion(archivoCliente,archivoMovimientos);
        end;
    end;
    
    writeln('Ultima lectura de archivo de clientes: ');
    leerArchivoCliente(archivoCliente);
    writeln('Presione enter para ver archivo de movimientos...');
    readln(a);
    leerArchivoMovimiento(archivoMovimientos);
    close(archivoCliente);
    close(archivoMovimientos);
end.