
-- Establecemos el nivel de aislamiento, para que solo vean cuando terminemos
set transaction isolation level read committed;

-- Iniciamos la transaccion
start transaction;

-- Creamos la tabla de cargos de los empleados
create table cargo(
	codigo integer not null primary key check(codigo > 0),
	nombre varchar(20) not null unique check(nombre <> ''),
	superior integer references cargo(codigo) on update cascade on delete restrict,
	check(codigo <> superior)
);

-- Creamos la tabla de categorias de articulos
create table categoria(
	codigo integer not null primary key check(codigo > 0),
	nombre varchar(20) not null unique check(nombre <> '')
);

-- Creamos la tabla de sucursales
create table sucursal(
	numero integer not null primary key check(numero > 0),
	direccion varchar(50) not null unique check(direccion <> ''),
	telefono integer not null unique check(telefono > 0)
);

-- Creamos la tabla de clientes
create table cliente(
	documento bigint not null primary key check(documento > 0),
	apellido varchar(50) not null check(apellido <> ''),
	nombre varchar(50) not null check(nombre <> ''),
	direccion varchar(50) not null check(direccion <> '')
);

-- Creamos la tabla de empleados
create table empleado(
	documento bigint not null primary key check(documento > 0),
	apellido varchar(50) not null check(apellido <> ''),
	nombre varchar(50) not null check(nombre <> ''),
	legajo integer not null unique check(legajo > 0),
	nacimiento date not null,
	ingreso date not null,
	retiro date,
	cargo integer not null references cargo(codigo) on update cascade on delete restrict,
	sucursal integer not null references sucursal(numero) on update cascade on delete restrict,
	check(ingreso < retiro)
);

-- Creamos la tabla de facturas
create table factura(
	numero bigint not null primary key check(numero > 0),
	tipo char(1) not null check(tipo = 'A' or tipo = 'B'),
	fecha date not null,
	cliente bigint not null references cliente(documento) on update cascade on delete restrict,
	empleado bigint not null references empleado(documento) on update cascade on delete restrict
);

-- Creamos la tabla de articulos
create table articulo(
	codigo bigint not null primary key check(codigo > 0),
	descripcion varchar(50) not null unique check(descripcion <> ''),
	precio float not null check(precio > 0),
	categoria integer references categoria(codigo) on update cascade on delete restrict
);

-- Creamos la tabla de renglones de facturas
create table renglon(
	factura bigint not null references factura(numero) on update cascade on delete cascade,
	numero integer not null check(numero > 0),
	articulo bigint not null references articulo(codigo) on update cascade on delete restrict,
	precio float not null check(precio > 0),
	cantidad float not null check(cantidad > 0),
	primary key(factura, numero),
	check(precio * cantidad > 0)
);

-- Creamos la tabla de stock de articulos
create table stock(
	sucursal integer not null references sucursal(numero) on update cascade on delete cascade,
	articulo bigint not null references articulo(codigo) on update cascade on delete cascade,
	cantidad float not null,
	primary key(sucursal, articulo)
);

-- Precargamos las categorias
insert into categoria values(1, 'Limpieza'), 
                            (2, 'Perfumeria'), 
                            (3, 'Almacen'), 
                            (4, 'Lacteos'),
                            (5, 'Verdulería');

-- Precargamos los cargos
insert into cargo values(1, 'Gerente', null), 
                        (2, 'Encargado', 1), 
                        (3, 'Supervisor', 1),
                        (4, 'Repositor', 2), 
                        (5, 'Cajero', 3);

-- Precargamos los articulos
insert into articulo values(7790072001037, 'Limpiador de pisos', 20.19, 1), 
                           (7790072001038, 'Lavandina', 25.59, 1), 
                           (7790072001039, 'Cera para pisos', 59.99, 1),
                           (7790172001019, 'Desodorante en crema', 12, 2),
                           (7790172001029, 'Tintura para cabello', 61.2, 2), 
                           (7790172001049, 'Crema dental', 11.19, 2),
                           (7790072002011, 'Galletitas dulces', 10, 3), 
                           (7790072002022, 'Pan dulce con frutas', 60.99, 3), 
                           (7790072002033, 'Turrón de maní', 8.99, 3),
                           (7790071001000, 'Leche entera', 10, 4), 
                           (7790073001000, 'Yogurt bebible de frutilla', 14.59, 4), 
                           (7790074001000, 'Crema de leche entera', 15, 4),
                           (7790074001001, 'Carbón vegetal 5kg', 45, null);

