/**
Parte 1 Crear Módelo Lógico y Físico
**/

CREATE DATABASE prueba_1;
\c prueba_1;

CREATE TABLE categoria(
    id_categoria INT,
    nombre_categoria VARCHAR(25),
    descripcion_categoria VARCHAR(50),
    PRIMARY KEY(id_categoria)
);

CREATE TABLE cliente(
    id_cliente INT,
    nombre_cliente VARCHAR(25),
    rut VARCHAR(25),
    direccion VARCHAR(50),
    PRIMARY KEY(id_cliente)
);

CREATE TABLE producto(
    id_producto INT,
    categoria_id INT,
    nombre_producto VARCHAR(25),
    valor_unitario INT,
    descripcion_producto VARCHAR(50),
    PRIMARY KEY (id_producto),
    FOREIGN KEY (categoria_id) REFERENCES categoria(id_categoria)
);

CREATE TABLE factura(
    n_factura INT,
    cliente_id INT,
    fecha_factura DATE, 
    PRIMARY KEY(n_factura),
    FOREIGN KEY (cliente_id) REFERENCES cliente(id_cliente)
);

CREATE TABLE factura_producto(
    id_factura_producto INT,
    factura_n INT,
    producto_id INT,
    cantidad INT,
    valor_total_producto INT,
    subtotal INT, 
    iva INT, 
    total_pagar INT,
    PRIMARY KEY (id_factura_producto),
    FOREIGN KEY (factura_n) REFERENCES factura(n_factura),
    FOREIGN KEY (producto_id) REFERENCES producto(id_producto)
);


/**
Parte 2: CREANDO EL MODELO EN LA BASE DE DATOS

crear 5 clientes
**/
INSERT INTO cliente(id_cliente,nombre_cliente,rut,direccion) VALUES (1,'Juan Gabriel','16.274.992-4','Camino el Alba 2345, Maipú');
INSERT INTO cliente(id_cliente,nombre_cliente,rut,direccion) VALUES (2,'Enrique Iglesias','7.666.666-k','Gabriela Poniente 1254, Puente Alto');
INSERT INTO cliente(id_cliente,nombre_cliente,rut,direccion) VALUES (3,'Pedro Fernández','20.238.597-0','Fernandez Albano 0938, La Cisterna');
INSERT INTO cliente(id_cliente,nombre_cliente,rut,direccion) VALUES (4,'Luis Miguel','17.212,216-9','Lo Martinez 12, La Pintana');
INSERT INTO cliente(id_cliente,nombre_cliente,rut,direccion) VALUES (5,'Víctor Jara','22.385.993-1','Lomas del Aglomerado 12455, Las Condes');


/**
crear 3 categorias
**/
INSERT INTO categoria(id_categoria,nombre_categoria,descripcion_categoria) VALUES (1,'Guitarras','Guitarras Eléctricas Epiphone');
INSERT INTO categoria(id_categoria,nombre_categoria,descripcion_categoria) VALUES (2,'Bajos','Bajos Ibanez serie sb');
INSERT INTO categoria(id_categoria,nombre_categoria,descripcion_categoria) VALUES (3,'Baterias','Baterias TAMA serie premiun');


/**
crear 8 productos
**/
INSERT INTO producto(id_producto,categoria_id,nombre_producto,valor_unitario,descripcion_producto) VALUES(1,1,'Telecaster', 160000,'Guitarra modelo Telecaster made in USA');
INSERT INTO producto(id_producto,categoria_id,nombre_producto,valor_unitario,descripcion_producto) VALUES(2,1,'Estratocaster', 200000,'Guitarra modelo Estratocaster made in Japan');
INSERT INTO producto(id_producto,categoria_id,nombre_producto,valor_unitario,descripcion_producto) VALUES(3,1,'SG', 250000,'Guitarra SG especial 50 años Epiphone made in USA');
INSERT INTO producto(id_producto,categoria_id,nombre_producto,valor_unitario,descripcion_producto) VALUES(4,2,'GIO SERIES', 180000,'Bajo Ibanez SERIE GIO capsulas pasivas made in USA');
INSERT INTO producto(id_producto,categoria_id,nombre_producto,valor_unitario,descripcion_producto) VALUES(5,2,'SOUNDGEAR PREMIUN', 450000,'Bajo Ibanez edición especial made in Japan');
INSERT INTO producto(id_producto,categoria_id,nombre_producto,valor_unitario,descripcion_producto) VALUES(6,2,'TALMAN TMB', 250000,'Bajo Ibanez promoción apertura mande in Corea');
INSERT INTO producto(id_producto,categoria_id,nombre_producto,valor_unitario,descripcion_producto) VALUES(7,3,'IMPERIALSTAR', 250000,'Batería TAMA modelo MATE made un USA');
INSERT INTO producto(id_producto,categoria_id,nombre_producto,valor_unitario,descripcion_producto) VALUES(8,3,'SUPERSTAR', 250000,'Batería TAMA modelo Cocktail JAM made in USA');



