SELECT * FROM articulo;
SELECT * FROM factura;

DELIMITER $$
DROP procedure if exists sp_transacciones $$
create procedure sp_transacciones()

BEGIN
	DECLARE exit handler for SQLEXCEPTION
		BEGIN
			ROLLBACK;
			GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
			@errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
			SET @full_error = CONCAT("ERROR ", @errno, " (", @sqlstate, "): ", @text);
			SELECT @full_error as 'Prueba de Errores';
		END;
        
	START TRANSACTION; -- Evita el AUTOCOMMINT de MYSQL
    insert into articulo values (33, 'Mesa 33', 1000.45463, 50.2345, 200.23459, 20, 'Conjunto');
	insert into articulo values (34, 'Silla 34', 300.4500, 15.2379, 1.2379, 5, 'kid 4' );
    Select * from articulo;
    insert into factura (id_fact, id_cliente,total_fact, fecha_fact, fecha_entrega) values (10, 48, 1000.00,'2020/6/8','2020/6/30');
	Commit;
END;
$$
DELIMITER ;

CALL sp_transacciones();
Select * from articulo;
Select * from factura;
Select * from factura where id_fact=10;
DELETE FROM factura where id_fact=10;
DELETE FROM articulo where id_art =33 or id_art =34 ;