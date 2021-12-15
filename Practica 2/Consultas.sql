Use complejo;

-- Una consulta que nos muestre información de los depto. Y saber si esta rentado
select depto.id_depto as Depto, inquilino.nombre as Nomb_inq, clasificacion.descrip_clasificacion as Clasif,
		depto.num_rec as Num_Rec, depto.chimenea, depto.lavaplatos, depto.cocina_int, if( isnull(inquilino.nombre) ,"NO","SI") as Rentado
        from(depto left join inquilino on depto.id_inquilino = inquilino.id_inquilino)
        join clasificacion on depto.id_clasificacion = clasificacion.id_clasificacion order by depto.id_depto;
        

-- Una consulta que nos muestre el monto de las rentas a cobrar
select inquilino.id_inquilino as Id_inq , inquilino.nombre as Nombre, inquilino.telefono as Telefono, 
	depto.id_depto as Depto, clasificaciones.descrip_clasificacion as Clasif, concat('$ ', FORMAT(rentas.monto_renta, 2)) as M_Renta
	from (inquilino left join depto on inquilino.id_inquilino = depto.id_inquilino)
    join clasificacion as clasificaciones on depto.id_clasificacion = clasificaciones.id_clasificacion 
    join clasificacion as rentas on depto.id_clasificacion = rentas.id_clasificacion
    order by inquilino.nombre;
    
-- Una consulta que nos muestre la Clasificación del depto, los cajones de estacionamiento asociados
select distinct inquilino.id_inquilino as Id_inq, inquilino.nombre as  Nombre,
		depto.id_depto as No_Depto,
        clasificaciones.descrip_clasificacion as Clasificacion,
        cajon.id_cajon as Cajon, ubicaciones.ubicacion as Ubicacion
        from (inquilino left join depto on inquilino.id_inquilino = depto.id_inquilino)
        join clasificacion as clasificaciones on depto.id_clasificacion = clasificaciones.id_clasificacion
        join cajon on depto.id_depto = cajon.id_depto
        join cajon as ubicaciones on depto.id_depto = ubicaciones.id_depto;
        
-- Una consulta que muestre las características asociadas a un Depto
select depto.id_depto as No_Depto, clasificaciones.descrip_clasificacion as Clasificacion,
		depto_caracteristicas.id_caract as Id_Caract, caracteristica.descrip_caract,concat('$ ', FORMAT(caracteristica.monto_car, 2)) as monto
        from(depto right join depto_caracteristicas on depto.id_depto = depto_caracteristicas.id_depto)
        left join clasificacion as clasificaciones on depto.id_clasificacion = clasificaciones.id_clasificacion
        left join caracteristica on depto_caracteristicas.id_caract = caracteristica.id_caract ;
        