program agenciaAutos;

uses
uarbol,ulista,UlistaOrdenada,uhashcerrado,utipo; //es lista ordenada descendiente
 
 procedure imprimirCliente(cliente:Tcliente);
 begin
       writeln(cliente.nombre);
       writeln(cliente.dni);
       writeln(cliente.correo);
       writeln(cliente.celular);
       writeln(cliente.direccion.calle);
       writeln(cliente.direccion.numero);
       writeln(cliente.direccion.ciudad);
       writeln(cliente.direccion.provincia);
       writeln(cliente.alquileres);
 end;
 procedure cargarDatosMemoria(var archi:Tarchivo;var A:Tarbol;var lista:TlistaOrdenada;var tabla:Ttabla);
 var
 cliente:Tcliente;
 hash:TdatoHash;
 begin
   reset(archi);
       while not eof(Archi) do
         begin
         read(archi,cliente);
         uarbol.insertarRecursivo(A,cliente);
         ulistaOrdenada.insertar(lista,cliente); //inserta ordenado descendiente por alquileres
         hash.clave:= cliente.nombre; // esta es la segunda opcion pero no la termine
         hash.pos:= filePos(archi)-1;
         uhashCerrado.insertar(tabla,hash);
         end;   
  close(Archi);
 end;
  procedure cargarCliente(var A:Tarchivo);//carga de cliente
  var
  cliente: Tcliente;
begin
  reset(a); //abro el archivo y pongo apuntador en cero
  writeln('Ingrese nombre (o "x" para finalizar):');
  readln(cliente.nombre);
  
  while (cliente.nombre <> 'x') do
  begin
    writeln('Ingrese dni:');
    readln(cliente.dni);
    writeln('Ingrese correo:');
    readln(cliente.correo);
    writeln('Ingrese celular:');
    readln(cliente.celular);
    writeln('Ingrese direccion:');
    writeln('calle');
    readln(cliente.direccion.calle);
    writeln('numero');
    readln(cliente.direccion.numero);
    writeln('ciudad');
    readln(cliente.direccion.ciudad);
    writeln('provincia');
    readln(cliente.direccion.provincia);
    writeln('alquileres');
    readln(cliente.alquileres);
    seek(a, filesize(a));// coloco apuntador en ultima pos
    write(a, cliente);  // Guardar el alumno en el archivo
    writeln('Ingrese nombre (o "x" para finalizar):');
    readln(cliente.nombre);
  end;

  close(a);
end;
 var
 ruta:string;
 archi:Tarchivo;
 tabla:Ttabla;
 lista:TlistaOrdenada;
 arbol:Tarbol;
 buscado:string;
 encontrado:Tcliente;
 begin
 iniciar; //para el valor nulo de cliente
 uarbol.crearArbol(arbol);
 ulistaOrdenada.crearLista(lista);
 ruta:= 'C:\Users\pc\Documents\carpetaDestino/clientes.dat';//pone la dire de tus documentos
   assign(archi,ruta);
   cargarCliente(archi); //ingreso de clientes   
   cargarDatosMemoria(archi,arbol,lista,tabla);  //carga datos en memoria
   mostrarLista(lista);// lista datos de clientes ordenados por cantidad de alquileres
   //busqueda de un cliente
   writeln;
   writeln('ingrese un nombre a buscar');
   readln(buscado);
   encontrado:= uarbol.buscar(arbol,buscado); 
       if encontrado.dni < 10 then
          writeln('no existe')
        else //si esta listo datos del cliente   
           begin
           writeln('ficha cliente');
           imprimirCliente(encontrado);
           end;
 end.
