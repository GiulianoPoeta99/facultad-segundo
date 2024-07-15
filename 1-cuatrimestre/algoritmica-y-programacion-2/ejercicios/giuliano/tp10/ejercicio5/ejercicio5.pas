{
    Utilizando sólo operaciones de pila realizar un algoritmo que: 
    
    • Invierta una pila 
    • Dada una pila y un valor llamado LÍMITE, devuelva otras dos pilas, en una de las 
        cuales  se  han  introducido  los  valores  menores  que  el  LÍMITE,  y  en  la  otra  los 
        valores mayores o iguales al LÍMITE. (La pila inicial debe desaparecer liberando 
        la memoria que ocupaba) 
    • Cambie todos los elementos de la Pila iguales a X por Y, sin modificar el resto de 
        la Pila. 
    
    Nota:
    analice  para  cada  caso  la  conveniencia  de  una  implementación  estática  y  una 
    dinámica.
}
program ejercicio5;
uses crt, UPilaListaEnteros;

procedure cargarPilaNumeros(var pila: TPila);
var
    numero: TElemento;
    seguirCargando: char;
begin
    seguirCargando := 's';
    crear(pila);
    while (seguirCargando = 's') do 
    begin
        writeln('Ingrese un numero: ');
        readln(numero);
        meter(pila,numero);
        writeln('Quiere seguir cargando? s/n');
        readln(seguirCargando);
    end;
end;

procedure invertirPilaNumeros(var pila: TPila);
var
    pilaAux: TPila;
    numero: TElemento;
begin
    crear(pilaAux);
    write('[');
    while (not vacia(pila)) do 
    begin
        sacar(pila,numero);
        write(numero,', ');
        meter(pilaAux,numero);
    end;
    writeln(']');
    pila := pilaAux;
end;

procedure cambiarPilaXY(var pila: TPila; x,y: integer);
var
    pilaAux: TPila;
    numero: TElemento;
begin
    crear(pilaAux);
    while (not (vacia(pila))) do 
    begin
        sacar(pila,numero);
        if (numero = x) then 
        begin
            numero := y;
            meter(pilaAux,numero);
        end
        else
        begin
            meter(pilaAux,numero);
        end;
    end;
    invertirPilaNumeros(pilaAux);
    pila := pilaAux;
end;

procedure dividirPilaMayorMenor(var pila, pilaMayor, pilaMenor: TPila; limite: integer);
var
    numero: TElemento;
begin
    crear(pilaMayor);
    crear(pilaMenor);
    while (not (vacia(pila))) do 
    begin
        sacar(pila,numero);
        if (numero >= limite) then
        begin 
            meter(pilaMayor,numero);
        end
        else
        begin
            meter(pilaMenor,numero);
        end;
    end;
    dispose(pila);
    invertirPilaNumeros(pilaMayor);
    invertirPilaNumeros(pilaMenor);
end;

var
    pilaNumeros, pilaMayores, pilaMenores: TPila;
    limite, x, y: integer;
begin
    limite := 0;
    x := 0;
    y := 0;
    cargarPilaNumeros(pilaNumeros);
    // imprimir(pilaNumeros);
    invertirPilaNumeros(pilaNumeros);
    // writeln('La pila invertida es: ');
    // imprimir(pilaNumeros);
    writeln('Ingrese un valor x y luego un valor y para reemplazar x por y:');
    readln(x,y);
    cambiarPilaXY(pilaNumeros,x,y);
    // writeln('La pila reemplazando ', x, ' por ', y, ' es: ');
    // imprimir(pilaNumeros);
    writeln('Ingrese un valor limite para dividir la pila en mayores y menores:');
    readln(limite);
    dividirPilaMayorMenor(pilaNumeros,pilaMayores,pilaMenores,limite);
    // writeln('Las pilas separando por mayor y menor con ', limite, ' como limite es: ');
    // imprimir(pilaMayores);
    // imprimir(pilaMenores);
end.