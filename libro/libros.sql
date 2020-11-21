/*
Primero creamos la base de datos para no mezclar tablas
*/ 

CREATE DATABASE books;

/*
Comienzo con las tablas que no tienen FK dependientes
*/

CREATE TABLE lector(
    id_lector INT,
    nombre_lector VARCHAR(20),
    PRIMARY KEY (id_lector)
);

CREATE TABLE autor(
    id_autor INT, 
    nombre_autor VARCHAR (25),
    PRIMARY KEY(id_autor)
);

CREATE TABLE libro(
    codigo_libro INT,
    nombre_libro VARCHAR(50),
    /*
    hice la prueba y por los títulos tiene que ser mas largo 
    */  
    PRIMARY KEY(codigo_libro)
);

/*
Comienzo con las tablas que tienen FK dependientes y que resuelven el problema de las
relaciones N:N
*/

CREATE TABLE prestamo(
    id_prestamo INT,
    lector_id INT,
    libro_codigo INT,
    fecha_prestamo DATE,
    PRIMARY KEY (id_prestamo),
    FOREIGN KEY (lector_id) REFERENCES lector(id_lector),
    FOREIGN KEY (libro_codigo) REFERENCES libro(codigo_libro)
);

CREATE TABLE editorial(
    id_editorial INT,
    libro_id_editorial INT,
    autor_id INT,
    nombre_editorial VARCHAR(25),
    PRIMARY KEY(id_editorial),
    FOREIGN KEY (libro_id_editorial) REFERENCES libro(codigo_libro),
    FOREIGN KEY (autor_id) REFERENCES autor(id_autor)
);


/*CREATE TABLE

Ingreso datos de autores

books=# INSERT INTO autor (id_autor,nombre_autor) VALUES (1,'Pérez Gómez, Juan');
INSERT 0 1
books=# INSERT INTO autor (id_autor,nombre_autor) VALUES (2,'Ortega Pereira, Margarita');
INSERT 0 1
books=# INSERT INTO autor (id_autor,nombre_autor) VALUES (3, 'García Contreras,Rosa');
INSERT 0 1
books=# INSERT INTO autor (id_autor,nombre_autor) VALUES (4,'López Molina, Ana');
INSERT 0 1
books=# SELECT *FROM autor;
 id_autor |       nombre_autor        
----------+---------------------------
        1 | Pérez Gómez, Juan
        2 | Ortega Pereira, Margarita
        3 | García Contreras,Rosa
        4 | López Molina, Ana
(4 rows)


Datos de lectores

books=# INSERT INTO lector(id_lector,nombre_lector) VALUES (1,'Frank Garrido Reyes');
INSERT 0 1
books=# INSERT INTO lector(id_lector,nombre_lector) VALUES (2,'Blanca Mesinas'); 
INSERT 0 1
books=# SELECT * FROM lector;
 id_lector |    nombre_lector    
-----------+---------------------
         1 | Frank Garrido Reyes
         2 | Blanca Mesinas
(2 rows)

Datos de libros (arreglando el que era el título muy largo)
books=# INSERT INTO libro(codigo_libro, nombre_libro) VALUES (515,'Ecuaciones diferenciales para ingenieros y científicos');
ERROR:  value too long for type character varying(25)
books=# INSERT INTO libro(codigo_libro, nombre_libro) VALUES (515,'Ecuaciones diferenciales');
INSERT 0 1
books=# INSERT INTO libro(codigo_libro, nombre_libro) VALUES (540,'Química');
INSERT 0 1
books=# INSERT INTO libro(codigo_libro, nombre_libro) VALUES (530,'Física');
INSERT 0 1
books=# INSERT INTO libro(codigo_libro, nombre_libro) VALUES (519,'Estadística');
INSERT 0 1
books=# INSERT INTO libro(codigo_libro, nombre_libro) VALUES (512,'Álgebra Lineal');
INSERT 0 1
books=# SELECT *FROM libro;
 codigo_libro |       nombre_libro       
--------------+--------------------------
          515 | Ecuaciones diferenciales
          540 | Química
          530 | Física
          519 | Estadística
          512 | Álgebra Lineal
(5 rows)




Editorial

books=# INSERT INTO editorial(id_editorial,libro_id_editorial,autor_id,nombre_editorial) VALUES (101, 515,1,'UTHEA');
INSERT 0 1
books=# INSERT INTO editorial(id_editorial,libro_id_editorial,autor_id,nombre_editorial) VALUES (102,540,2,'Reverté');
INSERT 0 1
books=# INSERT INTO editorial(id_editorial,libro_id_editorial,autor_id,nombre_editorial) VALUES (103,530,3,'McGraw-Hill');
INSERT 0 1
books=# INSERT INTO editorial(id_editorial,libro_id_editorial,autor_id,nombre_editorial) VALUES (104,519,4,'McGraw-Hill');
INSERT 0 1
books=# INSERT INTO editorial(id_editorial,libro_id_editorial,autor_id,nombre_editorial) VALUES (105,512,1,'MIR');
INSERT 0 1
books=# SELECT * FROM editorial;
 id_editorial | libro_id_editorial | autor_id | nombre_editorial 
--------------+--------------------+----------+------------------
          101 |                515 |        1 | UTHEA
          102 |                540 |        2 | Reverté
          103 |                530 |        3 | McGraw-Hill
          104 |                519 |        4 | McGraw-Hill
          105 |                512 |        1 | MIR
(5 rows)


me hice un prestamo 


books=# Select nombre_lector FROM lector FULL OUTER JOIN prestamo ON lector.id_lector=prestamo.lector_id WHERE prestamo.lector_id IS NOT NULL;
    nombre_lector    
---------------------
 Frank Garrido Reyes
(1 row)



al hacer altiro un join me salio :3 que el autor 1 pertenece a dos editoriales :3, si lees esto porfi 
revisame la segunda versión de la prueba :( que ahora entendi bien lo de la atomicidad)

*/ 


