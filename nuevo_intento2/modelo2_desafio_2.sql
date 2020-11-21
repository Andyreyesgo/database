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
    rut_profesor VARCHAR(15),
    nombre_profesor VARCHAR(25),
    departamento VARCHAR (25),
    PRIMARY KEY (rut_profesor)
);
CREATE TABLE alumno(
    rut_alumno VARCHAR(15),
    nombre_alumno VARCHAR(25),
    PRIMARY KEY(rut_alumno)
);
CREATE TABLE curso(
    letra_curso VARCHAR (10),
    alumno_id VARCHAR(15),
    profesor_id VARCHAR(15),
    PRIMARY KEY(letra_curso),
    FOREIGN KEY (alumno_id) REFERENCES alumno(rut_alumno),
    FOREIGN KEY (profesor_id) REFERENCES profesor(rut_profesor)
);
CREATE TABLE prueba(
    id_prueba INT,
    evaluacion_curso VARCHAR(10),
    puntaje VARCHAR(10),
    PRIMARY KEY (id_prueba),
    FOREIGN KEY (evaluacion_curso) REFERENCES curso(letra_curso)
);