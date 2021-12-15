DELIMITER $$

DROP procedure if exists primerCursor $$
create procedure primerCursor()
BEGIN
    
	DECLARE finished INTEGER DEFAULT 0;
    
    DECLARE id INT;
    DECLARE nombre VARCHAR(40);
    DECLARE rfc VARCHAR(11);
    DECLARE tel VARCHAR(15);
    DECLARE dir VARCHAR(40);
    DECLARE suspendido BIT;
	
    DECLARE cliente_cursor CURSOR FOR SELECT * FROM cliente;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
    
    OPEN cliente_cursor;
    
    obtenerNombre: LOOP
		FETCH NEXT FROM cliente_cursor INTO id,nombre,rfc,tel,dir,suspendido;
        IF finished = 1 THEN
			LEAVE obtenerNombre;
		END IF;
		
        SELECT id as id_cliente,nombre as nomb_clie,rfc as rfc_clie,tel as tel_clie,dir as dir_clie,suspendido;
	END LOOP obtenerNombre;
        
    CLOSE cliente_cursor;
    
END
$$
DELIMITER ;

call primerCursor();

select * from cliente;