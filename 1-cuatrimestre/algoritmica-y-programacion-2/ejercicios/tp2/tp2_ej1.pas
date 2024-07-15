Program tp2_Ej1;

var
   Frase: string;
   A, B: integer;
   Capicua: boolean;

begin

   A := 1;
   B := length(Frase);
   capicua := true;

 Write('Ingrese porfavor una serie de letras o numeros de 16 caracteres:');
 Readln(Frase);
    repeat  
        Writeln('Usted a ingresado mal la peticion que le pedi.');
        Write('Ingrese porfavor una serie de letras o numeros de 16 caracteres:');
        Readln(Frase);
    until (16 = length(Frase) );

    while (A < B) and capicua do
    begin
        if Frase[A] <> Frase[B] then
            capicua := false;
        A := A + 1;
        B := B - 1;
    end;

   if capicua then
      writeln('El string es capicua.')
   else
      writeln('El string no es capicua.');
end.