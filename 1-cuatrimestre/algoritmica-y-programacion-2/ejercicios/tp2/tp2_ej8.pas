program tp2_ej8;

type
  Letras = set of Char; // definimos un tipo para representar conjuntos de letras

procedure MostrarSet(FraseDada: Letras);
var
  c: char;
begin
  for c in FraseDada do
    Write(c, ' ');
  WriteLn;
end;

Procedure ObtenerVocalesConsonantes(texto:String; var vocales, consonantes:Letras);
 Var
 i: integer; c : char; vocalesUsables:Letras;
 Begin
	vocalesUsables:= ['a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U'];
   for i := 1 to length(texto) do
	begin
    c := texto[i];
    // si es una letra y no está en el conjunto de vocales, la agregamos al conjunto de consonantes
    if (c in ['a'..'z', 'A'..'Z']) and not (c in vocalesUsables) then
      consonantes := consonantes + [c]
    // si es una letra y está en el conjunto de vocales, la agregamos al conjunto de vocales
    else if (c in vocalesUsables) then
      vocales := vocales + [c];
	end;
end;

var
  texto: String;
  vocales, consonantes: Letras;

begin
  // inicializamos los conjuntos de vocales y consonantes
  vocales := [];
  consonantes := [];
  
  // pedimos al usuario que ingrese una línea de texto
  writeln('Ingrese una linea de texto:');
  readln(texto);
  
  //Obtenemos los grupos vocales y consonantes en un procedimiento.
  ObtenerVocalesConsonantes(texto, vocales, consonantes); 
  
  // imprimimos los conjuntos de vocales y consonantes
  writeln('Vocales: ');
  MostrarSet(vocales);
	
  writeln('Consonantes: ');
  MostrarSet(consonantes);

  readln;
end.
