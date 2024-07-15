{
    Realice un subprograma que dado un número decimal retorne su representación binaria y otro
    subprograma que dada una representación binaria retorne el número decimal.
}
program ejercicio1;
uses UcolaEnteros,UpilaEnteros,crt;

{
    1   1   1   1   1   1   1
    1   2   4   8   16  32  64
}

function conseguirBitMaximo(decimal: integer): integer;
var
    binario: string;
    i, bitMaximo: integer;
begin
    // Convertir el número decimal a binario
    binario := '';
    while decimal > 0 do
    begin
        if decimal mod 2 = 0 then
            binario := '0' + binario
        else
            binario := '1' + binario;
        decimal := decimal div 2;
    end;
    
    // Iterar sobre los bits del número binario
    bitMaximo := -1;
    for i := 1 to Length(binario) do
    begin
        if binario[i] = '1' then begin
            if i > bitMaximo then
                bitMaximo := i;
        end;
    end;
    
    // Devolver el índice del bit más alto
    conseguirBitMaximo := bitMaximo;
end;

function transformarDecimalBinario(decimal: integer): Tpila;
var
    i,cantBit,bit: integer;
    pila: Tpila;
begin
    writeln('Consiguiendo bit maximo...');
    bit := 1;
    cantBit := conseguirBitMaximo(decimal);
    for i:=1 to cantBit do begin
        bit := bit * 2;
    end;

    writeln('Bit maximo: ',bit);
    UpilaEnteros.crear(pila);

    writeln('Iniciando analisis...');
    while ((bit >= 0) and (decimal > 0)) do begin
        if (decimal >= bit) then begin
            decimal := decimal - bit;
            UpilaEnteros.meter(pila,1);
        end else begin
            UpilaEnteros.meter(pila,0);
        end;
        bit := bit div 2;
    end;
    writeln('Analisis finalizado.');
    transformarDecimalBinario := pila;
end;

function transformarBinarioDecimal(binario: string): integer;
var
    i,bit,decimal,aux: integer;
    cola: Tcola;
begin
    UcolaEnteros.crear(cola);
    decimal := 0;

    for i:=1 to length(binario) do begin
        if (binario[i] = '1') then begin
            UcolaEnteros.meter(cola,1);
        end else if (binario[i] = '0') then begin
            UcolaEnteros.meter(cola,0);
        end;
    end;

    bit := 1;
    while (not UcolaEnteros.vacia(cola)) do begin
        UcolaEnteros.sacar(cola,aux);

        if (aux = 1) then begin
            decimal := decimal + bit;
        end;
        bit := bit * 2;
    end;

    transformarBinarioDecimal := decimal;
end;

procedure escribirBinario(pila: Tpila);
var
    elemento: integer;
begin
    while (not UpilaEnteros.vacia(pila)) do begin
        UpilaEnteros.sacar(pila,elemento);
        write(elemento);
    end;
    writeln;
end;

var
    pila: Tpila;
    decimal: integer;
    binario: string;
begin
    writeln('Ingrese un numero decimal: ');
    readln(decimal);
    pila := transformarDecimalBinario(decimal);
    writeln('El resultado es: ');
    escribirBinario(pila);
    writeln('Ingrese un numero binario:');
    readln(binario);
    decimal := transformarBinarioDecimal(binario);
    writeln('El resultado es: ',decimal);
end.