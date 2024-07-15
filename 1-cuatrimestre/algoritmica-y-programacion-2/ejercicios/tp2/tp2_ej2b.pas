Program tp2_Ej2b;

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

function RecortarEspacios(Frase:string): String;
var CantidadLetras,i: Integer;
begin
    i:= 1;
    CantidadLetras := 0;
    while Frase[i] <> ' ' do  
    Begin
    CantidadLetras:= CantidadLetras + 1;
    i:=i+1;
    end;
    RecortarEspacios:= Copy(Frase,1, CantidadLetras);
End;

var
Frase1, Frase2, FraseSinEspacio, FraseConcatenada: String;
begin
    Writeln('Primera Frase:');
    Frase1:= PedirFrase;

    FraseSinEspacio:= RecortarEspacios(Frase1);


    Writeln('Segunda Frase:');
    Frase2:= PedirFrase;

    FraseConcatenada:= FraseSinEspacio + Frase2;

    Writeln('Su frase concatenada SIN ESPACIOS, es:');
    Writeln(FraseConcatenada);
end.