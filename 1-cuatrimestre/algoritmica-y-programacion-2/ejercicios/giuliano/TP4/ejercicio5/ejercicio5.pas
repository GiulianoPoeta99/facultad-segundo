{
    Tres sucursales de una empresa generan, cada una, un archivo con la siguiente
    estructura: producto vendido, cantidad vendida. Dicho archivo es enviado a la casa
    central donde son procesados y se genera un archivo resumen donde por cada producto
    figura la cantidad vendida. Realizar dicho proceso sabiendo que el archivo de cada
    sucursal está ordenado por producto vendido.
}
program ejercicio5;
uses crt;

type
    TdatosEmpresas = record
        producto,cantidad: integer;
    end;

    TarchivoEmpresa = file of TdatosEmpresas;

procedure abrirCrearArchivo(var archivo: TarchivoEmpresa);
var
    ruta,nombre: string;
begin
    writeln('Ingrese el nombre del archivo: ');
    readln(nombre);
    ruta := './TP4/archivos/archivo5_' + nombre + '.dat';
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

procedure cargarXEntradas(var archivo: TarchivoEmpresa);
var
    i,entradas: integer;
    dato: TdatosEmpresas;
begin
    i := 1;
    entradas := 0;
    writeln('Cuantas entradas quiere ingresar?');
    readln(entradas);
    writeln('Ingrese valores hasta llegar a ',entradas,' entradas');
    writeln('Ingrese dato nro: ',i);
    while (i <= entradas) do begin
        writeln('Ingrese nro de producto: ');
        readln(dato.producto);
        writeln('ingrese cantidad vendido: ');
        readln(dato.cantidad);

        write(archivo,dato);
        clrscr;
        inc(i);
    end;
    writeln('se finalizo la carga');
end;

procedure leerArchivo(var archivo: TarchivoEmpresa);
var
    pos: TdatosEmpresas;
begin
    seek(archivo,0);
    writeln('Datos del archivo: ');
    while (not eof(archivo)) do begin
        read(archivo,pos);
        writeln;
        writeln('ID producto: ',pos.producto);
        writeln('Cantidad Vendida: ',pos.cantidad);
        writeln;
        writeln('===================================');
    end;
end;

function buscarProducto(id,largo: integer; var productos: array of TdatosEmpresas):integer;
var
    i,result: integer;
begin
    result := 0;
    for i:=1 to length(productos) do begin
        if (productos[i].producto = id) then begin
            result := result + productos[i].cantidad;
        end;
    end;
    buscarProducto := result;
end;

procedure mostraArray(datos: array of TdatosEmpresas);
var
    i: integer;
begin
    writeln('[');
    for i:=1 to length(datos)-1 do begin
        writeln(datos[i].producto,', ',datos[i].cantidad,';');
    end;
    writeln(']');
end;

procedure calcularResumen(var arch1,arch2,arch3,resumen: TarchivoEmpresa);
var
    datos1,datos2,datos3,arrResumen: array of TdatosEmpresas;
    n1,n2,n3,i,j,k: integer;
    duplicado: boolean;
