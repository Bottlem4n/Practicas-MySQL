DELIMITER $$

DROP procedure if exists sp_rep_vtasxproducto $$
create procedure sp_rep_vtasxproducto()
BLOCK1: BEGIN
    
	DECLARE finished INTEGER DEFAULT 0;
    
    DECLARE id INT;
    DECLARE nombre_cliente VARCHAR(50);
    DECLARE id_factura INT;
    DECLARE id_articulo INT;
    DECLARE nombre_articulo VARCHAR(30);
    DECLARE cantidad_articulo FLOAT;
    DECLARE total FLOAT;
	
    DECLARE cte_prod_cursor CURSOR FOR SELECT id_art, nom_art FROM articulo ORDER BY id_art;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;    

    OPEN cte_prod_cursor;
    
    obtenerProductos: LOOP
		FETCH NEXT FROM cte_prod_cursor INTO id_articulo, nombre_articulo;
        IF finished = 1 THEN
			LEAVE obtenerProductos;
		END IF;
        
        BLOCK2: BEGIN
			DECLARE final INTEGER DEFAULT 0;
            DECLARE prod_fact_cursor CURSOR FOR SELECT fa.id_fact, art.id_art, art.nom_art, det_fact.cant_art FROM det_fact join factura as fa on det_fact.id_fact = fa.id_fact 
                    join articulo art on det_fact.id_art = art.id_art and det_fact.id_art = id_articulo;
			DECLARE CONTINUE HANDLER FOR NOT FOUND SET final = 1;
            
            OPEN prod_fact_cursor;
				getFacturas: LOOP
				FETCH NEXT FROM  prod_fact_cursor INTO id_factura, id_articulo, nombre_articulo, cantidad_articulo;
				IF final <> 0 THEN
					SELECT "Facturas del Producto: " as '', id_articulo as '', nombre_articulo as '','' UNION
					SELECT '','','','' UNION
					SELECT "No Hay Productos Facturados", "", "", "";
					LEAVE getFacturas;
				END IF;
				
					SELECT "Facturas del Producto: " as '', id_articulo as '', nombre_articulo as '','' UNION
					SELECT '','','','' UNION
					SELECT "Fact.", "Prod", "Nombre", "Cantidad" UNION
					SELECT fa.id_fact, art.id_art, art.nom_art, det_fact.cant_art FROM det_fact join factura as fa on det_fact.id_fact = fa.id_fact 
                    join articulo art on det_fact.id_art = art.id_art and det_fact.id_art = id_articulo UNION
                    SELECT '','','','----------' UNION
                    SELECT '','','TOTAL: ', SUM(cant_art) FROM det_fact where det_fact.id_art = id_articulo ;
					LEAVE getFacturas;
				END LOOP getFacturas;
            CLOSE prod_fact_cursor;
        END BLOCK2;

	END LOOP obtenerProductos;
    CLOSE cte_prod_cursor;
    
END BLOCK1;
$$
DELIMITER ;

call sp_rep_vtasxproducto();

insert into factura values (7, 49, 121.42, '2012/05/16', '2012-05-31',NULL);
insert into factura values (8, 41, 121.42, '2012/05/16', '2012-05-31',NULL);
insert into det_fact values ( 7, 22, 3.0);
insert into det_fact values ( 7, 24, 4.0);
insert into det_fact values ( 7, 50, 6.0);
insert into det_fact values ( 7, 53, 8.0);
insert into det_fact values ( 8, 22, 8.0);
insert into det_fact values ( 8, 24, 6.0);
insert into det_fact values ( 8, 50, 7.0);
insert into det_fact values ( 8, 53, 12.0);

call sp_rep_vtasxproducto();

select * from cliente;
select * from factura;
select * from articulo;
select * from det_fact;