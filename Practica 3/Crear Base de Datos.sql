create database Ventas_X1;
use Ventas_X1;

-- drop database ventas_x1;

CREATE TABLE Usuarios (
    id_usuario INT AUTO_INCREMENT,
    nombre_usuario VARCHAR(40),
    contrasena VARCHAR(20),
    PRIMARY KEY (id_usuario)
);

insert into Usuarios values (null,'Juanito', 'xxxx123');
insert into Usuarios values (null, 'Luis', 'YYYY126');

SELECT 
    *
FROM
    Usuarios;

CREATE TABLE cliente (
    id_cliente INT NOT NULL,
    nomb_clie VARCHAR(40),
    rfc_clie VARCHAR(11) NOT NULL CHECK (rfc_clie RLIKE '[A-z][A-z][A-z][A-z]-[0-9][0-9][0-9][0-9][0-9][0-9]'),
    tel_clie VARCHAR(15) DEFAULT '999999999999999',
    dir_clie VARCHAR(40),
    suspendido BIT DEFAULT 0,
    primary key (id_cliente)
);

insert into cliente values (45,'Jose Hdez.', 'XWXA-910101',default,'sur 30', 0);
insert into cliente values (41,'Pedro Olvera', 'AGXA-910101','5544466677','sur 31',default);
insert into cliente values (47,'Luis Piedra', 'BBXA-910101','5544466677','sur 32', 1);
insert into cliente values (48,'Osvaldo IX', 'LLXA-910101','5544466677','sur 33', 0);
insert into cliente values (49,'Ricardo Mtz.', 'CcXA-910101','5544466677','sur 34', 1);
insert into cliente values (44,'Rosa Alamraz', 'RtXA-910101','5544466677','sur 34', 0);
-- drop table cliente;

SELECT 
    *
FROM
    cliente;

CREATE TABLE articulo (
    id_art INT NOT NULL PRIMARY KEY,
    nom_art VARCHAR(25) DEFAULT 'XXXXXXXXXXXXXX',
    prec_art DECIMAL (10 , 2 ) DEFAULT 0.0000,
    peso_art DECIMAL(10 , 2 ),
    existencia FLOAT,
    color_art INT CHECK (color_art BETWEEN 0 AND 20),
    um_art VARCHAR(10) DEFAULT 'DEF_PZA'
);

insert into articulo (id_art, prec_art, peso_art, existencia, color_art) values (15, 121.45467, 130.2366, 44.2366, 10);
insert into articulo values (22, 'Mesa', 1000.45463, 50.2345, 200.23459, 10, 'Conjunto');
insert into articulo values (23, 'Silla', 300.4500, 15.2379, 1.2379, 15, 'kid 4' );
insert into articulo values (24, 'Silla', 100.4500, 15.2379, 1.2379, 15, 'kid 4' );
insert into articulo values (32,'Sala', truncate('10000.45999',2),truncate( 40.2399,2) ,200.2399, 3, 'kid 3' );
insert into articulo values (50, 'Puerta', 125.45111, 10.2311, 200.2311, 4, 'PZA');
insert into articulo values (54, 'Lampara', 50.00, 20.00, 10.00, 6, 'PZA');
insert into articulo values (64, 'Estufa', 10.25, 10.00, 10.00, 7, 'PZA');
insert into articulo values (53, 'Gancho', 20.377, 20.00, 10.00, 6, 'PZA');
insert into articulo values (63, 'Taza', 70.254, 10.00, 10.00, 7, 'PZA');
-- delete from  articulo where id_art = 32;
-- drop table articulo;
SELECT 
    *
FROM
    articulo; 

create table factura
(
	id_fact int not null primary key,
    id_cliente int not null,
    total_fact decimal (10,2),
    fecha_fact date default (current_date),
    fecha_entrega date null,
    foreign key (id_cliente) references cliente (id_cliente) on delete cascade
);

insert into factura values (1, 45, 100.00, default, '2012-05-16');
insert into factura (id_fact, id_cliente, total_fact) values (2, 47, 111.25);
insert into factura values (3, 45, 150.50, '2012/05/16', '2012-05-31');
insert into factura values (4, 48, 101.25, '2012/05/16', '2012-05-31');

-- insert into factura values (6, 44, 255.12, '2012/05/16', '2012-05-31',NULL);

-- drop table factura;

SELECT 
    *
FROM
    factura;

CREATE TABLE det_fact (
    id_fact INT NOT NULL,
    id_art INT NOT NULL,
    cant_art FLOAT,
    PRIMARY KEY (id_fact , id_art),
    FOREIGN KEY (id_fact)
        REFERENCES factura (id_fact)
        ON DELETE CASCADE,
    FOREIGN KEY (id_art)
        REFERENCES articulo (id_art)
        ON UPDATE CASCADE
);

insert into det_fact ( id_fact, cant_art) values ( 1, 2.0); -- Falta id_art

insert into det_fact values ( 1, 54, 1.0);
insert into det_fact values ( 1, 32, 2.0);
insert into det_fact values ( 3, 15, 1.0);
insert into det_fact values ( 3, 23, 5.0);
insert into det_fact values ( 2, 32, 1.0);
insert into det_fact values ( 2, 54, 5.0);
insert into det_fact values ( 4, 15, 1.0);
insert into det_fact values ( 4, 32, 5.0);
insert into det_fact values ( 5, 32, 1.0);
insert into det_fact values ( 5, 64, 5.0);
insert into det_fact values ( 6, 32, 5.0);
insert into det_fact values ( 6, 63, 1.0);

drop table det_fact;

SELECT 
    *
FROM
    det_fact;

-- Verificar borrar cliente con sus facturas en cascada
select * from cliente where id_cliente = 47;
select * from factura where id_fact = 2;
select * from det_fact where id_fact = 2;

-- 1) Borrar factura
delete from factura where id_fact = 2;
-- 2) Borrar Cliente con sus facturas
delete from cliente where id_cliente = 45;

-- 2do paso Veriicar si se puede Actualizar Articulo en Factura Clausula On update Cascada
select * from cliente where id_cliente = 47;
Select * from det_fact where id_fact = 2;
update articulo set id_art = 15 where id_art = 17;

-- update factura set id_cliente = 47 where id_fact = 5;

-- 3er paso Verificar si se puede Borrar Articulo Clausula On Delete
Drop table articulo;

-- Paso cuatro intente borrar una fila de Articulos Observe el error
delete from articulo where id_art = 15;

-- Verique que pasa con las demas tablas al borrar la tabla del cliente
delete from cliente where id_cliente>1;