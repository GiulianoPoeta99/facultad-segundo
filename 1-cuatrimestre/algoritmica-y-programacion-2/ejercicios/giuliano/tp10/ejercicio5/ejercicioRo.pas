program ej5;
uses crt,UPilaListaEnteros;  

procedure cargarPila (var pila:TPila);
var 
    numero: TElemento;
    i: integer;
begin
    for i:= 1 to 6 do 
    begin
        writeln('ingrese un numero  ');
        readln(numero); 
        meter(pila, numero);
    end;
end;

procedure invertirPila (var pila: TPila);
var
    pilaAux: TPila; 
    num: TElemento;
begin
    crear(pilaAux);
    write('[ ');
    while (not vacia(pila)) do 
    begin
        sacar(pila,num);
        write(num,', ');
        meter(pilaAux,num);
    end;
    write(']');
    writeln; 
    writeln;
    pila:= pilaAux; 
end;

procedure cambiarXporY (var pila: TPila; x,y: integer);
var
    pilaAux: TPila;
    num: TElemento;
begin
    crear(pilaAux);
    while (not vacia(pila)) do
    begin
        sacar(pila,num);
        if (num = x) then 
        begin
            num:= y;
            meter(pilaAux,num);
        end
        else 
            meter(pilaAux,num);
    end;
    pila:= pilaAux;
    writeln('Los elementos de la pila cambiando',x,'por ',y, 'son: ');
    invertirPila(pila);
end;

procedure separar (var pila, pilaMenor,pilaMayorIgual: TPila; limite: integer);
var
    num: TElemento; 
begin
    while (not vacia(pila)) do 
    begin
        sacar(pila,num);
        if (num >= limite) then 
            meter(pilaMayorIgual,num)
        else 
            meter(pilaMenor,num); 
    end;
    writeln('La pila con elementos mayores o iguales al limite ',limite,'son: ');
    imprimir(pilaMayorIgual);
    writeln('La pila con elementos menores al limite ',limite,'son: ');
    imprimir(pilaMenor);
end;


var 
    pila,pilaMenor,pilaMayorIgual : TPila;
    limite,x,y: integer;

BEGIN 
    crear(pila); 
    crear(pilaMenor); 
    crear(pilaMayorIgual); 
    cargarPila(pila);
    writeln('Ingrese el valor de x y luego el valor de y para intercambiar x por y');
    readln(x,y);
    cambiarXporY(pila,x,y);
    writeln('Los elementos de la pila invertidos son: ');
    invertirPila(pila);
    writeln('Ingrese el valor del limite para separar las pilas');
    readln(limite);
    separar(pila,pilaMenor,pilaMayorIgual,limite); 
    dispose(pila); 
END.