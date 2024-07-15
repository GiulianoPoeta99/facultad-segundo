program tp2_ej6;
//GenerarConjuntos;

type
  BASE = 1..50;
  CONJ = set of BASE;

var
  A, B: CONJ;
  i: BASE;

begin
  {Generar conjunto A con múltiplos de 6}
  A := [];
	for i := 6 to 50 step 6 do
    Include(A + i);
  WriteLn('A: ', A);

  {Generar conjunto B como complemento de A respecto a BASE}
  B := BASE(A) - A;
  WriteLn('B: ', B);
end.
