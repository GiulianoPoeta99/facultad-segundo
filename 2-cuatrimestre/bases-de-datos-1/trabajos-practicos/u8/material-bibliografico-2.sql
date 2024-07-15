start transaction;

insert into editorial values(1, 'Mc Graw Hill'),
                            (2, 'Prentice Hall'),
                            (3, 'Nueva Libreria'),
                            (4, 'Eudeba');

insert into autor values(1, 'William Stallings'),
                        (2, 'Jeffrey Ullman'),
                        (3, 'Stephen Stelting'),
                        (4, 'Nuria Cortada de Kohan'),
                        (5, 'Britos García Martinez'),
                        (6, 'Luis Joyanes Aguilar');

insert into libro values(8448131932, 'Java 2, Manual de Pragramación', 1, 6),
                        (9871104308, 'Mineria de Datos', 3, 5),
                        (9502305698, 'Diseño Estadístico', 4, 4),
                        (8420538396, 'Patrones de Diseño aplicados a Java', 2, 3),
                        (9701702565, 'Introducción a los Sistemas de Bases de Datos', 2, 2),
                        (8420529931, 'Organización y Aquitectura de Computadoras', 2, 1); 

insert into edicion values(8448131932, 1, '2000-01-01', 180),
                          (9871104308, 1, '2000-01-01', 100),
                          (9871104308, 2, '2001-01-01', 120),
                          (9502305698, 1, '2000-02-02', 180),
                          (8420538396, 1, '2001-03-03', 200),
                          (9701702565, 1, '2004-02-01', 201),
                          (9701702565, 2, '2005-01-02', 210),
                          (9701702565, 3, '2006-01-03', 205),
                          (8420529931, 1, '2002-01-01', 134); 

insert into revista values(111111111, 'Revista Informatica', 1),
                          (222222222, 'Revista Computo', 2),
                          (333333333, 'Revista Computacion', 3),
                          (444444444, 'Revista Ordenadores', 3);

insert into numero values(111111111, 1, '2000-01-01', 90),
                         (111111111, 2, '2000-02-01', 91),
                         (111111111, 3, '2000-03-01', 92),
                         (111111111, 4, '2000-04-01', 93),
                         (111111111, 5, '2000-05-01', 94),
                         (111111111, 6, '2000-06-01', 95),
                         (111111111, 7, '2000-07-01', 96),
                         (111111111, 8, '2000-08-01', 97),
                         (222222222, 1, '2001-01-20', 50),
                         (222222222, 2, '2001-02-20', 60),
                         (222222222, 3, '2001-03-20', 50),
                         (222222222, 4, '2001-04-20', 60),
                         (222222222, 5, '2001-05-20', 50);

commit;