begin
    seek(arch1, 0);
    n1 := 1;
    while (not eof(arch1)) do begin
        setlength(datos1, n1 + 1);
        read(arch1, datos1[n1]);
        inc(n1);
    end;

    seek(arch2, 0);
    n2 := 1;
    while (not eof(arch2)) do begin
        setlength(datos2, n2 + 1);
        read(arch2, datos2[n2]);
        inc(n2);
    end;

    seek(arch3, 0);
    n3 := 1;
    while (not eof(arch3)) do begin
        setlength(datos3, n3 + 1);
        read(arch3, datos3[n3]);
        inc(n3);
    end;

    setlength(arrResumen,(length(datos1) + length(datos2) + length(datos3)));

    // analizo los 3 arrays y los agrego a un cuarto que es el resumen
    k := 0;
    for i := 0 to length(datos1) - 1 do begin
        duplicado := False;
        for j := 0 to (k - 1) do begin
            if (datos1[i].producto = arrResumen[j].producto) then begin
                arrResumen[j].cantidad := arrResumen[j].cantidad + datos1[i].cantidad;
                duplicado := True;
                break;
            end;
        end;
        if (not duplicado) then begin
            arrResumen[k] := datos1[i];
            inc(k);
        end;
    end;

    for i := 0 to length(datos2) - 1 do begin
        duplicado := False;
        for j := 0 to (k - 1) do begin
            if (datos2[i].producto = arrResumen[j].producto) then begin
                arrResumen[j].cantidad := arrResumen[j].cantidad + datos2[i].cantidad;
                duplicado := True;
                Break;
            end;
        end;
        if (not duplicado) then begin
            arrResumen[k] := datos2[i];
            inc(k);
        end;
    end;

    for i := 0 to length(datos3) - 1 do begin
        duplicado := False;
        for j := 0 to (k - 1) do begin
            if (datos3[i].producto = arrResumen[j].producto) then begin
                arrResumen[j].cantidad := arrResumen[j].cantidad + datos3[i].cantidad;
                duplicado := True;
                Break;
            end;
        end;
        if (not duplicado) then begin
            arrResumen[k] := datos3[i];
            inc(k);
        end;
    end;

    SetLength(arrResumen, k);


    {for i:=1 to length(datos1)-1 do begin
        cantProdDat2 := buscarProducto(datos1[i].producto,length(datos2),datos2);
        cantProdDat3 := buscarProducto(datos1[i].producto,length(datos3),datos3);

        if (cantProdDat2 + cantProdDat3 > 0) then begin
            setlength(arrResumen,n4+1);
            arrResumen[n4].producto := datos1[i].producto;
            arrResumen[n4].cantidad := datos1[i].cantidad + cantProdDat2 + cantProdDat3;
            inc(n4);
        end;
    end;}

    {writeln('array1');
    writeln;
    mostraArray(datos1);
    writeln('array2');
    writeln;
    mostraArray(datos2);
    writeln('array3');
    writeln;
    mostraArray(datos3);}
    writeln('arrayResumen');
    writeln;
    mostraArray(arrResumen);

    for i:=1 to length(arrResumen)-1 do begin
        write(resumen,arrResumen[i]);
    end;

end;

var
    archEmpresa1,archEmpresa2,archEmpresa3,archResumen: TarchivoEmpresa;
    a: string;
begin
    writeln('Inicie archivo empresa 1: ');
    abrirCrearArchivo(archEmpresa1);
    writeln('Inicie archivo empresa 2: ');
    abrirCrearArchivo(archEmpresa2);
    writeln('Inicie archivo empresa 3: ');
    abrirCrearArchivo(archEmpresa3);
    
    writeln('Cargue los datos de la empresa 1: ');
    cargarXEntradas(archEmpresa1);
    writeln('Cargue los datos de la empresa 2: ');
    cargarXEntradas(archEmpresa2);
    writeln('Cargue los datos de la empresa 3: ');
    cargarXEntradas(archEmpresa3);

    writeln('Inicie archivo para el resumen: ');
    abrirCrearArchivo(archResumen);
    calcularResumen(archEmpresa1,archEmpresa2,archEmpresa3,archResumen);

    writeln('Mostrar archivo empresa 1 (presione enter...)');
    readln(a);
    leerArchivo(archEmpresa1);
    writeln('Mostrar archivo empresa 2 (presione enter...)');
    readln(a);
    leerArchivo(archEmpresa2);
    writeln('Mostrar archivo empresa 3 (presione enter...)');
    readln(a);
    leerArchivo(archEmpresa3);

    writeln('Mostrar archivo resumen (presione enter...)');
    readln(a);
    leerArchivo(archResumen);
    
end.