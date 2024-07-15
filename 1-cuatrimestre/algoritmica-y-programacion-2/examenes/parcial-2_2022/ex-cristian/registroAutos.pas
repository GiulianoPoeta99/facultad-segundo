program registroAutos;

 uses

 uhashCerrado,ulista,utipo;
   
 procedure cargarEnMemoria(var archi:Tarchivo;var tabla:Ttabla);   
 var
 DatoHash:TdatoHash;
 auto:Tvehiculo; 
 begin
  reset(archi);
     while not Eof(archi) do
      begin
      read(archi,auto);
      DatoHash.clave:= auto.patente;     //guardo el campo clave
      DatoHash.pos:= filePos(archi)-1;   //guardo la dir de memoria donde esta el registro de la pat buscada
      uhashCerrado.insertar(tabla,DatoHash); 
      end; 
      
     close(archi);
 end;


 procedure imprimirVehiculo(var archi:Tarchivo;buscado:TdatoHash);
 var
 vehiculo:Tvehiculo;
 begin
  reset(archi); //abre un archivo y pone apuntador en cero
      seek(archi,buscado.pos);
      read(archi,vehiculo);
      write('patente: ',vehiculo.patente,' ');
	  write('fecha alta: ',vehiculo.fechaAlta.dia,'/',vehiculo.fechaAlta.mes,'/',vehiculo.fechaAlta.anio);
	  write('nro chasis',vehiculo.nrochasis);
	  write('marca',vehiculo.marca,'modelo ',vehiculo.modelo);
	  write('anio', vehiculo.anio);
	  close(archi);
 end;
 
 procedure cargarPatentes(var archi:Tarchivo);
 var
 pat:Tvehiculo;
 begin
  reset(archi);
     writeln('ingrese patente *formato (BB123BB');
     readln(pat.patente);
     while pat.patente <> 'x' do
      begin
      writeln('ingrese fecha de alta');
      writeln('dia *dd* ');
      readln(pat.FechaAlta.dia);
      writeln('mes *mm* ');
      readln(pat.FechaAlta.mes);
      writeln('anio *aaaa* ');
      readln(pat.FechaAlta.anio);
      writeln('ingrese  num chasis');
      readln(pat.nroChasis);
      writeln('ingrese marca ');
      readln(pat.marca);
      writeln('ingrese modelo');
      readln(pat.modelo);
      writeln('ingrese anio *aaaa');
      readln(pat.anio); 
      seek(archi,fileSize(archi)+1);            
      write(archi,pat); 
      writeln('ingrese patente *formato (BB123BB) o x para salir');
      readln(pat.patente);      
      end;
     close(archi);
  
 end;

 var
 archi:Tarchivo;
 ruta:string;
 Buscado:TdatoHash;
 patente:string;
 tabla:tTabla;
 
 begin
   uhashCerrado.iniciar(tabla);
   ruta:='C:\Users\pc\Documents\untdf\1 er cuatrimestre\AyP2\trabajos Practicos\tp12\registro automotor/dominios.dat';
   assign(archi,ruta);
   cargarPatentes(archi);
   cargarEnMemoria(archi,tabla);
         writeln('ingrese patente a buscar ');
         readln(patente);
         buscado:= uhashCerrado.buscar(tabla,patente);//busco la patente
         
         if buscado.clave = '' then
           writeln('no existe')        
         else
            begin
			 imprimirVehiculo(archi,buscado); //si existe lo imprimo
             end;
end.

