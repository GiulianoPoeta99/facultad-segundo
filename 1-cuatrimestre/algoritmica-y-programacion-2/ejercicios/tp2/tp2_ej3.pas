{ 3 -Escribir un programa en Pascal que cuente la cantidad de palabras que hay en una secuencia
de longitud <= 255 , sabiendo que las palabras se separan por uno o más blancos .}

Program tp2_ej3;

Function Verificador(Frase:String): Integer;
Var Contador, i: Integer;
Begin
    Contador := 0;
    
    For i:= 1 to length(Frase) do
        If (Frase[i] <> ' ') then Inc(contador);
    
    Verificador := Contador;
End;

Var Frase: String; Contador: Integer;

//Programa Principal
Begin
    Writeln('Ingrese una frase menor o igual a 255 caracteres:');
    
    repeat  
        Readln(Frase);
        Contador:= Verificador(Frase);        
    Until (Contador <= 255);

    Contador := Verificador(Frase);

    Writeln('Total de caracteres no vacio en esta frase: ', Contador);
End.
