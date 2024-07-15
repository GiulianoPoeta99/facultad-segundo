

function simetria(arbolDer,arbolIzq:Tarbol):boolean;
var
    simetriaExterna,simetriaInterna:boolean;
begin
    simetria := false;
    if ((arbolDer = nil) and (arbolIzq = nil)) then
        simetria := true;
    else if ((arbolDer <> nil) and (arbolIzq <> nil)) then
    begin
        simetriaExterna := simetria(arbolDer.der,arbolIzq.izq);
        simetriaInterna := simetria(arbolDer.izq,arbolIzq.der);
        if (simetriaExterna and simetriaInterna) then
            simetria := true;
    end
end;