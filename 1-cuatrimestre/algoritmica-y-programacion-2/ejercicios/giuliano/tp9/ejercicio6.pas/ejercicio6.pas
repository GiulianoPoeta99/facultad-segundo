{
    Dada una lista que contenga la siguiente información por nodo: 
    NOMBRE - EDAD - SEXO - SIG  
    Construir un procedimiento que cree dos listas, una por cada sexo.
}
program ejercicio6;
uses crt,UListaPersonas;

procedure cargarListaPersonas(var lista: TLista);
var
    elemento: TElemento;
    seguirCargando: char;
begin
    seguirCargando := 's';
    crear(lista);
    while (seguirCargando <> 's') do
    begin
        writeln('Ingrese nombre, edad y sexo(m/f): ');
        readln(elemento.nombre);
        readln(elemento.edad);
        readln(elemento.sexo);
        writeln('Quiere cargar otro? s/n');
        readln(seguirCargando);
    end;
end;

procedure cargarListaPorSexo(lista: TLista; var listaM, ListaF: TLista);
begin
    crear(listaM);
    crear(listaF);
    while (lista <> nil) do
    begin
        if (lista^.info.sexo = 'm') then 
        begin
            insertar(listaM, lista^.info);
        end
        else 
        begin
            insertar(listaF, lista^.info);
        end;
        lista := lista^.siguiente;
    end;
end;

var
    listaPersonas,listaHombres,listaMujeres: TLista;
begin
    cargarListaPersonas(listaPersonas);
    cargarListaPorSexo(listaPersonas,listaHombres,listaMujeres);
end.