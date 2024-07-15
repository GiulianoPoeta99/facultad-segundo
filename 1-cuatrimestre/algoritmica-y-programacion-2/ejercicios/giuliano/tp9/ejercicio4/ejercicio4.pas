{
    Un polinomio de la forma: 
    
    A . Xn  + B . Xn-1    + ... + G 
    
    Se almacena en una lista encadenada, para lo que se van leyendo sucesivamente los pares 
    coeficiente-exponente ( (A,n) , (B,n-1) , .... , (G,0) ). 
    
    Cada elemento de la lista tiene los dos valores numéricos indicados y un puntero al 
    siguiente nodo: 
    
    a- Escribir un procedimiento que lea los datos de la forma indicada y los almacene en la 
    lista. 
    b- Escribir una función que devuelva el valor del polinomio guardado en la lista, para un 
    valor A para la indeterminada X (EVALUAPOLIN (PUNTERO , X) ).
}
program ejercicio4;
uses crt,UListaPolinomio,Math;

procedure crearListaPolinomio(var lista: TLista; grado: integer);
var
    elemento: TElemento;
    i: integer;
begin
    crear(lista);

    for i:=0 to grado do
    begin
        writeln('Ingrese el coeficiente para el exponente ', i);
        readln(elemento.coeficiente);
        elemento.exponente := i;
        insertarAdelante(lista,elemento);
    end;
end;

function calcularPolinomio(lista: TLista; valorX: integer): Extended;
begin
    calcularPolinomio := 0;
    while (lista <> nil) do 
    begin
        calcularPolinomio := calcularPolinomio + lista^.info.coeficiente * Power(valorX,lista^.info.exponente);
        lista := lista^.siguiente;
    end;
end;

var
    polinomio: TLista;
    grado, x: integer;
    resultado: Extended;
begin
    writeln('Ingrese el grado del polinomio: ');
    readln(grado);
    crearListaPolinomio(polinomio,grado);
    writeln('Ingrese el valor de x para evaluar el polinomio: ');
    readln(x);
    resultado := calcularPolinomio(polinomio,x);
    writeln('El valor del polinimio es: ', resultado);
end.