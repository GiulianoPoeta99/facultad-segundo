{
    11. Defina los tipos de datos que a su juicio son los más convenientes para resolver el siguiente
    problema. Justifique claramente su elección
    Una compañía de seguros ofrece dos tipos de seguros. De automotor y de vida
    En el primer caso se conoce los datos del auto (Nro. de motor, chasis, patente, tipo de
    vehículo y el valor del auto).
    En el caso del seguro de vida se conoce el nombre del beneficiario y el valor por el cual se
    desea asegurar la persona.
    En ambos casos son datos el nombre del titular de la póliza, el número de la misma y su
    costo.
    Declare los tipos de datos para:
        a) Almacenar el nombre de la compañía de seguros y los datos de hasta 20 pólizas.
        b) Almacenar el nombre de las 10 compañías de seguros que operan en Ushuaia
        (teniendo en cuenta que la cantidad de pólizas para cada una es de a lo sumo 20
        pólizas)
        c) ídem b) pero ahora para las 10 compañías que operan en Ushuaia y las 10 que
        operan en Río Grande. 
}
program ejercicio11;
uses crt;

type
    Tpolizas = record 
        compania: string;
        titular: string;
        nroPoliza: integer;
        precio: real;
        case tipo: char of
            'a': (
                beneficiario: string;
                valorSeguro: integer;
            );
            'v': (
                nroMotor, valorVehiculo: integer;
                chasis, patente, tipoVehiculo: string
            );
    end;

    Tseguros = array[1..20] of Tpolizas;

    Tcompanias = record
        nombre: string;
        polizas: Tseguros;
    end;

    Taseguradoras = array[1..10] of Tcompanias;

begin
    
end.
