{
    Dada una lista apuntada por LISTAEMP : 

    TYPE
        CADENA = STRING [20];
        PTR = ^NODO; 
        NODO = RECORD 
            NOMBRE: CADENA; 
            NROEMP: INTEGER; 
            CODIGODPTO: CHAR; 
            HRSEMANA: INTEGER; 
            SALARIO: REAL;     
            SIG: PTR 
        END; 

    VAR 
        LISTAEMP : PTR ; 

    Escribir un procedimiento para suprimir de la lista a todos los empleados que trabajen 
    menos de 40 hs. por semana (HRSEMANA). 
}
program ejercicio5;
uses crt, UListaEmpleados;

begin
    
end.
