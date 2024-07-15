{
    Para los siguientes ejercicios utilizar los siguientes valores (no se requiere codificar):  

    620 - 735 - 66 - 47 - 87 - 90 – 126 - 140 - 145 - 153 - 177 - 285 - 393 - 395 – 467 y 566   

    a. Almacenar los valores en una tabla HASH con 20 posiciones usando el método del 
        resto  de  la  división  del  hashing  y  el  método  de  direccionamiento  cerrado  de 
        resolución de colisiones. 
    b. Almacenar  los  valores  en  una  tabla  HASH  con  20  posiciones.  Usar  CLAVE  MOD 
        TAMAÑO_TABLA  como  función  HASH  y  (CLAVE  +  3)  MOD  TAMAÑO_TABLA  como 
        función REHASH. Direccionamiento abierto. 
        NOTA: la función rehash se aplica a la dirección (o sea clave). 
    c. Almacenar los valores en una tabla HASH con 10 filas por 3 columnas, conteniendo 
        cada uno 3 valores.  Si una fila está llena, usar la siguiente (secuencial). 
        Direccionamiento abierto. 
}
program ejercicio1;
uses crt,UListaEnteros;

const 
    MAX = 20;

type
    TTablaHashAbierto = array[0..MAX] of TLista;
    TTablaHashCerrado = array[0..MAX] of integer;

function hashMod(clave: integer): integer;
begin
    hashMod := (clave mod MAX) + 1;
end;

function reHashMod(clave: integer): integer;
begin
    reHashMod := ((clave + 3) mod MAX) + 1;
end;

procedure inicializarTablaHash(var tabla:TTablaHashAbierto);
var
    i: integer;
begin
    for i:=1 to MAX do
    begin
        crear(tabla[i]);
    end;
end;

procedure insertarHashAbierto(var tabla: TTablaHashAbierto; claveHasheada, clave: integer);
begin
    insertar(tabla[claveHasheada],clave);
end;

procedure insertarHashCerrado(var tabla: TTablaHashCerrado; claveHasheada, clave: integer);
begin
    while (tabla[claveHasheada] <> 0) do
    begin
        claveHasheada := reHashMod(claveHasheada);
    end;
    tabla[claveHasheada] := clave;
end;

var
    tablaHashAbierta: TTablaHashAbierto;
    tablaHashCerrada: TTablaHashCerrado;
    clave: integer;
    claveHasheada: integer;
begin
    clave := 0;
    inicializarTablaHash(tablaHashAbierta);
    while (clave >= 0) do
    begin
        writeln('Ingrese estas claves: 620 - 735 - 66 - 47 - 87 - 90 - 126 - 140 - 145 - 153 - 177 - 285 - 393 - 395 - 467 y 566');
        readln(clave);
        claveHasheada := hashMod(clave);
        insertarHashAbierto(tablaHashAbierta,claveHasheada,clave);
        insertarHashCerrado(tablaHashCerrada,claveHasheada,clave);
    end;

end.