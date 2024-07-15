{
    Realice un procedimiento ORDEN que reciba una LISTA y un parámetro ASCENDENTE que 
    vale verdadero si se quiere ordenar la lista ascendentemente y falso si se desea ordenar 
    descendentemente. Use una lista desordenada.
}
program ejercicio2;
uses crt,UListaOrdenadaEnteros;

procedure cargarListaAscDesc(var lista: TLista; esAscendente: boolean);
var
    elemento: TElemento;
    seguirCargando: char;
begin
    seguirCargando := 's';
    while (seguirCargando = 's') do
    begin
        writeln('Ingrese un numero:');
        readln(elemento);
        if (esAscendente) then 
        begin
            writeln('es ascendente');
            insertarAscendente(lista,elemento);
        end
        else
        begin
            writeln('es descendente');
            insertarDescendente(lista,elemento);
        end;
        writeln('Quiere seguir cargando? s/n');
        readln(seguirCargando);
    end;
end;

var
    lista: TLista;
    esAscendente: char;
    tipo: boolean;
begin
    crear(lista);
    writeln('Es ascendente? s/n');
    readln(esAscendente);
    if (esAscendente = 's') then
    begin
        tipo := true;
    end
    else
    begin
        tipo := false;
    end;
    cargarListaAscDesc(lista,tipo);
    listar(lista);
end.