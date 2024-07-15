program ej1;

uses unitpilasParcial,unitcolasparcial;
//unitpilas es de tipo string
//unitcolas es un record con localidad/combustible/km
const
  n = 20;


procedure cargarDatos(var cola:tCola);
 var i:integer;
     e:tElementos;
 begin
   i:=1;
   inicializar(cola);
   write('Ingrese el nombre del proximo destino(sale con "z"): ');
   readln(e.localidad);
   
   while (e.localidad <> 'z') and (not llena(cola)) do
    begin
     write('Ingrese km recorridos: ');
     readln(e.km);
     write('Se pudo cargar combustible?(s/n)');
     readln(e.combustible);
     insertar(cola,e);
     
     inc(i);
     write('Ingrese el nombre del proximo destino(sale con "z"): ');
     readln(e.localidad);     
    end;     
 end;    

procedure imprimirRecorrido(cola:tCola; var pila:tPila);
 var i:integer;
     e:tElementos;
     tiene:string;
     totalKm:integer;
 begin
   totalKm:=0;
   i:=1;
   unitpilasParcial.inicializar(pila);
   writeln;
   writeln('-------------------------------');
   write('Parte desde Ushuaia');
   while (not vacia(cola)) do
    begin
      extraer(cola,e);
      if e.combustible = 's' then 
       begin
        tiene := 'si tiene';
        unitpilasParcial.insertar(pila,e.localidad);
       end  
        else tiene :='no tiene';
      write('-->[',e.localidad,'-',e.km,'-',tiene,']');
      totalKm:= totalKm + e.km;
      inc(i);
    end;
    writeln;
    writeln('-------------------------------');
    writeln('Recorrio ',totalKm, 'kilometros');
    writeln('-------------------------------');      
 end;
 
 procedure imprimirRetorno(pila:tPila);
  var i:integer;
      e:unitpilasParcial.tElementos;
   begin
    i:=1;
    write('Retorno desde ');
    
    while (not unitpilasParcial.vacia(pila)) do
     begin
      unitpilasParcial.extraer(pila,e);
      write(e,'-->');
      inc(i);
     end;
     write('Ushuaia');
   end;   
 
var
 colaViajes:tCola;
 pilaViajes:tPila;
begin
 cargarDatos(colaViajes);
 imprimirRecorrido(colaViajes,pilaViajes);
 imprimirRetorno(pilaViajes);
end.
