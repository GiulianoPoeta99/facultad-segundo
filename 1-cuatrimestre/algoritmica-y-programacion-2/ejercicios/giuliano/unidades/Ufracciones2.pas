unit Ufracciones2;

interface

type
    Tfraccion = record
        numerador,denominador: integer;
    end;

function iniciarFraccion(numerador,denominador: integer): Tfraccion;

function sumarFracciones(fraccion1,fraccion2: Tfraccion): Tfraccion;

function restarFracciones(fraccion1,fraccion2: Tfraccion): Tfraccion;

procedure SimplificarFraccion(var fraccion: Tfraccion);

implementation

function iniciarFraccion(numerador,denominador: integer): Tfraccion;
begin
    iniciarFraccion.numerador := numerador;
    iniciarFraccion.denominador := denominador;
end;

function sumarFracciones(fraccion1,fraccion2: Tfraccion): Tfraccion;
var 
    aux1,aux2: Tfraccion;
begin
    if (fraccion1.denominador = fraccion2.denominador) then begin
        sumarFracciones.numerador := fraccion1.numerador + fraccion2.numerador;
        sumarFracciones.denominador := fraccion1.denominador;
    end else begin
        aux1.numerador := fraccion1.numerador * fraccion2.denominador;
        aux1.denominador := fraccion1.denominador * fraccion2.denominador;

        aux2.numerador := fraccion2.numerador * fraccion1.denominador;
        aux2.denominador := fraccion2.denominador * fraccion1.denominador;

        sumarFracciones.numerador := aux1.numerador + aux2.numerador;
        sumarFracciones.denominador := aux1.denominador;
    end;
end;

function restarFracciones(fraccion1,fraccion2: Tfraccion): Tfraccion;
var 
    aux1,aux2: Tfraccion;
begin
    if (fraccion1.denominador = fraccion2.denominador) then begin
        restarFracciones.numerador := fraccion1.numerador - fraccion2.numerador;
        restarFracciones.denominador := fraccion1.denominador;
    end else begin
        aux1.numerador := fraccion1.numerador * fraccion2.denominador;
        aux1.denominador := fraccion1.denominador * fraccion2.denominador;

        aux2.numerador := fraccion2.numerador * fraccion1.denominador;
        aux2.denominador := fraccion2.denominador * fraccion1.denominador;

        restarFracciones.numerador := aux1.numerador - aux2.numerador;
        restarFracciones.denominador := aux1.denominador;
    end;
end;

procedure SimplificarFraccion(var fraccion: Tfraccion);
var
    a,b,aux: Integer;
begin
    // encuentra el máximo común divisor (MCD) utilizando el algoritmo de Euclides
    a := fraccion.numerador;
    b := fraccion.denominador;
    while (b <> 0) do begin
        aux := a mod b;
        a := b;
        b := aux;
    end;

    // divide el numerador y el denominador por el MCD
    fraccion.numerador := fraccion.numerador div a;
    fraccion.denominador := fraccion.denominador div a;
end;

begin

end.