-- Precargamos las sucursales
insert into sucursal values(1, 'Permito Moreno 111', 444111),
                           (2, 'Onas 222', 444222),
                           (3, 'Concejal Rubinos 333', 444333);

-- Precargamos el stock
insert into stock values(1, 7790072001037, 10), 
                        (1, 7790072001038, 21), 
                        (1, 7790072001039, 30),
                        (1, 7790172001019,  5), 
                        (1, 7790172001029,  1), 
                        (1, 7790172001049,  8), 
                        (1, 7790072002011, 99), 
                        (1, 7790072002022, 50), 
                        (1, 7790072002033, 23), 
                        (1, 7790071001000, 22), 
                        (1, 7790073001000, 21), 
                        (1, 7790074001000, 10), 
                        (2, 7790072001037, 12), 
                        (2, 7790072001039, 32),
                        (2, 7790172001019,  7), 
                        (2, 7790172001029,  3), 
                        (2, 7790172001049, 10), 
                        (2, 7790072002011, 92), 
                        (2, 7790072002022, 52), 
                        (2, 7790072002033, 22), 
                        (2, 7790071001000, 23), 
                        (2, 7790074001000, 12), 
                        (3, 7790072001037, 13), 
                        (3, 7790072001038, 23), 
                        (3, 7790172001019, 10), 
                        (3, 7790172001029,  2), 
                        (3, 7790172001049, 13), 
                        (3, 7790072002022, 53), 
                        (3, 7790072002033, 23), 
                        (3, 7790073001000, 23), 
                        (3, 7790074001000, 13);
                       
-- Precargamos los clientes 
insert into cliente values(11222333, 'Perez', 'Pedro', 'Los Cauquenes 123'),
                          (22333444, 'Gonzalez', 'Juana', 'Marcos Zar 234'),
                          (33444555, 'Alvarez', 'Mirta', 'Maria Sanchez de Caballero 345'),
                          (44555666, 'Fernandez', 'Juliana', 'Lucas Bridges 456'),
                          (55666777, 'Argento', 'Mauro', 'Marcos Vera 567'),
                          (66777888, 'Muñoz', 'Juan', 'Concejal Rubinos 678'),
                          (77888999, 'Estevez', 'Mario', 'La Pataia 789'),
                          (88999000, 'Perez', 'Maria', 'Los Cauquenes 123');

-- Precargamos los empleados
insert into empleado values(20111111, 'Perez', 'Alberto',  1, '1980-01-01', '2010-01-01', null, 1, 1),
                           (20111222, 'Suar', 'Fernando',  2, '1982-02-02', '2010-01-02', null, 2, 1),
                           (20111333, 'Tinelli', 'Adrian',  3, '1983-03-03', '2010-01-03', null, 3, 1),
                           (20111444, 'Gonzalez', 'Adriana',  4, '1984-04-04', '2010-01-04', null, 4, 1),
                           (20111555, 'Brieva', 'Carolina',  5, '1985-05-05', '2010-01-05', null, 5, 1),
                           (20222111, 'Marte', 'Ana',  6, '1980-02-02', '2010-01-06', null, 1, 2),
                           (20222222, 'Alvarez', 'Pamela',  7, '1980-03-03', '2010-01-07', null, 2, 2),
                           (20222333, 'Tejero', 'German',  8, '1980-04-04', '2010-01-08', null, 3, 2),
                           (20222444, 'Maiquepan', 'Laura',  9, '1980-05-05', '2010-01-09', null, 4, 2),
                           (20222555, 'Fernandez', 'Alfredo', 10, '1981-02-01', '2010-01-10', null, 5, 2),
                           (20333111, 'Oyarzo', 'Marcos', 11, '1981-03-01', '2010-01-11', null, 1, 3),
                           (20333222, 'Padin', 'Mario', 12, '1982-04-01', '2010-01-12', null, 2, 3),
                           (20333333, 'Muñoz', 'Carlos', 13, '1982-05-01', '2010-01-13', null, 3, 3),
                           (20333444, 'Galvin', 'Nadia', 14, '1983-06-01', '2010-01-14', null, 4, 3),
                           (20333555, 'Argento', 'Soledad', 15, '1983-07-01', '2010-01-15', null, 5, 3),
                           (20333666, 'Martinez', 'Miriam', 16, '1983-08-01', '2010-01-01', '2013-02-02', 5, 3),
                           (20333777, 'Martinez', 'Gerardo', 17, '1983-10-01', '2010-01-01', null, 5, 3),
                           (22333666, 'Argento', 'Albaro', 18, '1975-08-01', '2000-01-01', '2014-02-02', 1, 2);

