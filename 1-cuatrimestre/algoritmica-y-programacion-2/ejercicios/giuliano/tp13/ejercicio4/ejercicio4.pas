{
    Un árbol binario de búsqueda contiene información sobre una clase. Está ordenada por el 
    promedio (PROM) y se quiere imprimir una lista con los promedios desde el mayor al más 
    bajo, para mostrar la situación de la clase.  
    Escribir un procedimiento para imprimir el promedio y nombre del estudiante SIN 
    MODIFICAR EL ÁRBOL NI REORDENAR SUS DATOS.
}
program ejercicio4;
uses crt, UArbolClases, UColaListaArbolClases;

procedure cargarArbol(var arbol: TArbol);
var
    elemento: TElemento;
    seguirCargando: char;
begin
    seguirCargando := 's';
    while (seguirCargando = 's') do
    begin
        writeln('Apellido y nombre: ');
        readln(elemento.nombre); 
        writeln('Ingrese el numero de ID');
        readln(elemento.id);
        writeln('Ingrese el sexo del estudiante');
        readln(elemento.sexo);
        writeln('Ingrese el promedio'); 
        readln(elemento.prom);
        meterArbol(arbol,elemento);
        writeln('Seguir cargando? s/n');
        readln(seguirCargando);
    end;
end;

var
    arbol: TArbol;
begin
    crearArbol(arbol);
    cargarArbol(arbol);
    listarEnOrden(arbol)
end.