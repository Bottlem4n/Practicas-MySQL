insert into cat_clie values (45,'Jose Hdez.','5544466677','sur 30');
insert into cat_clie values (46,'Pedro Olvera','5544466677','sur 31');
insert into cat_clie values (47,'Luis Piedra','5544466677','sur 32');
insert into cat_clie values (48,'Osvaldo Sánchez','5544466677','sur 33');
insert into cat_clie values (49,'Ricardo Mtz.','5544466677','sur 34');

insert into factura values (1, 45, 100.00, '2012-05-16','');
insert into factura values (2, 45, 150.50, '2012-05-16','');
insert into factura values (3, 46, 101.25, '2012-05-16','');
insert into factura values (4, 47, 111.25, '2012-05-16','');

insert into articulo values (32, 'flexometro', 25.25);
insert into articulo values (54, 'pala', 100.00);
insert into articulo values (64, 'pico', 150.00);
insert into articulo values (22, 'carretilla', 950);
insert into articulo values (15, 'cuchara', 50.00);
insert into articulo values (23, 'desarmador', 10.25);

-- Inserta registros en la tabla de detalle de facturas

insert into det_fact values ( 1, 15, 2.0);
insert into det_fact values ( 1, 54, 1.0);
insert into det_fact values ( 1, 32, 2.0);
insert into det_fact values ( 3, 15, 1.0);
insert into det_fact values ( 3, 23, 5.0);
insert into det_fact values ( 2, 32, 1.0);
insert into det_fact values ( 2, 23, 5.0);
insert into det_fact values ( 4, 15, 1.0);
insert into det_fact values ( 4, 32, 5.0);

select * from cat_clie;
select * from factura;
select * from articulo;
select * from det_fact;


delete from factura where id_fact = 1;

