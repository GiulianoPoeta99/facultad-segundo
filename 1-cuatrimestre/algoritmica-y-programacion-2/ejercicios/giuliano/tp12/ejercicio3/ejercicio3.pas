{
    En una biblioteca, los socios son almacenados usando como función de Hashing la que 
    devuelve las tres últimas cifras del nro. de documento y como estrategia para tratar las 
    colisiones direccionamiento cerrado. Asuma que la cantidad de socios no puede superar 
    los 1000. 
    
    a) Declare la estructura de datos que permitirá realizar el armado y posterior 
    utilización. 
    b) Genere una función para almacenar un nuevo socio.  
    c) Genere un subprograma que permita imprimir la cantidad de sinónimos que tiene 
    un determinado socio. 
    d) Genere un subprograma que permita imprimir por orden alfabético esos sinónimos.
}
program ejercicio3;
uses crt,UListaEnteros;

const
    MAX = 1000;

type
    TTablaHashAbierto = array[0..MAX] of TLista;

function hashMod(clave: longint): integer;
begin
    clave := clave mod 1000;
    hashMod := (clave mod MAX) + 1;
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

procedure insertarHashAbierto(var tabla: TTablaHashAbierto; claveHasheada: integer; clave: longint);
begin
    insertar(tabla[claveHasheada],clave);
end;

procedure contarSinonimos(tabla: TTablaHashAbierto; clave: integer);
var
    claveHasheada, contador: integer;
    copia: TLista;
begin
    contador := 0;
    claveHasheada := hashMod(clave);
    if (not (vacia(tabla[claveHasheada]))) then
    begin
        copia := tabla[claveHasheada];
        while (not (vacia(copia))) do
        begin
            inc(contador);
            copia :=  copia^.siguiente;
        end;
    end;
    writeln('La cantidad de sinonimos es: ',contador);
end;

// falto hacer el c porque no vi la cnsigna y me da paja cambiar el tda jeje
var
    tablaHashAbierta: TTablaHashAbierto;
    clave,dniBuscado: longint;
    claveHasheada: integer;
    seguirCargando: char;
begin
    seguirCargando := 's';
    clave := 0;
    inicializarTablaHash(tablaHashAbierta);
    while (seguirCargando = 's') do
    begin
        writeln('Ingrese el numero de documento del nuevo socio:');
        readln(clave);
        claveHasheada := hashMod(clave);
        insertarHashAbierto(tablaHashAbierta,claveHasheada,clave);
        writeln('Seguir cargando? s/n');
        readln(seguirCargando);
    end;
    writeln('Ingrese un dni para contar sus sinonimos: ');
    readln(dniBuscado);
    contarSinonimos(tablaHashAbierta,dniBuscado);
end.