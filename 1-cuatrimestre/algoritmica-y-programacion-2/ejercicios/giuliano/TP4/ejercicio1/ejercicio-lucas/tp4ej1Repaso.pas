program tp4ej1;

type 

 tipoArchivo = file of integer;
 tipoPosicion = 0..20;
 
procedure verificarArchivo(var verificador:tipoArchivo);
var nombreArchivo:string;
begin
   write('ingrese nombre archivo: ');
   readln(nombreArchivo);

  {$I-} //deshabilita comprobacion
    assign(verificador,nombreArchivo);
    reset(verificador);
  {$I+}//habilita comprobacion
 
  if IoResult = 0 then writeln('El archivo existe')
  else 
   begin
    writeln('El archivo no existe, se va a crear uno nuevo');
    rewrite(verificador);   
   end;
end; 

procedure cargarDatos(var archiv:tipoArchivo; n:integer); 
//carga los 20 de datos del archivo
 var i:integer;
     numero:tipoPosicion;
     pudoAbrir:boolean;
 begin
  pudoAbrir := (IoResult = 0);

 if not pudoAbrir then
 begin
  for i:=1 to n do
   begin
    write('ingrese numero (',i,'):' );
    readln(numero);
    write(archiv,numero);
   end;
  end;
 end;  
procedure mostrarDatos(var archiv:tipoArchivo);
//lista los datos del archivo
 var i:integer;
  begin
   reset(archiv); //tambien en ves de abrirlo otra ves, puedo usar seek
   writeln;
   writeln('Datos del archivo: ');
   while not eof(archiv) do
    begin
     read(archiv,i);
     write(i,' ;');
    end;
    close(archiv);
  end;

var
archivo:tipoArchivo;
begin
 verificarArchivo(archivo);
 cargarDatos(archivo,20);
 mostrarDatos(archivo);
end.
