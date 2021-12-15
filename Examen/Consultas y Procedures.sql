use partidos01;
select @@AUTOCOMMIT;
set autocommit = 0;

-- Cree un store procedure sp_cons_equipos , 
-- que contenga una consulta que muestre el nombre del equipo, 
-- el nombre del jugador, los goles anotados y la posición de este para el equipo solicitado

DELIMITER $$ 
CREATE PROCEDURE `sp_cons_equipos` (Equipo varchar(30))
BEGIN

	set @cont = 0;

	select @cont:= @cont+1 as Lista, NombresEquipos.nom_equipo as Nombre_Equipo, jugadores.nom_jug as Nombre_Jugador
		,jugadores.goles_anotados as Goles_Anotados, jugadores.posicion as Posicion
        from (jugadores left join equipos on jugadores.num_eqpo = equipos.nom_equipo)
        join equipos as NombresEquipos on NombresEquipos.num_eqpo = jugadores.num_eqpo where NombresEquipos.nom_equipo in (Equipo);
	
END
$$
DELIMITER ;

-- Drop procedure sp_cons_equipos;
call sp_cons_equipos ('AMERICA');
call sp_cons_equipos ('SANTOS');
call sp_cons_equipos ('LEON');
call sp_cons_equipos ('TOLUCA');
call sp_cons_equipos ('CRUZ AZUL');
call sp_cons_equipos ('MORELIA');
call sp_cons_equipos ('CHIVAS');
call sp_cons_equipos ('CHIAPAS FC');

-- Cree una consulta que muestre la semana en que se enfrentaron, 
-- el nombre del equipo local, los goles del equipo local,
-- el nombre del equipo visitante, los goles del equipo visitante y
-- el equipo ganador o empate para todos los partidos celebrados.

select partidos.semana as Semana, locales.nom_equipo as Local, partidos.goles_loc as Goles_Local
		, visitantes.nom_equipo as Visitante , partidos.goles_vis as Goles_Visiante
        , 
        (
			CASE
				WHEN (partidos.goles_loc - partidos.goles_vis) < 0 THEN visitantes.nom_equipo
                WHEN (partidos.goles_loc - partidos.goles_vis) > 0 THEN locales.nom_equipo
                ELSE '-EMPATE-'
            END
        ) as Ganador
        from(partidos left join equipos as locales on partidos.num_eqpo_loc = locales.num_eqpo)
        left join equipos as visitantes on partidos.num_eqpo_vis = visitantes.num_eqpo;

-- Cree un store procedure sp_cons_partidos , que contenga tres consultas:
-- 1) Una que muestre cuantos partidos lleva jugados el equipo solicitado
-- 2) Otra que muestre la semana en que se enfrentaron, el nombre del equipo local, los goles del equipo local, el nombre del equipo visitante, los goles del equipo visitante y el equipo ganador o empate y los puntos obtenidos del equipo solicitado para todos sus partidos celebrados.
-- 3) La ultima que nos diga cuantos puntos a obtenido.



DELIMITER $$ 
CREATE PROCEDURE `sp_cons_partidos` (Equipo varchar(30))
BEGIN

		set @cont_part = 1;
        set @Nom_Equipo = Equipo;
		set @Num_Equipo = (select num_eqpo from equipos where nom_equipo = @Nom_Equipo);

		select ('Partidos Jugados del Equipo:') as ' ' ,equipos.nom_equipo as Nombre_Equipo, (sum(@cont_part)) as Num_Partidos
				from (partidos left join  equipos on equipos.num_eqpo = @Num_Equipo) 
				where num_eqpo_loc =@Num_Equipo or num_eqpo_vis = @Num_Equipo;
                
				 select partidos.semana as Semana, locales.nom_equipo as Local, partidos.goles_loc as Goles_Local
				, visitantes.nom_equipo as Visitante , partidos.goles_vis as Goles_Visiante
				,(CASE
						WHEN (partidos.goles_loc - partidos.goles_vis) < 0 THEN visitantes.nom_equipo
						WHEN (partidos.goles_loc - partidos.goles_vis) > 0 THEN locales.nom_equipo
						ELSE '-EMPATE-'
					END) as Ganador
				, (CASE
						WHEN (CASE
									WHEN (partidos.goles_loc - partidos.goles_vis) < 0 THEN visitantes.nom_equipo
									WHEN (partidos.goles_loc - partidos.goles_vis) > 0 THEN locales.nom_equipo
									ELSE '-EMPATE-'
								END) = @Nom_Equipo THEN 3
						WHEN (CASE
									WHEN (partidos.goles_loc - partidos.goles_vis) < 0 THEN visitantes.nom_equipo
									WHEN (partidos.goles_loc - partidos.goles_vis) > 0 THEN locales.nom_equipo
									ELSE '-EMPATE-' 
								END) = '-EMPATE-' THEN 1
						ELSE 0 
					END) as Puntos_Ganados
				from(partidos left join equipos as locales on partidos.num_eqpo_loc = locales.num_eqpo)
				left join equipos as visitantes on partidos.num_eqpo_vis = visitantes.num_eqpo
				where num_eqpo_loc =@Num_Equipo or num_eqpo_vis = @Num_Equipo;
				

		select sum(Puntos_Ganados) as Total_Puntos from (

		select partidos.semana as Semana, locales.nom_equipo as Local, partidos.goles_loc as Goles_Local
				, visitantes.nom_equipo as Visitante , partidos.goles_vis as Goles_Visiante
				,(CASE
						WHEN (partidos.goles_loc - partidos.goles_vis) < 0 THEN visitantes.nom_equipo
						WHEN (partidos.goles_loc - partidos.goles_vis) > 0 THEN locales.nom_equipo
						ELSE '-EMPATE-'
					END) as Ganador
				, (CASE
						WHEN (CASE
									WHEN (partidos.goles_loc - partidos.goles_vis) < 0 THEN visitantes.nom_equipo
									WHEN (partidos.goles_loc - partidos.goles_vis) > 0 THEN locales.nom_equipo
									ELSE '-EMPATE-'
								END) = @Nom_Equipo THEN 3
						WHEN (CASE
									WHEN (partidos.goles_loc - partidos.goles_vis) < 0 THEN visitantes.nom_equipo
									WHEN (partidos.goles_loc - partidos.goles_vis) > 0 THEN locales.nom_equipo
									ELSE '-EMPATE-' 
								END) = '-EMPATE-' THEN 1
						ELSE 0 
					END) as Puntos_Ganados
				from(partidos left join equipos as locales on partidos.num_eqpo_loc = locales.num_eqpo)
				left join equipos as visitantes on partidos.num_eqpo_vis = visitantes.num_eqpo
				where num_eqpo_loc =@Num_Equipo or num_eqpo_vis = @Num_Equipo

		) as Semanas_Enfrentamientos;
		