-- Precargamos las facturas
insert into factura values( 1, 'A', '2012-01-01', 11222333, 20111555),
                          ( 2, 'B', '2012-01-05', 22333444, 20222555),
                          ( 3, 'A', '2012-02-01', 33444555, 20333555),
                          ( 4, 'B', '2012-02-05', 44555666, 20333666),
                          ( 5, 'A', '2012-03-01', 55666777, 20111555),
                          ( 6, 'B', '2012-03-05', 66777888, 20222555),
                          ( 7, 'A', '2012-04-01', 77888999, 20333555),
                          ( 8, 'B', '2012-04-05', 88999000, 20333666),
                          ( 9, 'A', '2012-05-01', 11222333, 20111555),
                          (10, 'B', '2012-05-05', 22333444, 20222555),
                          (11, 'A', '2012-06-01', 33444555, 20333555),
                          (12, 'B', '2012-06-05', 11222333, 20333666),
                          (13, 'A', '2012-07-01', 22333444, 20111555),
                          (14, 'B', '2012-07-05', 44555666, 20222555),
                          (15, 'A', '2012-08-01', 55666777, 20333555),
                          (16, 'B', '2012-08-05', 77888999, 20333666),
                          (17, 'A', '2012-09-01', 88999000, 20111555),
                          (18, 'B', '2012-09-05', 22333444, 20222555),
                          (19, 'A', '2012-10-01', 33444555, 20333555),
                          (20, 'B', '2012-10-05', 44555666, 20333666);

-- Precargamos los renglones de facturas
insert into renglon values( 1, 1, 7790072001037, 20,  2),
                          ( 1, 2, 7790172001019, 10,  4),
                          ( 2, 1, 7790072001037, 20,  5),
                          ( 2, 2, 7790172001049, 9,  6),
                          ( 3, 1, 7790172001029, 58.5,  1),
                          ( 3, 2, 7790172001019, 10,  7),
                          ( 4, 1, 7790172001029, 60, 10),
                          ( 4, 2, 7790072001037, 20.19, 12),
                          ( 5, 1, 7790071001000, 8, 13),
                          ( 6, 1, 7790072002033, 7, 90),
                          ( 7, 1, 7790072002033, 8,  2),
                          ( 8, 1, 7790074001000, 12,  3),
                          ( 9, 1, 7790073001000, 14, 12),
                          (10, 1, 7790072001037, 20.19, 78),
                          (11, 1, 7790074001000, 15, 24),
                          (11, 2, 7790172001029, 61.2, 56),
                          (12, 1, 7790172001049, 11, 12),
                          (13, 1, 7790072002022, 58, 12),
                          (13, 2, 7790073001000, 14.59,  5),
                          (14, 1, 7790072002011, 9,  4),
                          (15, 1, 7790172001019, 12,  6),
                          (15, 2, 7790172001029, 61.2,  8),
                          (16, 1, 7790172001049, 11.19, 12),
                          (16, 2, 7790071001000, 9, 77),
                          (16, 3, 7790072002022, 60, 11),
                          (17, 1, 7790072002011, 10, 55),
                          (17, 2, 7790172001019, 12, 22),
                          (18, 1, 7790172001019, 12, 23),
                          (19, 1, 7790072001038, 20,  1),
                          (20, 1, 7790172001049, 11.19, 56),
                          (20, 2, 7790072001038, 25.59, 34);
       
-- Comprometemos la transaccion
commit;