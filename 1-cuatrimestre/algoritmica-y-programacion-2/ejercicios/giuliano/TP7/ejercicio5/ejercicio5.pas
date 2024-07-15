{
    5.- Escribir un programa que lea una cadena de caracteres, metiendo cada carácter en una pila
    y en una cola simultáneamente. Cuando se encuentra el final de la cadena, use las operaciones
    básicas de pilas y colas para determinar el grado de palíndroma de la cadena ( 1 , si el primer
    carácter es igual al último , 2 si el primer carácter es igual al último y el segundo carácter es
    igual al anteúltimo , 3 si los tres primeros son iguales a los tres últimos invertidos, etc.) . Se
    imprime un mensaje si la palindromía es total.
}
program ejercicio5;
uses crt,UpilaCaracteres,UcolaCaracteres;

procedure cargarPilaCola(cadena: string; var pila:Tpila; var cola:Tcola);
var
    i: integer;
begin
    writeln('Cargando pila y cola...');
    for i:=1 to length(cadena) do begin
        UcolaCaracteres.meter(cola,cadena[i]);
        UpilaCaracteres.meter(pila,cadena[i]);
    end;
end;

procedure verificarPalindromo(cola: Tcola; pila: Tpila);
var
    colaVacia,pilaVacia: boolean;
    elementoCola,elementoPila: char;
    esPalindromo: boolean;
begin
    esPalindromo := True;
    colaVacia := UcolaCaracteres.vacia(cola);
    pilaVacia := UpilaCaracteres.vacia(pila);

    writeln('Comparando elemento de la pila y la cola...');
    while ((not colaVacia) and (not pilaVacia)) do begin
        UcolaCaracteres.sacar(cola,elementoCola);
        UpilaCaracteres.sacar(pila,elementoPila);

        if (elementoCola <> elementoPila) then begin
            esPalindromo := False;
        end;
        colaVacia := UcolaCaracteres.vacia(cola);
        pilaVacia := UpilaCaracteres.vacia(pila);
    end;

    if (esPalindromo) then begin
        writeln('La palabra es un palindromo.');
    end else begin
        writeln('La palabra no es un palindromo.');
    end;
end;

var
    cadena:string;
    cola: Tcola;
    pila: Tpila;
begin
    UpilaCaracteres.crear(pila);
    UcolaCaracteres.crear(cola);
    writeln('Ingrese una cadena para analizar si es un palindromo');
    readln(cadena);
    cargarPilaCola(cadena,pila,cola);
    verificarPalindromo(cola,pila);
end.