/**
crear 10 facturas
**/

INSERT INTO factura(n_factura,cliente_id,fecha_factura) VALUES (1,'1','2020-03-15');
INSERT INTO factura_producto(id_factura_producto,factura_n,producto_id,cantidad,valor_total_producto,subtotal,iva,total_pagar)
VALUES(1,1,1,2,320000,320000,32000,352000);

INSERT INTO factura(n_factura,cliente_id,fecha_factura) VALUES (2,'1','2020-05-01');
INSERT INTO factura_producto(id_factura_producto,factura_n,producto_id,cantidad,valor_total_producto,subtotal,iva,total_pagar)
VALUES(2,1,1,3,480000,480000,48000,528000);

INSERT INTO factura(n_factura,cliente_id,fecha_factura) VALUES (3,'2','2020-06-01');
INSERT INTO factura_producto(id_factura_producto,factura_n,producto_id,cantidad,valor_total_producto,subtotal,iva,total_pagar)
VALUES(3,3,4,3,540000,540000,54000,594000);

INSERT INTO factura(n_factura,cliente_id,fecha_factura) VALUES (4,'2','2020-07-01');
INSERT INTO factura_producto(id_factura_producto,factura_n,producto_id,cantidad,valor_total_producto,subtotal,iva,total_pagar)
VALUES(4,4,2,2,400000,400000,40000,440000);

INSERT INTO factura(n_factura,cliente_id,fecha_factura) VALUES (5,'2','2020-07-11');
INSERT INTO factura_producto(id_factura_producto,factura_n,producto_id,cantidad,valor_total_producto,subtotal,iva,total_pagar)
VALUES(5,5,8,3,750000,750000,75000,825000);


INSERT INTO factura(n_factura,cliente_id,fecha_factura) VALUES (6,'3','2020-08-15');
INSERT INTO factura_producto(id_factura_producto,factura_n,producto_id,cantidad,valor_total_producto,subtotal,iva,total_pagar)
VALUES(6,6,5,1,450000,450000,45000,495000);


INSERT INTO factura(n_factura,cliente_id,fecha_factura) VALUES (7,'4','2020-09-15');
INSERT INTO factura_producto(id_factura_producto,factura_n,producto_id,cantidad,valor_total_producto,subtotal,iva,total_pagar)
VALUES(7,7,1,2,160000,320000,32000,352000);

INSERT INTO factura(n_factura,cliente_id,fecha_factura) VALUES (8,'4','2020-09-17');
INSERT INTO factura_producto(id_factura_producto,factura_n,producto_id,cantidad,valor_total_producto,subtotal,iva,total_pagar)
VALUES(8,8,6,3,750000,750000,75000,825000);

INSERT INTO factura(n_factura,cliente_id,fecha_factura) VALUES (9,'4','2020-10-01');
INSERT INTO factura_producto(id_factura_producto,factura_n,producto_id,cantidad,valor_total_producto,subtotal,iva,total_pagar)
VALUES(9,9,7,4,1000000,1000000,100000,1100000);

INSERT INTO factura(n_factura,cliente_id,fecha_factura) VALUES (10,'4','2020-12-24');
INSERT INTO factura_producto(id_factura_producto,factura_n,producto_id,cantidad,valor_total_producto,subtotal,iva,total_pagar)
VALUES(10,10,1,1,160000,160000,16000,176000);



/**
Parte 3 Consultas
1. ¿Qué cliente realizó la compra mas cara?
**/

SELECT* FROM factura_producto ORDER BY total_pagar DESC LIMIT (1);
SELECT*FROM factura WHERE n_factura='9';
SELECT *FROM cliente WHERE id_cliente='4';

SELECT nombre_cliente FROM cliente WHERE id_cliente IN (SELECT cliente_id FROM factura WHERE cliente_id='4');


/**
id_cliente | nombre_cliente |     rut      |         direccion          
------------+----------------+--------------+----------------------------
          4 | Luis Miguel    | 17.212,216-9 | Lo Martinez 12, La Pintana
**/

/**
Parte 3 Consultas
2. ¿Qué cliente pago sobre 100 de monto? ( le puse sobre  500000 por los montos)
**/

SELECT* FROM factura_producto WHERE total_pagar>='500000';

/**
Parte 3 Consultas
3. ¿Cuántos clientes han comprado el producto 6?
**/

 SELECT COUNT(producto_id)FROM factura_producto WHERE producto_id='6';

/**

Solo un cliente
 -------
     1
(1 row)
**/
