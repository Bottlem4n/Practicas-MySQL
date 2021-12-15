use revistas;

-- Una consulta que nos muestre información de las revistas con su frecuencia y los ejemplares editados
select revista.id_rev as No_Rev, revista.nom_rev as Nombre_Revista,
		frecuencia.nomb_frec as Frecuencia, 
        ejemplar.id_ejem as No_Eje, date_format(ejemplar.fecha_ejem,'%d/%m/%y') as Fecha, concat('$ ', FORMAT(ejemplar.precio_ejem, 2)) as Precio, ejemplar.num_pag_ejem as No_Pags
        from (revista left join frecuencia on revista.id_frec = frecuencia.id_frec)
        join ejemplar on revista.id_rev = ejemplar.id_rev;
        
-- Una consulta que nos muestre La información del Ejemplar con los Articulos que contiene
select revista.nom_rev as Nombre_Revista,
		frecuencia.nomb_frec as Frecuencia,
        ejemplar.id_ejem as No_Eje, date_format(ejemplar.fecha_ejem,'%d/%m/%y') as Fecha,
        articulo.nom_art as Articulo, articulo.num_pag_art as Pags_Art
        from (ejem_art left join revista on ejem_art.id_rev = revista.id_rev)
        join frecuencia on revista.id_frec = frecuencia.id_frec
        join ejemplar on ejem_art.id_ejem = ejemplar.id_ejem and ejem_art.id_rev = ejemplar.id_rev
        join articulo on ejem_art.id_art = articulo.id_art order by Frecuencia asc, No_Eje asc;

-- Una consulta que nos muestre los artículos que ha escrito un autor, ordenar x el id_art
        
select autor.id_autor as Id_autor, autor.nom_aut as Autor_o_Pseudo, autores.nom_aut as Autor_Real
        ,articulos.id_art as Id_art, articulos.nom_art as Nombre_Articulo
        from (autor left join art_aut on art_aut.id_autor = autor.id_autor)
        left join autor as autores on autor.pseudo_id = autores.id_autor
        join articulo as articulos on art_aut.id_art = articulos.id_art order by Id_art asc;