END
$$
DELIMITER ;

-- Drop procedure sp_cons_partidos;
call sp_cons_partidos ('AMERICA');
call sp_cons_partidos ('SANTOS');
call sp_cons_partidos ('LEON');
call sp_cons_partidos ('TOLUCA');
call sp_cons_partidos ('CRUZ AZUL');
call sp_cons_partidos ('MORELIA');
call sp_cons_partidos ('CHIVAS');
call sp_cons_partidos ('CHIAPAS FC');

-- Cree la tabla siguiente en la base de datos partidos01 creada en el punto
create table general 
(
	equipo varchar (30),
    partidos_jug int,
    partidos_gana int,
    partidos_emp int,
    partidos_perd int,
    puntos int,
    primary key (equipo)
);

select * from general;
COMMIT;
-- drop table general;

-- Cree un store procedure para calcular la estadística y cargarla a la tabla General con los partidos jugados hasta la semana 4, al final debe contener una consulta que arroje la información de la tabla general select * from general

DELIMITER $$ 
CREATE PROCEDURE `sp_tablageneral` ()
BEGIN
		SET SQL_SAFE_UPDATES = 0;
		delete from general;
		insert into general (select equipos.nom_equipo as Equipo
		, sum((equipos.num_eqpo = partidos.num_eqpo_loc or equipos.num_eqpo = partidos.num_eqpo_vis)) as Partidos_Jugados
		, sum((CASE
					WHEN equipos.num_eqpo = partidos.num_eqpo_loc and (partidos.goles_loc - partidos.goles_vis) > 0 THEN 1
					WHEN equipos.num_eqpo = partidos.num_eqpo_vis and (partidos.goles_loc - partidos.goles_vis) < 0 THEN 1
					ELSE 0
			END 
			)) as Partidos_Ganados
		,sum((CASE
					WHEN equipos.num_eqpo = partidos.num_eqpo_loc and (partidos.goles_loc - partidos.goles_vis) = 0 THEN 1
					WHEN equipos.num_eqpo = partidos.num_eqpo_vis and (partidos.goles_loc - partidos.goles_vis) = 0 THEN 1
					ELSE 0
			END 
			)) as Partidos_Empatados
		, sum((CASE
					WHEN equipos.num_eqpo = partidos.num_eqpo_loc and (partidos.goles_loc - partidos.goles_vis) < 0 THEN 1
					WHEN equipos.num_eqpo = partidos.num_eqpo_vis and (partidos.goles_loc - partidos.goles_vis) > 0 THEN 1
					ELSE 0
			END 
			)) as Partidos_Perdidos
		,sum((CASE
					WHEN equipos.num_eqpo = partidos.num_eqpo_loc and (partidos.goles_loc - partidos.goles_vis) > 0 THEN 3
					WHEN equipos.num_eqpo = partidos.num_eqpo_vis and (partidos.goles_loc - partidos.goles_vis) < 0 THEN 3
					WHEN equipos.num_eqpo = partidos.num_eqpo_loc and (partidos.goles_loc - partidos.goles_vis) = 0 THEN 1
					WHEN equipos.num_eqpo = partidos.num_eqpo_vis and (partidos.goles_loc - partidos.goles_vis) = 0 THEN 1
					ELSE 0
			END 
			)) as Puntos
		from (equipos left join partidos on equipos.num_eqpo = partidos.num_eqpo_loc or equipos.num_eqpo = partidos.num_eqpo_vis ) group by equipos.nom_equipo order by equipos.nom_equipo
		);

		SET SQL_SAFE_UPDATES = 1;
        select * from general;

END
$$
DELIMITER ;


call sp_tablageneral ();
ROLLBACK;


-- Semana 5 cargar esta semana de partidos para la segunda corrida
insert into partidos (semana,num_eqpo_loc,num_eqpo_vis,goles_loc, Goles_vis) values (5,5,1,2,0);
insert into partidos (semana,num_eqpo_loc,num_eqpo_vis,goles_loc, Goles_vis) values (5,6,2,1,2);
insert into partidos (semana,num_eqpo_loc,num_eqpo_vis,goles_loc, Goles_vis) values (5,7,3,3,2);
insert into partidos (semana,num_eqpo_loc,num_eqpo_vis,goles_loc, Goles_vis) values (5,8,4,2,2);

select * from partidos;

call sp_tablageneral ();