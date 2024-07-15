{
    Utilizando direccionamiento abierto, resuelva los puntos a y b del ejercicio anterior. 
}
program ejercicio3;
uses crt;

const
    MAX = 1000;

type
    TTablaHashCerrado = array[0..MAX] of longint;

function hashMod(clave: longint): integer;
begin
    clave := clave mod 1000;
    hashMod := (clave mod MAX) + 1;
end;

function reHashMod(clave: integer): integer;
begin
    reHashMod := ((clave + 3) mod MAX) + 1;
end;

procedure insertarHashCerrado(var tabla: TTablaHashCerrado; claveHasheada, clave: integer);
begin
    while (tabla[claveHasheada] <> 0) do
    begin
        claveHasheada := reHashMod(claveHasheada);
    end;
    tabla[claveHasheada] := clave;
end;

procedure contarSinonimos(tabla: TTablaHashCerrado; clave: integer);
var
    claveHasheada, contador: integer;
begin
    contador := 0;
    claveHasheada := hashMod(clave);

    // TODO:
    // magia para contar hash cerrado

    writeln('La cantidad de sinonimos es: ',contador);
end;

var
    tablaHashCerrada: TTablaHashCerrado;
    clave,dniBuscado: longint;
    claveHasheada: integer;
    seguirCargando: char;
begin
    seguirCargando := 's';
    clave := 0;
    while (seguirCargando = 's') do
    begin
        writeln('Ingrese el numero de documento del nuevo socio:');
        readln(clave);
        claveHasheada := hashMod(clave);
        insertarHashCerrado(tablaHashCerrada,claveHasheada,clave);
        writeln('Seguir cargando? s/n');
        readln(seguirCargando);
    end;
    writeln('Ingrese un dni para contar sus sinonimos: ');
    readln(dniBuscado);
    contarSinonimos(tablaHashCerrada,dniBuscado);
end.