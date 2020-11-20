/*
* Pregunta 1
*/


CREATE DATABASE peliculas;

/*
* Pregunta 2
*/

CREATE TABLE peliculas(
id SERIAL,
peliculas VARCHAR(100),
estreno VARCHAR(20), 
director VARCHAR(100), 
PRIMARY KEY (id)
);

CREATE TABLE reparto(
id SERIAL, 
reparto VARCHAR(100),
FOREIGN KEY (id) REFERENCES peliculas(id)
);

/*
* Pregunta 3
*/
\copy peliculas FROM 'Desktop/database/top_100/peliculas.csv' csv HEADER; 

\copy reparto FROM 'Desktop/database/top_100/reparto.csv' csv ;

/*
* Pregunta 4
*/

SELECT * FROM peliculas INNER JOIN reparto ON peliculas.id=reparto.id WHERE peliculas.peliculas='Titanic';

/*
* Pregunta 5
*/
SELECT * FROM peliculas INNER JOIN reparto ON peliculas.id=reparto.id WHERE reparto ='Harrison Ford';


/*
* Pregunta 6
*/

SELECT director, COUNT(*) AS cantidad FROM peliculas GROUP BY director ORDER BY cantidad DESC LIMIT 10;

/*
* Pregunta 7
*/
SELECT COUNT(DISTINCT reparto) FROM reparto;


/*
* Pregunta 8
*/

SELECT peliculas FROM peliculas WHERE estreno BETWEEN '1990' AND '1999' ORDER BY peliculas;

/*
* Pregunta 9
*/
SELECT * FROM peliculas LEFT JOIN reparto ON peliculas.id=reparto.id WHERE estreno='2001' ORDER BY peliculas;


/*
* Pregunta 10
*/

SELECT * FROM peliculas LEFT JOIN reparto ON peliculas.id=reparto.id ORDER BY estreno DESC;

SELECT * FROM peliculas LEFT JOIN reparto ON peliculas.id=reparto.id WHERE estreno='2008' ORDER BY peliculas;

SELECT * FROM peliculas LEFT JOIN reparto ON peliculas.id=reparto.id WHERE peliculas='El caballero oscuro';