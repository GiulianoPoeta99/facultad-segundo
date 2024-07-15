{
    Realice un procedimiento iterativo y uno recursivo que devuelva el resultado de la suma de una lista de enteros. 
}
program ejercicio1;
uses crt, UListaEnteros;

procedure cargarListaEnteros(var lista: TLista);
var
    seguirCargando: char;
    numero: TElemento;
begin
    seguirCargando := 's';
    crear(lista);
    while (seguirCargando = 's') do 
    begin
        writeln('Ingrese un numero: ');
        readln(numero);
        insertar(lista,numero);
        writeln('Quiere ingresar otro?  s/n');
        readln(seguirCargando);
    end;
    writeln('isto');
end;

function sumarIterativo(lista: TLista): integer;
var
    suma: integer;
begin
    suma := 0;
    while (lista <> nil) do
    begin
        suma := suma + lista^.info;
        lista := lista^.siguiente;
    end;
    sumarIterativo := suma;
end;

function sumarRecursivo(lista: TLista): integer;
begin
    if (lista = nil) then 
    begin
        sumarRecursivo := 0;
    end
    else 
    begin
        sumarRecursivo := lista^.info + sumarRecursivo(lista^.siguiente);
        writeln(sumarRecursivo);
    end;
end;

var
    lista: TLista;
    sumaIterativa, sumaRecursiva: integer;
begin
    cargarListaEnteros(lista);
    sumaIterativa := sumarIterativo(lista); 
    sumaRecursiva := sumarRecursivo(lista);
    writeln('El reultado de la suma iterativa es: ', sumaIterativa);
    writeln('El reultado de la suma recursiva es: ', sumaRecursiva);
end.