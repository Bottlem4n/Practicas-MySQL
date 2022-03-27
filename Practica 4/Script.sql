use Ventas_X1;
select @@AUTOCOMMIT;
set autocommit = 0;

select * from factura;
select * from det_fact;

-- Altera tabla det_fact y adiciona el campo prec_art_fact de tipo money
alter table det_fact add prec_art_fact decimal(10,2);
select * from det_fact;

-- Actualiza el precio de la tabla det_fact de la factura 3 del articulo 23
update det_fact set prec_art_fact = 10.25 where id_fact = 3 and id_art = 23;

-- verifica la actualización del precio
select * from det_fact;

-- este programita actualiza en forma automatica ciertos registros
DELIMITER $$
create procedure upd_prec_art_fact()
BEGIN
	set @cont = 0;
    set @cont = (select count(cant_art) from det_fact);
    select @cont;
    WHILE @cont > 0 DO
		-- select @cont;
        update det_fact set prec_art_fact = (12.00*@cont), cant_art = cant_art + 5 
				where id_fact = @cont; 
		set @cont = @cont - 1;
	END WHILE;
END
$$
DELIMITER ;

COMMIT;

call upd_prec_art_fact();

ROLLBACK;

-- Muestra la tabla det_detfac con los campos calculados costo_x_art e iva

select id_fact, id_art, cant_art ,
	concat('$ ', FORMAT((prec_art_fact), 2)) as prec_art_fact, 
	concat('$ ', FORMAT((cant_art * prec_art_fact), 2))  as costo_x_art ,
	concat('$ ', FORMAT((cant_art * prec_art_fact * 0.16), 2))  as iva
from det_fact;

-- Muestra los campos de la tabla det_detfac con los campos calculados
-- costo_x_art e iva y el total por articulo solo de la factura 3

select id_fact, id_art, cant_art ,
	concat('$ ', FORMAT((prec_art_fact), 2)) as prec_art_fact, 
	concat('$ ', FORMAT((cant_art * prec_art_fact), 2))  as costo_x_art ,
	concat('$ ', FORMAT((cant_art * prec_art_fact * 0.16), 2))  as iva,
    concat('$ ', FORMAT( (cant_art * prec_art_fact * 1.16), 2))  as tot_partida
from det_fact where id_fact = 3;

-- Altera tabla det_fact y adiciona el campo costo_x_art de tipo real
alter table det_fact add costo_x_art real;
select * from det_fact;

-- Actualiza costo_x_art de la tabla det_fact calcula con items de la tabla
update det_fact set costo_x_art = cant_art * prec_art_fact where id_fact >0;

-- Muestra los campos de la tabla det_detfac con los campos calculados
-- desc_art, costo_x_art

select id_fact, id_art, cant_art,
	concat('$ ', FORMAT((prec_art_fact), 2)) as prec_art_fact,
    concat('$ ', FORMAT((costo_x_art), 2)) as costo_x_art,
    concat('$ ', FORMAT((cant_art * prec_art_fact *.10),2)) as desc_art,
	concat('$ ', FORMAT((cant_art * prec_art_fact * 0.90),2)) as costo_x_art_desc
from det_fact;

-- Altera tabla det_fact y elimina el campo precio_art y costo_x_art
alter table det_fact drop column prec_art_fact,  drop column costo_x_art;
select * from det_fact;

-- Se muestran los registros de la tabla de articulos que cumplan
-- la condicines de los operadores relacionales.
Select * from articulo;
select * from articulo where prec_art > 50;
select * from articulo where prec_art < 50;
select * from articulo where prec_art <= 50;
select * from articulo where prec_art <> 50;
select * from articulo where prec_art = 50;
select * from articulo where prec_art > 50 and prec_art < 150;
select * from articulo where prec_art >= 50 and prec_art <= 150;
select * from articulo where not (prec_art = 125.45 or prec_art = 50);

-- operador like se utiliza para filtar busqueda que cumpla un patrón
select * from articulo;
select * from articulo where nom_art like '[P,m,g]%'; -- algun caracter Pmg
select * from articulo where nom_art like '%a_a%'; -- cualquier caracter
select * from articulo where nom_art like 'p%'; -- cualquier string
select * from articulo where nom_art like '_a%';


-- operador between para filtar entre un rango

-- operador order by para ordenar asc o desc
-- operador top muestra nro de registros al inicio de la consulta
Select * from articulo;

select id_art, nom_art, prec_art from articulo
where id_art between 20 and 60
order by nom_art desc, prec_art asc limit 4;

-- operador distinc muesta los valores distintos de una columna
-- operador as pone un alias al nombre de la columna

select distinct id_fact as No_Factura from det_fact;

-- operador in filtra registros que cumplan los valores especificados
select * from articulo where nom_art in ('silla', 'sala');
select * from articulo where id_art in (15,23,54);

-- función count(column)cuenta el numero de regs. respecto a la columna
select * from articulo;
select COUNT(prec_art) as no_registros from articulo;
select COUNT(prec_art) as prec_mayor_a100 from articulo
where prec_art > 100.00;

-- función min, max, avg, sum determina un valor

-- sobre el total de registros Verifique los Resultados.

select MIN(prec_art) as precio_minino from articulo;

select Max(prec_art) precio_maximo from articulo;

select avg(prec_art) as precio_promedio from articulo;

select SUM(cant_art) art_facturados from det_fact;

select * from det_fact;

-- creación de una vista (tabla) en base a una consulta
CREATE view v_costo_x3_art as
select det_fact.id_fact, det_fact.id_art, nom_art, cant_art, prec_art
from det_fact join articulo on det_fact.id_art = articulo.id_art;

select * from v_costo_x3_art;

-- se puede consultar la inf. de la vista como si fuera una tabla normal

select * from v_costo_x3_art;

select *,(cant_art * prec_art) as costo_x_art from v_costo_x3_art;

select *, (cant_art * prec_art) as costo_x_art from v_costo_x3_art
where id_fact = 1;

select sum(cant_art * prec_art) as Tot_x_Fact from v_costo_x3_art
where id_fact = 1;

-- creacion de una vista en base a una consulta multitabla

create view v_det_fact_art1 as
select det_fact.id_fact, factura.id_cliente, nomb_clie,
det_fact.id_art,articulo.nom_art, cant_art,
prec_art, (cant_art * prec_art) as costo_x_art
from det_fact join articulo on det_fact.id_art = articulo.id_art
join factura on det_fact.id_fact = factura.id_fact
join cliente on factura.id_cliente = cliente.id_cliente;

select * from v_det_fact_art1;

select * from v_det_fact_art1 where id_fact = 4;

select sum(costo_x_art) as Tot_x_Fact
from v_det_fact_art1 where id_fact = 4;

-- continuación de vistas
create view v_fact_clie as
select id_fact, factura.id_cliente, nomb_clie
from factura join cliente on factura.id_cliente = cliente.id_cliente;

create view v_det_art as
select id_fact, det_fact.id_art, nom_art, cant_art
from det_fact join articulo on det_fact.id_art = articulo.id_art;

-- se puede consultar la inf. de las vistas como si fuera una tabla
select * from v_fact_clie;
select * from v_det_art;

-- se puede hacer Join con las vistas
select v_fact_clie.id_fact, id_cliente, nomb_clie, id_art, nom_art, cant_art
from v_fact_clie join v_det_art on v_fact_clie.id_fact = v_det_art.id_fact