use Ventas_X1;

DELIMITER $$ 
CREATE PROCEDURE `sp_test` ()
BEGIN
	SET @cont = 0;
    WHILE (@cont < 5) DO
		IF @cont < 3 THEN
			select ('Hola Charly ' + cast(@cont as CHAR(20)));
		ELSE 
			select ('Hello Friends ' + cast(@cont as CHAR(20)));
		END IF;
        SET @cont = @cont + 1;
    
    END WHILE;
END
$$
DELIMITER ;

CALL sp_test();

DELIMITER $$
create procedure `sp_alt_det_fact` ( id_fact int, id_art int, cant_art float )
BEGIN
	insert into det_fact values (id_fact,id_art,cant_art);
END
$$
DELIMITER ;


select * from det_fact;
insert into factura value (5,48,225,default,null);
select * from factura;
select * from articulo;

call sp_alt_det_fact(5,15,100);
call sp_alt_det_fact(5,32,30);
call sp_alt_det_fact(5,54,10);

select * from det_fact;

DELIMITER $$
create procedure `sp_borra_det_fact` ( id_fact int, id_art int)
BEGIN
	delete from det_fact where det_fact.id_fact = id_fact and det_fact.id_art = id_art ;
END
$$
DELIMITER ; 

call sp_borra_det_fact(5,15);
select * from det_fact;

-- Cambios
DELIMITER $$
create procedure `sp_act_det_fact` (  id_fact int, id_art int, cant_art float)
BEGIN
	update det_fact set det_fact.cant_art = cant_art where det_fact.id_fact = id_fact and det_fact.id_art = id_art;
END
$$
DELIMITER ; 

call sp_act_det_fact(5,54,150);
select * from det_fact;

-- store procedure para consultar cualquier factura
-- sus productos, importes y total por articulo
DELIMITER $$
create procedure `sp_cons_factura` (  id_fact int)
BEGIN
	select * from v_det_fact_art1 where v_det_fact_art1.id_fact = id_fact;
    select sum(costo_x_art) as Tot_x_Fact
	from v_det_fact_art1 where v_det_fact_art1.id_fact = id_fact;
END
$$
DELIMITER ; 

call sp_cons_factura(1);

alter table factura add tipo varchar(1);
update factura set tipo = 'A' where id_fact > 0;
alter table factura drop column tipo;


-- Prueba del Case
DELIMITER $$
create procedure `sp_test_case` ()
BEGIN
	SET @cont = (select max(id_fact) from factura);
    WHILE (@cont > 0) DO
		update factura 
			set tipo = (case 
							when ((total_fact) <= 100) then 'X'
                            when ((total_fact) <= 200) then 'Y'
                            ELSE 'Z'
						end)
			WHERE id_fact = @cont;		
			set @cont = @cont - 1;
    END WHILE;
    select * from facturas_cambios;
END
$$
DELIMITER ; 

select * from facturas_cambios;

call sp_test_case();

select * from factura;

DELIMITER $$

CREATE TRIGGER after_factura_update
AFTER UPDATE
ON factura FOR EACH ROW
BEGIN
	create temporary table IF NOT EXISTS facturas_cambios( BeforeValue char(1), AfterValue char(1));
    IF OLD.tipo <> new.tipo THEN
        INSERT INTO facturas_cambios( BeforeValue, AfterValue)
        VALUES(OLD.tipo, new.tipo);
    END IF;
END$$

DELIMITER ;

select * from facturas_cambios;
select * from information_schema.triggers;
show create trigger after_factura_update;
drop trigger after_factura_update;


DELIMITER $$
create function ventas_x1.SEMANA_ISO (Fecha DATE)
	returns int
    DETERMINISTIC
BEGIN
	declare semana_iso int;
    set semana_iso = WEEKOFYEAR(Fecha);
	return semana_iso;
	
END$$

DELIMITER ;

select ventas_x1.SEMANA_ISO ('2014-12-28');
select ventas_x1.SEMANA_ISO ('2014-12-31');
select ventas_x1.SEMANA_ISO ('2015-01-01');
select ventas_x1.SEMANA_ISO ('2015-07-01');

SELECT cliente.id_cliente, articulo.id_art, articulo.nom_art, SUM(det_fact.cant_art) AS 'Tot Prod Fact'

FROM articulo

JOIN det_fact ON det_fact.id_art = articulo.id_art

JOIN factura ON factura.id_fact = det_fact.id_fact

JOIN cliente ON factura.id_cliente = cliente.id_cliente

WHERE cliente.id_cliente in (45,47,48)

GROUP BY cliente.id_cliente, articulo.id_art, articulo.nom_art

ORDER BY cliente.id_cliente;

select * from det_fact;
select * from factura;