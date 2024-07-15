unit UClientes;

interface

type
    TDireccion = record
        calle, ciudad, provincia: string;
        numero: integer;
    end;

    TElemento = record
        nombre, mail: string;
        dni, telefono: longint;
        direccion: TDireccion;
        cantAlquiler: integer;
    end;

implementation

end.

