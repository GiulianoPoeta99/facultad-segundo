Program tp2_Ej2a;

function pedirFrase(): string;
var
  frase: string;
begin
    repeat  
        Write('Ingrese porfavor una serie de letras o numeros de 16 caracteres:');
        Readln(Frase);
    until (16 = length(Frase) );
  pedirFrase := frase;
end;
var
Frase1, Frase2, FraseConcatenada: String;
begin
    Writeln('Primera Frase:');
    Frase1:= PedirFrase;
    Writeln('Segunda Frase:');
    Frase2:= PedirFrase;

    FraseConcatenada:= Frase1 + Frase2;

    Writeln('Su frase concatenada:');
    Writeln(FraseConcatenada);
end.