/**
Primer modelo
**/
CREATE TABLE departamento(
    id_departamento INT,
    nombre_departamento VARCHAR(25),
    PRIMARY KEY (id_departamento)
);

CREATE TABLE trabajador(
    rut_trabajador INT,
    departamento_id INT,
    nombre VARCHAR(25),
    direccion VARCHAR(30),
    PRIMARY KEY(rut_trabajador),
    FOREIGN KEY (departamento_id) REFERENCES departamento(id_departamento)
);


CREATE TABLE liquidaciones(
    url_drive VARCHAR(100),
    id_trabajador INT,
    mes_liquidacion VARCHAR(50),
    PRIMARY KEY(url_drive),
    FOREIGN KEY(id_trabajador) REFERENCES trabajador(rut_trabajador)
);


/**
Segundo Modelo
**/


CREATE TABLE profesor(
    id_profesor INT,
    rut_profesor VARCHAR(11)
    nombre_profesor VARCHAR(25),
    departamento VARCHAR(25),
    PRIMARY KEY (id_profesor)
);

CREATE TABLE alumno(
    id_alumno INT,
    rut_alumno VARCHAR(11)
    nombre_alumno VARCHAR(25),
    PRIMARY KEY (id_alumno)
);

CREATE TABLE curso(
    letra_curso INT,
    profesor_id INT,
    alumno_id INT,
    PRIMARY KEY(letra_curso),
    FOREIGN KEY (profesor_id) REFERENCES profesor(id_profesor),
    FOREIGN KEY (alumno_id) REFERENCES alumno(id_alumno)
);


CREATE TABLE prueba(
    id_prueba INT,
    departamento_prueba VARCHAR (25),
    contenido_prueba VARCHAR(10),
    puntaje VARCHAR(25),
    PRIMARY KEY (id_prueba),
    FOREIGN KEY(evaluacion_curso) REFERENCES curso(letra_curso)

);

/**
En la retroalimentación me indicaste que las FK no pueden ser VARCHAR, como 
me generaba problema el rut por el guión y los terminados en k, agregue un identificado
por categoria
**/