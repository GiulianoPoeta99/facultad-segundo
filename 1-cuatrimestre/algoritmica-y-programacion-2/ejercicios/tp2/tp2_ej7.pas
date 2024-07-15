program tp2_ej7;

type
  MayusculasSet = set of char;

var
  cadena: string;
  mayusculas: MayusculasSet;

procedure MayusculasEnCadena(cadena: string; var mayusculas: MayusculasSet);
var
  i: integer;
begin
  mayusculas := [];
  for i := 1 to Length(cadena) do
  begin
    if (cadena[i] in ['A'..'Z']) then
      mayusculas := mayusculas + [cadena[i]];
  end;
end;

procedure MostrarMayusculas(mayusculas: MayusculasSet);
var
  c: char;
begin
  Write('Letras mayusculas en la cadena: ');
  for c in mayusculas do
    Write(c, ' ');
  WriteLn;
end;

begin
  Write('Ingrese una cadena: ');
  ReadLn(cadena);
  MayusculasEnCadena(cadena, mayusculas);
  MostrarMayusculas(mayusculas);
end.
