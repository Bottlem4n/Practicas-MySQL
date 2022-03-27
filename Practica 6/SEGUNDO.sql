DELIMITER $$

DROP procedure if exists reporteFacturas $$
create procedure reporteFacturas()
BLOCK1: BEGIN
    
	DECLARE finished INTEGER DEFAULT 0;
    
    DECLARE id INT;
    DECLARE nombre_cliente VARCHAR(50);
    DECLARE id_factura INT;
    DECLARE id_articulo INT;
    DECLARE nombre_articulo VARCHAR(30);
    DECLARE cantidad_articulo FLOAT;
	
    DECLARE cte_prod_cursor CURSOR FOR SELECT id_cliente, nomb_clie FROM cliente ORDER BY id_cliente;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
    

    OPEN cte_prod_cursor;
    
    obtenerClienteProductos: LOOP
		FETCH NEXT FROM cte_prod_cursor INTO id, nombre_cliente;
        IF finished = 1 THEN
			LEAVE obtenerClienteProductos;
		END IF;
        
        BLOCK2: BEGIN
		DECLARE final INTEGER DEFAULT 0;
        DECLARE prod_fact_cursor CURSOR FOR SELECT fa.id_fact, art.id_art, art.nom_art, det_fact.cant_art FROM det_fact join factura as fa on det_fact.id_fact = fa.id_fact and
					fa.id_cliente = id join articulo art on det_fact.id_art = art.id_art;
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET final = 1; 
        
        OPEN prod_fact_cursor;
        getFacturas: LOOP
        FETCH NEXT FROM  prod_fact_cursor INTO id_factura, id_articulo, nombre_articulo, cantidad_articulo;
        IF final <> 0 THEN
			SELECT "Facturas del Cliente: " as '', id as '', nombre_cliente as '','' UNION
            SELECT '','','','' UNION
            SELECT "No Hay Productos Facturados al Cliente", "", "", "";
            LEAVE getFacturas;
		END IF;
        
            SELECT "Facturas del Cliente: " as '', id as '', nombre_cliente as '','' UNION
            SELECT '','','','' UNION
            SELECT "Fact.", "Prod", "Nombre", "Cantidad" UNION
            SELECT fa.id_fact, art.id_art, art.nom_art, det_fact.cant_art FROM det_fact join factura as fa on det_fact.id_fact = fa.id_fact and
					fa.id_cliente = id join articulo art on det_fact.id_art = art.id_art;
			LEAVE getFacturas;
        END LOOP getFacturas;
        CLOSE prod_fact_cursor;
        END BLOCK2;

	END LOOP obtenerClienteProductos;
    CLOSE cte_prod_cursor;
    
END BLOCK1;
$$
DELIMITER ;

call reporteFacturas();

select * from cliente;
select * from factura;
select * from articulo;
select * from det_fact;