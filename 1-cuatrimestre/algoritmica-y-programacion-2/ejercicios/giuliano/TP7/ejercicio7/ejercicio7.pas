{
    7.- Se lee una sucesión de caracteres terminada en '.', conformada por una serie de palabras
    separadas por uno o más blancos. Se pide informar:
        a) Cantidad de palabras que comienzan con la letra 'L'.
        b) La palabra inversa de la palabra más larga.
        c) Cantidad de consonantes por palabra.
        d) Cantidad de palabras con longitud mayor que 10. 
}
program ejercicio7;
uses crt,UcolaCaracteres;

procedure cargarCola(cadena: UnicodeString; var cola: Tcola);
var
    i: integer;
begin
    for i:=1 to length(cadena) do begin
        meter(cola,cadena[i]);
    end;
end;

procedure analizarCadena(cola: Tcola);
var
    estaVacia: boolean;
    elemento,ultimoELemento: char;
begin
    estaVacia := vacia(cola);
    while (not estaVacia) do begin
        
    end;
end;

var
    cadena: UnicodeString;
    cola: TCola;
begin
    crear(cola);
    writeln('Ingrese un texto para analizar:');
    readln(cadena);
    while (cadena[lenght(cadena)] <> '.') do begin
        writeln('El texto debe finalizar con un punto vuelvalo a ingresar: ');
        readln(cadena);
    end;
    cargarCola(cadena,cola);
    analizarCadena(cola);
end.