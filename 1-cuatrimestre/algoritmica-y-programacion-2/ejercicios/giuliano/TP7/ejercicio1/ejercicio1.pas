{
    1.- Hacer un programa que lea dos cadenas de caracteres separadas por un blanco, y determine
    a través del uso de colas si ambas cadenas son iguales.
}
program ejercicio1;
uses crt,UcolaCaracteres;

procedure separaCadena(cadena: string; var subCad1,subCad2: string);
var
    i,posEspacio: integer;
begin
    for i:=1 to length(cadena) do begin
        if (cadena[i] = ' ') then begin
            posEspacio := i;
            break;
        end;
    end;

    subCad1 := copy(cadena,1,posEspacio-1);
    subCad2 := copy(cadena,posEspacio+1,length(cadena));
end;

procedure cargarCola(cadena: string; var cola: Tcola);
var 
    i: integer;
begin
    for i:=1 to length(cadena)-1 do begin
        meter(cola,cadena[i]);
    end;
end;

procedure compararColas(cola1,cola2: Tcola; subCad1,subCad2: string);
var
    i: integer;
    iguales: boolean;
    elem1,elem2: char;
begin
    iguales := True;
    for i:=1 to length(subCad1) do begin
        sacar(cola1,elem1);
        sacar(cola2,elem2);
        writeln;
        writeln('pos:');
        writeln(i);
        writeln('elem1:');
        writeln(elem1);
        writeln('elem2:');
        writeln(elem2);
        if (elem1 <> elem2) then begin
            iguales := False;
        end;
    end;

    if (iguales) then begin
        writeln('Las cadenas son iguales');
    end else begin
        writeln('Las cadenas no son iguales.');
    end;
end;

var
    cola1,cola2: Tcola;
    cadena,subCadena1,subCadena2: string;
begin
    crear(cola1);
    crear(cola2);
    writeln('Ingrese una cadena de caracteres de 2 palabras separadas por un espacio: ');
    readln(cadena);
    separaCadena(cadena,subCadena1,subCadena2);
    writeln('las cadenas son:');
    writeln(subCadena1);
    writeln(subCadena2);
    cargarCola(subCadena1,cola1);
    cargarCola(subCadena2,cola2);
    if (length(subCadena1) = length(subCadena2)) then begin
        compararColas(cola1,cola2,subCadena1,subCadena2);
    end else begin
        writeln('Las cadenas no son iguales.');
    end;
end.