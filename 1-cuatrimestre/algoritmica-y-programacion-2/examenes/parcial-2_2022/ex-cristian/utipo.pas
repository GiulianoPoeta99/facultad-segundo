unit utipo;

interface

type
   
Tdata=record
   calle:string;
   numero:string;
   ciudad:string;
   provincia:string;
 end;  
   
Tcliente=record
   nombre:string;
   dni:longint;
   correo:string;
   celular:string;
   direccion:Tdata;
   alquileres:integer;
 end;  

 Tarbol=^nodo;
 nodo=record
   info:Tcliente;
   izq,der:Tarbol;
 end;
    
  TdatoHash=record
   clave:string;
   pos:integer;
 end;
   

   
 Tlista=^Tnodo;
 Tnodo=record
   info:TdatoHash;
   sig:Tlista;
 end;
  
 Telemento=Tcliente;
 Tarchivo= file of Tcliente;
 
 TlistaOrdenada=^Tnodo2;
   Tnodo2=record
   info:Telemento;
   sig:TlistaOrdenada;
 end;
 
 function iniciar:Tcliente;
   
 implementation
 
 function iniciar: Tcliente;
 var
  cliente: Tcliente;
 begin
  cliente.nombre := '';
  cliente.dni := 0;
  cliente.correo := '';
  cliente.celular := '';
  cliente.direccion.calle := '';
  cliente.direccion.numero := '';
  cliente.direccion.ciudad := '';
  cliente.direccion.provincia := '';
  cliente.alquileres := 0;

  iniciar := cliente;
 end;

end.
