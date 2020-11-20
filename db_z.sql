/*
* Pregunta 1
*/

CREATE DATABASE posts;

/*
* Pregunta 2
*/

CREATE TABLE posts (
    id SERIAL, 
    user_name VARCHAR(25),
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    content VARCHAR(50),
    description_1 VARCHAR(50),
    PRIMARY KEY (id)
);


/*
* Pregunta 3
*/

INSERT INTO posts (id, user_name, content, description_1) VALUES ('1','Pamela','My first user post','First post');
INSERT INTO posts WHERE(id)='1' (user_name, content, description_1) VALUES ('Pamela','Second user post','Second post') ;
INSERT INTO posts (id,user_name, content, description_1) VALUES ('2','Carlos','Third user post','Tercer post');


/*
* Pregunta 4
*/

ALTER TABLE posts ADD title VARCHAR(25);

/*
* Pregunta 5
*/

INSERT INTO posts (id, user_name, content, description_1, title) VALUES ('3','Pedro','The fourth post','Cuarto post','Titulo_1');
INSERT INTO posts (id, user_name, content, description_1, title) VALUES ('3','Pedro','Again Pedro','Quinto post','Titulo_2');

/*
* Pregunta 6
*/

DELETE FROM posts WHERE id='2';

/*
* Pregunta 6
*/

INSERT FROM posts (id, user_name,content,description_1,title)VALUES('4','Carlos', 'I put Carlos again', 'Undertaker post', 'Ingeniere');



/*
* Pregunta 2.1
*/

CREATE TABLE comentarios(
    id_coments VARCHAR(25),
    date_comentarios DATE,
    time_comentarios TIME
    FOREIGN KEY (id_coments) REFERENCES posts(id)
);

/*
* Pregunta 9
*/

INSERT INTO comentarios (id_coments, date_comentarios,time_comentarios) VALUES ('1','2020-11-13','23:13:09');
INSERT INTO comentarios (id_coments, date_comentarios,time_comentarios) VALUES ('1','2020-11-13','23:15:00');

INSERT INTO comentarios (id_coments, date_comentarios,time_comentarios) VALUES ('4','2020-11-13','10:00:00');
INSERT INTO comentarios (id_coments, date_comentarios,time_comentarios) VALUES ('4','2020-11-13','10:00:59');
INSERT INTO comentarios (id_coments, date_comentarios,time_comentarios) VALUES ('4','2020-11-13','11:00:00');
INSERT INTO comentarios (id_coments, date_comentarios,time_comentarios) VALUES ('4','2020-11-13','11:00:01');


/*
* Pregunta 10
*/

INSERT INTO posts (id, user_name, content, description_1, title) VALUES ('5','Margarita','First relational post','Post over posts','Titulo_M');


/*
* Pregunta 11
*/

INSERT INTO comentarios (id_coments, date_comentarios,time_comentarios) VALUES ('5','2020-11-13','10:00:00');
INSERT INTO comentarios (id_coments, date_comentarios,time_comentarios) VALUES ('5','2020-11-13','10:10:00');
INSERT INTO comentarios (id_coments, date_comentarios,time_comentarios) VALUES ('5','2020-11-13','10:20:00');
INSERT INTO comentarios (id_coments, date_comentarios,time_comentarios) VALUES ('5','2020-11-13','10:25:00');
INSERT INTO comentarios (id_coments, date_comentarios,time_comentarios) VALUES ('5','2020-11-13','10:30:00');
