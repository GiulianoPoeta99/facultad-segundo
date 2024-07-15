{
    El  instituto  de  la  carrera  de  Sistemas  tiene  los  datos  de  sus  alumnos  (DNI,  Nro.  de 
    padrón,  apellido,  nombre  y  dirección)  en  un  archivo  llamado  alumnos.dat.  Se  debe 
    realizar un programa que permita obtener de manera eficiente los datos de cualquier 
    alumno. 
    
    Utilice para su solución una función de HASHING que retorne los últimos tres dígitos del 
    DNI y además suponga que no habrán más de 1000 alumnos. 
    
    Resuelva utilizando: 
    a) Direccionamiento abierto  
    b) Direccionamiento cerrado  
    
    Además,  realizar  un  procedimiento  para  cada  uno  de  los  casos  que  dado  un  nro.  de 
    documento  liste  por  pantalla  los  datos  del  alumno.  Se  deberá  tener  en  cuenta  la 
    inexistencia del alumno en el archivo. 
}
program ejercicio6;
uses crt, UListaAlumnos;

const 
    MAX = 1000;

type
    TTablaHashAbierto = array[0..MAX] of TLista;
    TTablaHashCerrado = array[0..MAX] of TElemento;

procedure inicializarTablaHash(var tabla:TTablaHashAbierto);
var
    i: integer;
begin
    for i:=1 to MAX do
    begin
        crear(tabla[i]);
    end;
end;

function hashMod(clave: longint): integer;
begin
    clave := clave mod 1000;
    hashMod := (clave mod MAX) + 1;
end;

function reHashMod(clave: integer): integer;
begin
    reHashMod := ((clave + 3) mod MAX) + 1;
end;

procedure insertarHashAbierto(var tabla: TTablaHashAbierto; claveHasheada: integer; clave: TElemento);
begin
    insertar(tabla[claveHasheada],clave);
end;

procedure insertarHashCerrado(var tabla: TTablaHashCerrado; claveHasheada: integer; clave: TElemento);
begin
    while (tabla[claveHasheada].dni <> 0) do
    begin
        claveHasheada := reHashMod(claveHasheada);
    end;
    tabla[claveHasheada] := clave;
end;

procedure buscarAlumnoAbierto(tabla: TTablaHashAbierto; clave: integer; dni: longint);
var
    copia: TLista;
begin
    copia := tabla[clave];
    while (not (vacia(copia)) and (copia^.info.dni <> dni)) do 
    begin
        copia := copia^.siguiente;
    end;
    if (copia^.info.dni = dni) then
    begin
        writeln('================================');
        writeln('Nombre: ',copia^.info.nombre,' ',copia^.info.apellido);
        writeln('DNI: ',copia^.info.dni);
        writeln('Direccion: ',copia^.info.direccion);
        writeln('Nro. Padron: ',copia^.info.nroPadron);
        writeln('================================');
        crear(copia);
    end
    else 
    begin
        writeln('No se encontro al alumno.');
    end;
end;

procedure buscarAlumnoCerrado(tabla: TTablaHashCerrado; clave: integer; dni: longint);
begin
    while (tabla[clave].dni <> dni) do 
    begin
        clave := reHashMod(clave);
    end;
    if (tabla[clave].dni = dni) then
    begin
        writeln('================================');
        writeln('Nombre: ',tabla[clave].nombre,' ',tabla[clave].apellido);
        writeln('DNI: ',tabla[clave].dni);
        writeln('Direccion: ',tabla[clave].direccion);
        writeln('Nro. Padron: ',tabla[clave].nroPadron);
        writeln('================================');
        dni := 0;
    end
    else 
    begin
        writeln('No se encontro al alumno.');
    end;
end;

var
    tablaHashAbierta: TTablaHashAbierto;
    tablaHashCerrada: TTablaHashCerrado;
    seguirCargando: char;
    claveHasheada: integer;
    dniBuscado: longint;
    alumno: TElemento;
begin
    seguirCargando := 's';
    inicializarTablaHash(tablaHashAbierta);
    while (seguirCargando = 's') do
    begin
        writeln('Ingrese el nombre del alumno: ');
        readln(alumno.nombre);
        writeln('Ingrese el apellido del alumno: ');
        readln(alumno.apellido);
        writeln('Ingrese el dni del alumno: ');
        readln(alumno.dni);
        writeln('Ingrese el direccion del alumno: ');
        readln(alumno.direccion);
        writeln('Ingrese el nro padron del alumno: ');
        readln(alumno.nroPadron);
        claveHasheada := hashMod(alumno.dni);
        insertarHashAbierto(tablaHashAbierta,claveHasheada,alumno);
        insertarHashCerrado(tablaHashCerrada,claveHasheada,alumno);
        writeln('Seguir cargando? s/n');
        readln(seguirCargando);
    end;
    writeln('Ingrese un DNI para buscar al alumno: ');
    readln(dniBuscado);
    claveHasheada := hashMod(dniBuscado);
    buscarAlumnoAbierto(tablaHashAbierta,claveHasheada,dniBuscado);
    buscarAlumnoCerrado(tablaHashCerrada,claveHasheada,dniBuscado)
end.